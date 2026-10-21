#!/usr/bin/env bash
# gcp-free-tier-guard: check that Compute Engine VMs stay inside the GCP Always Free tier.
# Free tier (per https://cloud.google.com/free/docs/free-cloud-features, checked 2026-10):
#   - 1 non-preemptible e2-micro per month in us-west1, us-central1 or us-east1
#   - 30 GB-months standard persistent disk
#   - 1 GB egress from North America per month, EXCLUDING China and Australia destinations
set -euo pipefail
FREE_REGIONS="us-west1 us-central1 us-east1"
PROJECT="${1:-$(gcloud config get-value project 2>/dev/null)}"
[ -z "$PROJECT" ] && { echo "usage: $0 <project-id>"; exit 1; }
warn=0
echo "== Project: $PROJECT"
while IFS=$'\t' read -r name zone mtype sched; do
  [ -z "$name" ] && continue
  region="${zone%-*}"; mtype="${mtype##*/}"
  echo "-- VM $name ($zone, $mtype)"
  [ "$mtype" != "e2-micro" ] && { echo "   ! not e2-micro: billed"; warn=1; }
  [[ " $FREE_REGIONS " != *" $region "* ]] && { echo "   ! region $region not free"; warn=1; }
  [ "$sched" = "True" ] && { echo "   ! spot/preemptible is not covered"; warn=1; }
done < <(gcloud compute instances list --project "$PROJECT" \
  --format="value[separator='\t'](name,zone.basename(),machineType,scheduling.preemptible)")
count=$(gcloud compute instances list --project "$PROJECT" --filter="machineType~e2-micro" --format="value(name)" | wc -l)
[ "$count" -gt 1 ] && { echo "! $count e2-micro VMs: free hours cover only one running all month"; warn=1; }
total=0
while IFS=$'\t' read -r dname size dtype; do
  [ -z "$dname" ] && continue
  dtype="${dtype##*/}"
  [ "$dtype" != "pd-standard" ] && { echo "! disk $dname is $dtype (only pd-standard is free)"; warn=1; }
  total=$((total+size))
done < <(gcloud compute disks list --project "$PROJECT" --format="value[separator='\t'](name,sizeGb,type)")
echo "== Standard disk total: ${total} GB (free: 30 GB)"
[ "$total" -gt 30 ] && warn=1
echo "== Reminder: egress to China/Australia is never free; >1 GB/month elsewhere is billed."
[ "$warn" = 0 ] && echo "OK: looks free-tier only." || echo "WARNING: something above may be billed."
exit $warn

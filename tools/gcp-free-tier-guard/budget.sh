#!/usr/bin/env bash
# Create a $1 budget alert on a billing account so any charge emails you.
# usage: ./budget.sh <BILLING_ACCOUNT_ID>
set -euo pipefail
BA="${1:?billing account id (gcloud billing accounts list)}"
gcloud billing budgets create --billing-account="$BA" \
  --display-name="free-tier-guard" --budget-amount=1USD \
  --threshold-rule=percent=0.01 --threshold-rule=percent=0.5 --threshold-rule=percent=1.0

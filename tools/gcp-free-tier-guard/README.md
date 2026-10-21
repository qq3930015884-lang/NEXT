# gcp-free-tier-guard

检查你的 Google Cloud 免费小鸡（e2-micro）会不会被偷偷扣费，并一键设 1 美元预算告警。
Check that your GCP e2-micro really stays inside the Always Free tier, and add a $1 budget alert.

## 为什么需要
很多教程说“绑卡的谷歌号 = 一台免费 VPS / 永久梯子”。按官方文档，免费层只包括：
- 每月 1 台非抢占式 e2-micro，且只限 us-west1 / us-central1 / us-east1
- 30 GB 标准永久磁盘（pd-standard）
- 每月 1 GB 北美出站流量，**不含发往中国和澳大利亚的流量**

选错区域、用了 balanced 盘、开了两台、或者当梯子从国内连，都会产生费用。

## 用法
```bash
./guard.sh <project-id>        # 检查区域/机型/磁盘
./budget.sh <billing-account>  # 设 1 美元预算告警
```
需要已安装并登录 `gcloud`。

Source: https://cloud.google.com/free/docs/free-cloud-features
License: MIT

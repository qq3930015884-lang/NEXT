# ☁️ Free Tier Guide：云服务与 AI API 免费额度对照 + 防超支工具

> 帮开发者在免费额度内做原型和学习：只收录官方文档写明的额度，标出容易产生费用的地方，并提供检查脚本。X：[@wizh321000](https://x.com/wizh321000)
>
> 额度变化欢迎提 Issue / PR，每条都需附官方链接。

- [☁️ 免费云服务器（永久免费层）](#️-免费云服务器永久免费层)
- [🔑 免费 AI API](#-免费-ai-api)
- [🛠 工具：GCP 免费层合规检查](#-工具gcp-免费层合规检查)
- [🤖 好用的 AI 工具与开源项目](#-好用的-ai-工具与开源项目)

## ☁️ 免费云服务器（永久免费层）

| 平台 | 永久免费给什么 | 容易产生费用的地方 | 官方说明 |
|---|---|---|---|
| Google Cloud | 每月 1 台 e2-micro（仅 us-west1 / us-central1 / us-east1）+ 30GB 标准盘 | 需绑定结算账户；每月含 **1GB** 北美出站流量，**发往中国大陆和澳大利亚的流量不在免费范围**；使用 balanced/SSD 盘或第二台实例会计费 | [链接](https://cloud.google.com/free/docs/free-cloud-features) |
| Oracle Cloud | 2 台 AMD Micro（1/8 OCPU、1GB）+ Arm A1 共 2 OCPU / 12GB + 200GB 块存储 + 每月 10TB 出站 | 只能建在注册时选的主区域；热门区常报 “out of host capacity”；**连续 7 天 CPU、网络（A1 还有内存）利用率都低于 20% 可能被回收** | [链接](https://docs.oracle.com/en-us/iaas/Content/FreeTier/freetier_topic-Always_Free_Resources.htm) |
| AWS | 新账号先给 $100 额度，完成任务最多再给 $100，Free 计划内不扣费 | 不是永久：**6 个月或额度用完就自动关户**；想长期用要转付费计划 | [链接](https://aws.amazon.com/free/) |

> 小结：长期运行、流量较大的个人项目更适合 Oracle；GCP 适合低流量的小服务；AWS 适合短期试用。

## 🔑 免费 AI API

| 平台 | 免费能用什么 | 容易产生费用的地方 | 官方说明 |
|---|---|---|---|
| Google Gemini API | Gemini 3.8 Flash、3.6 Flash、3.5 Flash-Lite、2.5 Pro/Flash 等免费层，AI Studio 网页版免费 | 免费层的数据**会被用于改进 Google 产品**；旗舰 Gemini 4 Argon 免费层不可用；有频率限制 | [链接](https://ai.google.dev/gemini-api/docs/pricing) |
| OpenRouter | 模型 ID 以 `:free` 结尾的免费变体 | 免费变体有每分钟/每天请求上限，充过值的账号上限更高；账户余额为负时连免费模型也会报 402 | [链接](https://openrouter.ai/docs/api-reference/limits) |

## 🛠 工具：GCP 免费层合规检查

[`tools/gcp-free-tier-guard`](tools/gcp-free-tier-guard)：一条命令检查 GCP 项目是否仍在免费层范围内（区域、机型、磁盘类型和总量），并设置 1 美元预算告警，避免意外账单。

```bash
./tools/gcp-free-tier-guard/guard.sh <project-id>
./tools/gcp-free-tier-guard/budget.sh <billing-account-id>
```

## 🤖 好用的 AI 工具与开源项目

### AI 编程助手（终端 Agent）
| 项目 | Star | 一句话 |
|---|---|---|
| [anthropics/claude-code](https://github.com/anthropics/claude-code) | 151K | Anthropic 官方终端编程 Agent，能读懂整个代码库 |
| [openai/codex](https://github.com/openai/codex) | 129K | OpenAI 的轻量终端编程 Agent |
| [google-gemini/gemini-cli](https://github.com/google-gemini/gemini-cli) | 107K | 把 Gemini 搬进终端的开源 Agent |

### 💻 本地大模型 & 聊天客户端
| 项目 | Star | 一句话 |
|---|---|---|
| [ollama/ollama](https://github.com/ollama/ollama) | 183K | 一行命令本地跑 DeepSeek、Qwen、Gemma 等模型 |
| [open-webui/open-webui](https://github.com/open-webui/open-webui) | 155K | 好用的网页聊天界面，支持 Ollama 和 OpenAI API |
| [ChatGPTNextWeb/NextChat](https://github.com/ChatGPTNextWeb/NextChat) | 88K | 零配置 AI 聊天助手 |
| [lobehub/lobehub](https://github.com/lobehub/lobehub) | 83K | 多 Agent 协作的 AI 工作台 |
| [CherryHQ/cherry-studio](https://github.com/CherryHQ/cherry-studio) | 52K | 桌面 AI 助手，300+ 预设助手，多模型统一入口 |

### 🔗 工作流 & Agent 平台
| 项目 | Star | 一句话 |
|---|---|---|
| [n8n-io/n8n](https://github.com/n8n-io/n8n) | 207K | 可视化工作流自动化，内置 AI 节点 |
| [langgenius/dify](https://github.com/langgenius/dify) | 158K | 搭 Agent 工作流和 RAG 的一站式平台 |
| [Significant-Gravitas/AutoGPT](https://github.com/Significant-Gravitas/AutoGPT) | 187K | 自主 AI Agent 的开山项目 |
| [browser-use/browser-use](https://github.com/browser-use/browser-use) | 118K | 让 AI 自己操作浏览器的 Python 库 |

### 📚 知识库 & 文档处理
| 项目 | Star | 一句话 |
|---|---|---|
| [infiniflow/ragflow](https://github.com/infiniflow/ragflow) | 92K | 开源 RAG 引擎，深度解析文档做知识库 |
| [microsoft/markitdown](https://github.com/microsoft/markitdown) | 190K | 把 PDF、Word、PPT 一键转成 Markdown 喂给 AI |

### 🎨 图像生成
| 项目 | Star | 一句话 |
|---|---|---|
| [Comfy-Org/ComfyUI](https://github.com/Comfy-Org/ComfyUI) | 137K | 最强节点式 Stable Diffusion 图形界面 |

### 🎬 视频生成
| 项目 | Star | 一句话 |
|---|---|---|
| [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes) | 64.6K | 用 HTML 写视频，让 AI Agent 一键渲染成 MP4 |

### 📡 信息获取
| 项目 | Star | 一句话 |
|---|---|---|
| [Thysrael/Horizon](https://github.com/Thysrael/Horizon) | 9.8K | AI 新闻雷达，自动生成中英文每日简报 |
| [OminousIndustries/PhoneDriver](https://github.com/OminousIndustries/PhoneDriver) | 1.6K | 用 Qwen3-VL 看屏幕自动操作安卓手机（需大显存 GPU） |

---
额度以 2026 年 10 月官方文档为准，Star 数为 2026 年 10 月统计。发现过期信息请提 Issue 🙌

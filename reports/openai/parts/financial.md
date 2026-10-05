# OpenAI 财务拼图与估值研究

数据截止：2026-10-04（已运行 `date`，Asia/Shanghai）。金额统一为十亿美元（B），不是亿美元。用途：学习研究。结论：**融资能力强，实际收入增长快，但无法用公开资料给出可靠普通股价值；在条款与现金流资料缺失下，观望。** 财务可投资性评分：2.5/5，信息完整度：不足。评分评价现金回报可验证性，不评价产品价值。

## 1. 收入口径是最重要的仲裁

| 日期/期间 | 数字（B美元） | 性质 | 来源与置信度 | 采信判断 |
|---|---:|---|---|---|
| 2023年末 | 2 | ARR/年化指标 | CFO官方文章[S1]，2026-01，🟢 | 不是2023已确认收入 |
| 2024年末 | 6 | ARR/年化指标 | 同上 | 不是2024全年收入 |
| 2024全年 | 3.7 | 媒体所见审计文件收入 | Ed Zitron[S2]，2026-06-15，🟡 | 非公司公开财报；FT称独立验证，但本研究无法阅读付费全文 |
| 2025全年 | 13.07 | 同上 | [S2]；FT[S3]及Ars[S4]存在佐证链，🟡 | 最合适的历史收入建模起点，仍有原表不可获取限制 |
| 2025年末 | >20 | ARR/年化指标 | CFO[S1]，🟢 | 和13.07不矛盾：时点与期间不同 |
| 2026-03 | 2/月 | 当期月度规模 | OpenAI[S5]，🟢 | 乘12只是24B年化，不能填成全年实际 |
| 2026-09 | 约70 | 年化收入速度 | Axios[S6]，🟡、单一独立报道 | 不是2026全年收入 |
| 2026全年 | 36 | 预测 | FT材料经Reuters[S7]转述，2026-09-18，🟡 | 未实现预测 |
| 2030全年 | 350 | 预测 | 同一材料[S7]，🟡 | 高增长远期假设，不是事实 |

*计算：2025收入相对2024增长 `13.07/3.7−1=253.24%`。增长能改善估值分母，但尚未证明利润增长。ARR中包含按量API需求，其合同锁定程度也未公开，不宜把它等同高续费SaaS合同收入。*

收入结构、API净收入确认、退款、企业客户集中度、留存率及分产品毛利没有可验证全表。季度季节性亦无法还原。不能用用户数乘订阅标价拼出总收入：付费用户包含不同方案，且API用户与席位重叠。

## 2. 成本、利润与现金流

以下均源于[S2]所见文件（2026-06-15，🟡），缺少公开审计原表，**不列入严格双独立源已验证数据集**。

| 项目（B美元） | 2024 | 2025 | 解释 |
|---|---:|---:|---|
| 收入 | 3.70 | 13.07 | 年度收入 |
| 收入成本 | 2.65 | 7.50 | 不等于全部计算成本；研发训练成本在费用 |
| 研发 | 7.81 | 19.18 | 训练投入不宜全部当一次性可加回 |
| 销售营销 | 1.11 | 5.73 | 消费与企业渠道扩张 |
| 管理 | 0.907 | 1.57 | 组织成本 |
| 总成本费用 | 12.48 | 34.00 | 含收入成本及各费用 |
| 经营损失 | 8.78 | 20.92 | 不等于现金流出 |
| 归属公司净损失 | 5.09 | 38.53 | 重组、非控制权益归属影响很大 |

*2025毛利率代理值 `(13.07−7.5)/13.07=42.62%`；研发/收入 `19.18/13.07=146.75%`。毛利率不能和已覆盖大量成熟产品的微软集团毛利直接比。*

2025另有41.55B可转换权益和认股权负债公允价值变动损失；集团损失和归属公司损失有差别。**38.53B净损失不能用来计算现金跑道**。2026经营现金流、资本开支、当前未受限现金、付款进度、融资实际到账全表缺失。EBITDA也无法可信还原。

最新投资者材料[S7]预测2026—2030累计负自由现金流278B、累计收入840B、计算及基础设施支出856B，并称3月融资现金可能于2028耗尽。这是前瞻材料经媒体转述，不是现金余额实测。多个Reuters转载、Tom's Hardware摘要均来自同一FT材料，不能算多独立证据。旧材料的2029盈利或2029累计烧钱115B等与此口径时间、范围不同；最新材料覆盖至2030，不能拼成一个一致预算。

*简单`278−122=156B`只说明所报未来净现金需求比本轮承诺资本更大，不能称为尚需融资156B：期初现金、条件资本、额度提款、债务和年度分布未纳入。不能用122/278计算现金跑道；未来成本不是均匀发生。*

人均收入、资本效率亦缺少同期间员工口径。累计融资包含战略资金、老股交易及条件资本，不能混入一个分母。

## 3. 融资历史与到款状态

| 时间 | 交易额B | 估值B | 交易性质 | 核验 |
|---|---:|---:|---|---|
| 2024-10-02 | 6.6 | 157投后 | 新融资 | OpenAI[S8]+AP[S9]，🟢 |
| 2025-03-31 | 40 | 300投后 | 新融资公告；分期 | OpenAI[S10]，🟢；软银财报可验证其分期部分 |
| 2025-10 | 6.6 | 500 | 员工老股转让 | AP[S11]+Bloomberg电视独立报道[S12]，🟡 |
| 2026-02-27 | 110承诺 | 730投前/840投后 | 本轮初始公告 | OpenAI[S13]+AP[S14]，🟢 |
| 2026-03-31 | 122承诺 | 852投后 | 同轮最终扩募，非另加一轮122 | OpenAI[S5]+Axios[S15]，🟢 |
| 2026-09-29 | 拟至少30 | 寻求1400投前 | 融资磋商，未成交 | Bloomberg[S16]，🟡；全文获取失败，摘要明确投前 |
| 2026-10-01 | 10 | 沿本轮价格 | 软银第三笔实付 | 软银官方[S17]，🟢 |

老股转让资金流向卖方员工，不能增加公司现金。最新可核实正式融资价格是852B投后，1400B是新融资寻求价。二级SPV报价不代表可以同价成交的直接普通股。

软银[S17]确认本轮30B三笔已全部执行、累计出资64.6B、约13%权益。这个13%是最新披露；微软2025-10-28的27%不能直接放进2026当前股权表，应标历史重组时点。

Amazon SEC 8-K[S18]（2026-02-27）是比新闻标题更有用的现金证据：15B首笔与35B承诺分开；后者在特定里程碑或美国上市较早发生时触发，具体条件部分保密，未投完可能于2028-12-31终止。**没有证据证明截至截止日Amazon50B全到账，也没有证据证明全轮122B全部现金到位。** 软银购买的是优先股、IPO自动转普通股[S19]。清算优先权、参与分配、回购和反稀释条款不能臆测；不给普通股机械20%—40%折价。

战略股东既是投资者又是供应商：Azure新增采购250B（微软[S20]、SEC[S21]）；AWS既有38B增加100B/8年（OpenAI[S22]与Amazon[S23]）。多年采购不是当期资本开支，也不等于立即到期债务。不同合同期限、替换条款、已执行部分未知，不能把云合同、Stargate计划及预测856B机械相加。

## 4. 估值：可核验交易价格不等于可计算内在价值

*financial_rigor验算852/13.07=65.19倍历史收入；852/36=23.67倍预测全年收入；852/70=12.17倍报道年化速度；1400/70=20倍。后三个分母不能冒充已实现全年收入；这是股权估值/收入，缺少净债务，不是EV/Revenue。*

微软、Alphabet、Amazon可以参照算力、平台和成熟利润率，但集团估值含云、广告、电商等现金流，不是纯模型公司可比。Anthropic属私企且财务口径可能类似不透明；交易倍数亦不足提供普通股安全边际。因此不捏造3—5家公司精确P/S、P/E、EV/EBITDA表，不给五种估值机械加权。

### 可复核的终局压力测试（不是可靠DCF或股权估值）

历史起点用2025实际收入13.07B；终点设2030，距2026年末约4年。下表所有终态现金利润率、倍数、折现率均为**研究者敏感性假设🔴**，不声称公司预测。乐观收入350B只是最新材料锚；100B/200B为增长未达目标的压力取值，不是独立预测。

| 输入/输出 | 悲观 | 中性 | 乐观 |
|---|---:|---:|---:|
| 2030收入B | 100 | 200 | 350 |
| 相对2025隐含5年CAGR | 50.23% | 72.56% | 93.00% |
| 2031稳定自由现金流/2030收入代理 | 10% | 20% | 30% |
| 终态FCF倍数 | 20 | 25 | 30 |
| 折现率 | 20% | 15% | 12% |
| 2026—2030负FCF总额压力值B | 278 | 278 | 278 |
| 终态价值现值减过渡烧钱现值B | −96.60 | 361.55 | 1780.26 |

*公式 `代理值=2030收入×终态现金利润率×终态FCF倍数/(1+r)^4−278/(1+r)^2`。把负现金流放在两年中点只是为了清楚展示敏感性；2030仍负FCF而2031突然达到稳定正FCF是刻意简化，现实兑现更慢时价值更低。固定278压力值并非声称三情景成本均相同。负值意味着模型无法覆盖过渡投入，并不代表股权可以负价交易。模型未加当前现金、未减净债务、未分配优先权、未模拟融资稀释；不能称361.55B是中性股权公允价值。*

*在同一代理模型，支撑852B需要2031稳定FCF约74.31B（15%折现、25倍终态、278B中点烧钱）。若收入350B，隐含21.23%稳定FCF率；若200B，需37.16%。这是价格要求什么的检验，不是预测。维持4年15%回报而忽略融资稀释，仅终局股权值就需1490.15B；未来融资将进一步提高要求。*

结论：目前公开资料不足确定保守、中性、乐观普通股内在价值，也不足可靠计算安全边际或年化预期回报。市场价格明显预付收入爆发和利润率改善，但高价格能否成立取决于计算效率、竞争价格、长期采购合同与股东分配条款。

## 5. 验证节点与信息缺口

| 要求 | 为什么重要 | 可接受证据 |
|---|---|---|
| 分季度确认收入与现金收入 | 年化速度可能高估近期收款 | 审计财报、S-1 |
| 推理毛利、训练费用、资本化和股票薪酬 | 识别真正经营杠杆 | 分部成本、现金流调节 |
| 条件资本到账、现金余额和额度提款 | 判断12—24个月生存约束 | 银行证明、资金流量表 |
| 多年采购义务的取消、take-or-pay和担保 | 识别收入不达标时刚性负担 | 重大合同附件 |
| 完全摊薄股权表与优先权 | 公司成功不保证普通股回报 | cap table、章程、股东协议 |
| 老股或SPV费率及转让限制 | 防止间接产品抹去回报 | 管理协议与转让批准 |

最重要三点：①时点ARR与实际年度收入不能混用；②账面净亏损不等于烧钱，多年采购不等于当年支出；③融资承诺不等于现金到账，最新寻求估值不等于成交价。最大盲区是现金流原表和优先股条款，其缺失直接限制普通股投资判断。

## 来源与证据独立性

- [S1] [OpenAI CFO：A business that scales with the value of intelligence](https://openai.com/index/a-business-that-scales-with-the-value-of-intelligence/)，2026-01，官方全文已读。
- [S2] [Ed Zitron：Exclusive: OpenAI Losses Increased Nearly 8X in 2025, With Spending Hitting $34 Billion](https://www.wheresyoured.at/exclusive-openai-financials/)，2026-06-15，原报道全文已读，作者称见到审计资料；资料本身未公开获取。
- [S3] [FT：OpenAI spending hit $34bn last year ahead of planned IPO](https://www.ft.com/content/e15b0d7e-ff6b-4f16-ba7a-4068feddb828)，2026-06-16，付费墙，仅标题可读；不得写成已读审计原表。
- [S4] [Ars Technica：Leaked financial docs show OpenAI is losing billions of dollars a year](https://arstechnica.com/ai/2026/06/leaked-financial-docs-show-openai-is-losing-billions-of-dollars-a-year/)，2026-06，全文已读，属于[S2]/[S3]报道链。
- [S5] [OpenAI：OpenAI raises $122 billion to accelerate the next phase of AI](https://openai.com/index/accelerating-the-next-phase-ai/)，2026-03-31，全文已读。
- [S6] [Axios：Scoop: OpenAI's annual recurring revenue nears $70B](https://www.axios.com/2026/09/29/scoop-openais-annual-recurring-revenue-nears-70b)，2026-09-29，全文已读，单一报道。
- [S7] [Reuters：OpenAI forecasts cash burn near $280 billion by 2030, FT reports](https://www.investing.com/news/economy-news/openai-expects-to-burn-through-almost-280-billion-by-2030-ft-reports-4907970)，2026-09-18，Reuters全文转载已读，非独立验证FT材料。
- [S8] [OpenAI：New funding to scale the benefits of AI](https://openai.com/index/scale-the-benefits-of-ai/)，2024-10-02，检索摘要核验，全文获取失败。
- [S9] [AP：ChatGPT maker OpenAI raises $6.6 billion in fresh funding](https://apnews.com/article/bc9ab24c7affb601d5f650e4aca1b988)，2024-10-02，独立报道。
- [S10] [OpenAI：New funding to build towards AGI](https://openai.com/index/march-funding-updates/)，2025-03-31，全文已读。
- [S11] [AP：OpenAI now worth $500 billion](https://apnews.com/article/53dffc56355460a232439c76d1ccf22b)，2025-10-02，独立信源。
- [S12] [Bloomberg Television：OpenAI Becomes World's Largest Startup With $500 Bln Valuation](https://www.youtube.com/watch?v=7E6JJzx3EZ4)，2025-10-02，官方视频说明，独立信源描述，未转录视频。
- [S13] [OpenAI：Scaling AI for everyone](https://openai.com/index/scaling-ai-for-everyone/)，2026-02-27。
- [S14] [AP：OpenAI gets $110 billion in funding](https://apnews.com/article/a0a915c32b85337d799fe2f9525a932a)，2026-02-27，独立报道。
- [S15] [Axios：OpenAI opens the door to individual investors](https://www.axios.com/2026/03/31/openai-ai-stock-investors-ipo)，2026-03-31，含CFO直接采访，非Reuters转载。
- [S16] [Bloomberg：OpenAI Targets $30 Billion in Funding at $1.4 Trillion Value](https://news.bloomberglaw.com/private-equity/openai-targets-30-billion-in-new-funding-at-1-4-trillion-value)，2026-09-29，Bloomberg Law镜像前三段已读，确认投前且磋商早期，余文订阅限制。
- [S17] [SoftBank：Execution of Follow-on Investment (Third Tranche) in OpenAI](https://group.softbank/en/news/press/20261001)，2026-10-01，官方全文已读。
- [S18] [Amazon SEC Form 8-K](https://www.sec.gov/Archives/edgar/data/1018724/000110465926021050/tm267374d1_8k.htm)，2026-02-27，监管原文已读。
- [S19] [SoftBank：Follow-on Investments in OpenAI](https://group.softbank/en/news/press/20260227)，2026-02-27，官方全文已读。
- [S20] [Microsoft：The next chapter of the Microsoft–OpenAI partnership](https://blogs.microsoft.com/blog/2025/10/28/the-next-chapter-of-the-microsoft-openai-partnership/)，2025-10-28，全文已读；历史条款可能后续变更。
- [S21] [Microsoft SEC 10-Q](https://www.sec.gov/Archives/edgar/data/789019/000119312525256321/msft-20250930.htm)，2025-10，监管披露；与Microsoft博客同一主体，不算两独立主体。
- [S22] [OpenAI：OpenAI and Amazon announce strategic partnership](https://openai.com/index/amazon-partnership/)，2026-02-27，全文已读。
- [S23] [Amazon：Amazon's $50 billion investment in OpenAI: What to know](https://www.aboutamazon.com/news/aws/openai-amazon-partnership-explained)，2026-02-27，交易另一方披露。

计算均调用项目 `python3 tools/financial_rigor.py calc --expr ...`，没有使用推测股数或上市公司PE替代未上市企业价值。已执行中英文检索超过5次，排除截止日后的材料。该分报告尚需team-lead汇总审计，不单独视为可发布成品。

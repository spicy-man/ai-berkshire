from decimal import Decimal as D, getcontext
from pathlib import Path
import json
getcontext().prec=40
cases={
 '保守':dict(services='110',cloud='12',other='-7',group='-18',gs1='.05',gs2='.03',gc1='.12',gc2='.08',expense='.04',discount='.10',terminal='.025'),
 '中性':dict(services='130',cloud='25',other='-5',group='-20',gs1='.08',gs2='.05',gc1='.22',gc2='.12',expense='.05',discount='.09',terminal='.03'),
 '乐观':dict(services='145',cloud='35',other='-3',group='-23',gs1='.10',gs2='.07',gc1='.30',gc2='.16',expense='.06',discount='.085',terminal='.03')}
bridge_inputs={'cash_and_liquid_securities_ex_equity_B':'155.411','debt_B':'100.164','finance_lease_B':'2.590',
 'minimum_operating_cash_assumption_B':'25','listed_equity_current_book_B':'87.063','listed_equity_noncurrent_book_B':'14.126','listed_equity_book_B':'101.189','listed_value_factor_assumption':'.75',
 'nonmarketable_securities_book_B':'131.461','nonmarketable_value_factor_assumption':'.5',
 'preferred_claim_proxy_B':'19.25','noncontrolling_claim_book_proxy_assumption_B':'7.1'}
asset_bridge=(D('155.411')-D('100.164')-D('2.590')-D('25')+D('101.189')*D('.75')+D('131.461')*D('.5')-D('19.25')-D('7.1'))
results=[]
for name, raw in cases.items():
 p={k:D(v) for k,v in raw.items()}
 values={k:p[k] for k in ('services','cloud','other','group')}
 pv={k:D(0) for k in values}
 annual=[]
 for t in range(1,11):
  for k in values:
   g=p[('gs1' if t<=5 else 'gs2')] if k=='services' else p[('gc1' if t<=5 else 'gc2')] if k=='cloud' else p['expense']
   values[k]*=(1+g);pv[k]+=values[k]/(1+p['discount'])**t
  annual.append({k:str(v) for k,v in values.items()})
 for k in values:
  pv[k]+=values[k]*(1+p['terminal'])/(p['discount']-p['terminal'])/(1+p['discount'])**10
 terminal_total=sum(values.values())*(1+p['terminal'])/(p['discount']-p['terminal'])/(1+p['discount'])**10
 operating=sum(pv.values());equity=operating+asset_bridge;price=equity/D('12.230')
 results.append({'case':name,'assumptions':raw,'start_total_FCFF_B':str(sum(p[k] for k in values)),
                 'annual_cash_flows_B':annual,'PV_by_segment_B':{k:str(v) for k,v in pv.items()},
                 'operating_value_B':str(operating),'terminal_value_pct':str(terminal_total/operating*100),'asset_bridge_B':str(asset_bridge),
                 'equity_value_B':str(equity),'value_per_share_USD':str(price),
                 'vs_340_92_pct':str((price/D('340.92')-1)*100),
                 'illustrative_25pct_margin_price_USD':str(price*D('.75'))})
examples={'A_task_cost':str(D(100)*10),'B_task_cost':str(D(150)*8),
 'migration_net_saving_base_million':str(D(10)*D('.2')-D('.5')),
 'migration_payback_base_years':str(D('1.5')/(D(10)*D('.2')-D('.5'))),
 'migration_payback_stress_years':str(D('1.5')/(D(10)*D('.1')-D('.5'))),
 'internal_cost_volume_illustration':str(D(100)*D('.7')*D('1.5')),
 'all_cost_saving_pct':str((D(120)-D(115))/D(120)*100),
 'migration_payback_months':str(D(60)/(D(120)-D(115))),
 'goodput_example_pct':str(D(100)/D(125)*100),
 'four_year_depreciation':str(D(100)/4),'six_year_depreciation':str(D(100)/6),
 'depreciation_difference':str(D(100)/4-D(100)/6)}
sensitivity=[]
base=results[1]
for r in (D('.08'),D('.09'),D('.10')):
 for g in (D('.02'),D('.03'),D('.04')):
  annual=[sum(D(v) for v in row.values()) for row in base['annual_cash_flows_B']]
  op=sum(c/(1+r)**t for t,c in enumerate(annual,1))+annual[-1]*(1+g)/(r-g)/(1+r)**10
  sensitivity.append({'discount_WACC':str(r),'terminal_growth':str(g),'per_share_USD':str((op+asset_bridge)/D('12.230'))})
out={'status':'illustrative valuation hypotheses, not forecasts or audited fair values',
 'units':'FCFF and assets USD billion; shares billion; prices USD',
 'cash_flow_start':'hypothetical normalized year0 circa2026, not reported financial metric',
 'shares':'12.230B fixed proxy; SBC treated as economic cost in assumed operating cash; preferred deduction is analytical proxy, not actual settlement forecast',
 'asset_bridge_inputs':bridge_inputs,
 'asset_bridge_formula':'cash_ex_equity - debt - finance_lease - minimum_cash + listed_book * listed_factor + nonmarketable_book * nonmarketable_factor - preferred_proxy - NCI_book_proxy',
 'FCFF_scope':'hypothetical consolidated operating FCFF before all financing interest/principal, including ordinary debt and finance leases, including economic reinvestment and SBC; noncontrolling claim proxy separately deducted; not reconciled to reported normalized FCFF',
 'discount_scope':'assumed WACC approximation; not equity cost',
 'cases':results,'base_case_sensitivity':sensitivity,'examples':examples}
Path(__file__).with_name('模型计算与假设.json').write_text(json.dumps(out,ensure_ascii=False,indent=2))
for r in results:print(r['case'], 'PV', round(D(r['operating_value_B']),2),'per share',round(D(r['value_per_share_USD']),2),'margin',round(D(r['illustrative_25pct_margin_price_USD']),2),'upside',round(D(r['vs_340_92_pct']),2))
print('asset bridge',asset_bridge)

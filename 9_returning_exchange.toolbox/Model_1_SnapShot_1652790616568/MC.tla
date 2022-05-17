---- MODULE MC ----
EXTENDS 9_returning_exchange, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652790613483295000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652790613484296000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652790613484297000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652790613484298000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652790613484299000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652790613484300000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652790613484301000 == 
{50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652790613484302000 == 
{"v1"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1652790613484303000 ==
\E coin \in cointypes : vending_machines["v1"].assets.credit[coin] < 2
----
=============================================================================
\* Modification History
\* Created Tue May 17 14:30:13 CEST 2022 by dirk-janswagerman

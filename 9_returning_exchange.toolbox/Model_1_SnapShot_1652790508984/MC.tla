---- MODULE MC ----
EXTENDS 9_returning_exchange, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652790505945235000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652790505945236000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652790505945237000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652790505945238000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652790505945239000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652790505945240000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652790505945241000 == 
{50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652790505945242000 == 
{"v1"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1652790505945243000 ==
\A coin \in cointypes : vending_machines["v1"].assets.credit[coin] < 2
----
=============================================================================
\* Modification History
\* Created Tue May 17 14:28:25 CEST 2022 by dirk-janswagerman

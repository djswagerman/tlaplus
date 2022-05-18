---- MODULE MC ----
EXTENDS 11_deliver_product_no_checks, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_16527928895542000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_16527928895553000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_16527928895554000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_16527928895555000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_16527928895556000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_16527928895557000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_16527928895558000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_16527928895559000 == 
{"v1"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_165279288955510000 ==
customers["c1"].assets.product["saffron_sky"] < 1
\/
customers["c1"].assets.product["ocean_blue"] < 1
----
=============================================================================
\* Modification History
\* Created Tue May 17 15:08:09 CEST 2022 by dirk-janswagerman

---- MODULE MC ----
EXTENDS 11_deliver_product_no_checks, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652792840884565000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652792840885566000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652792840885567000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652792840885568000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652792840885569000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652792840885570000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652792840885571000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652792840885572000 == 
{"v1"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1652792840888573000 ==
customers["c1"].assets.product["saffron_sky"] < 1
\/
customers["c1"].assets.product["ocean_blue"] < 1
----
=============================================================================
\* Modification History
\* Created Tue May 17 15:07:20 CEST 2022 by dirk-janswagerman

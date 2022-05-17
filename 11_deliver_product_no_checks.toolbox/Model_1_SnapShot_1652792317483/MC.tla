---- MODULE MC ----
EXTENDS 11_deliver_product_no_checks, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652792311639535000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652792311639536000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652792311639537000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652792311639538000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652792311639539000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652792311639540000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652792311639541000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652792311639542000 == 
{"v1"}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1652792311639543000 ==
customers["c1"].assets.product["saffron_sky"] < 2
----
=============================================================================
\* Modification History
\* Created Tue May 17 14:58:31 CEST 2022 by dirk-janswagerman

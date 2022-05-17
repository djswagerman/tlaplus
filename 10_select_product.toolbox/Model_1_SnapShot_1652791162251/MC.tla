---- MODULE MC ----
EXTENDS 10_select_product, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652791159198358000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652791159198359000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652791159198360000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652791159198361000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652791159198362000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652791159198363000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652791159198364000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652791159198365000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 14:39:19 CEST 2022 by dirk-janswagerman

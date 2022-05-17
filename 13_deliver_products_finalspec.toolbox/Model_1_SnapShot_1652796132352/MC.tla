---- MODULE MC ----
EXTENDS 13_deliver_products_finalspec, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652796116754399000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652796116754400000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652796116754401000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652796116754402000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652796116754403000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652796116754404000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652796116754405000 == 
{25, 50, 100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652796116754406000 == 
{"v1"}
----

\* CONSTANT definitions @modelParameterConstants:8customer_cash
const_1652796116754407000 == 
1000
----

=============================================================================
\* Modification History
\* Created Tue May 17 16:01:56 CEST 2022 by dirk-janswagerman

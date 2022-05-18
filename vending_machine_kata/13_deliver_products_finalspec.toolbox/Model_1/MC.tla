---- MODULE MC ----
EXTENDS 13_deliver_products_finalspec, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652796155726422000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652796155726423000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652796155726424000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652796155726425000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652796155726426000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652796155726427000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652796155726428000 == 
{25, 50, 100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652796155726429000 == 
{"v1"}
----

\* CONSTANT definitions @modelParameterConstants:8customer_cash
const_1652796155726430000 == 
1000
----

=============================================================================
\* Modification History
\* Created Tue May 17 16:02:35 CEST 2022 by dirk-janswagerman

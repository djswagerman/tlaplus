---- MODULE MC ----
EXTENDS 13_deliver_products_finalspec, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652794980371234000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652794980371235000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652794980371236000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652794980371237000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652794980371238000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652794980371239000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652794980371240000 == 
{25, 50, 100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652794980371241000 == 
{"v1"}
----

\* CONSTANT definitions @modelParameterConstants:8customer_cash
const_1652794980371242000 == 
500
----

=============================================================================
\* Modification History
\* Created Tue May 17 15:43:00 CEST 2022 by dirk-janswagerman

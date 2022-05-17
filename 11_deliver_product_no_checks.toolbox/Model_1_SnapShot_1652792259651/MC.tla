---- MODULE MC ----
EXTENDS 11_deliver_product_no_checks, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652792252596496000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652792252596497000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652792252596498000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652792252596499000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652792252596500000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652792252596501000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652792252596502000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652792252596503000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 14:57:32 CEST 2022 by dirk-janswagerman

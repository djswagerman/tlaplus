---- MODULE MC ----
EXTENDS 11_deliver_product_no_checks, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652792196415487000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652792196415488000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652792196415489000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652792196415490000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652792196415491000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652792196415492000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652792196415493000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652792196415494000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 14:56:36 CEST 2022 by dirk-janswagerman

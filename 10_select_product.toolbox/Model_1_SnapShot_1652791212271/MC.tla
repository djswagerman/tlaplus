---- MODULE MC ----
EXTENDS 10_select_product, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652791208228376000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652791208228377000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652791208228378000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652791208228379000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652791208228380000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652791208228381000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652791208228382000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652791208228383000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 14:40:08 CEST 2022 by dirk-janswagerman

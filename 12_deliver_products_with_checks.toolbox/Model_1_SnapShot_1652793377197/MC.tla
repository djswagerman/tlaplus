---- MODULE MC ----
EXTENDS 12_deliver_products_with_checks, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_16527933699932000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_16527933699953000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_16527933699954000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_16527933699955000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_16527933699956000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_16527933699957000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_16527933699958000 == 
{25, 50, 100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_16527933699959000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 15:16:09 CEST 2022 by dirk-janswagerman

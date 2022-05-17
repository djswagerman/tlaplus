---- MODULE MC ----
EXTENDS 7_first_action, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_1652769255534207000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_1652769255534208000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_1652769255534209000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_1652769255534210000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_1652769255534211000 == 
0
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652769255534212000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652769255534213000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652769255534214000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 08:34:15 CEST 2022 by dirk-janswagerman

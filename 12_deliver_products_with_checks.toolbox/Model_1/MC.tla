---- MODULE MC ----
EXTENDS 12_deliver_products_with_checks, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_165279367081071000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_165279367081072000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_165279367081073000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_165279367081074000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_165279367081075000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_165279367081076000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_165279367081077000 == 
{25, 50, 100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_165279367081078000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 15:21:10 CEST 2022 by dirk-janswagerman

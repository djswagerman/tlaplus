---- MODULE MC ----
EXTENDS 5_vending_machine_datastructure, TLC

\* CONSTANT definitions @modelParameterConstants:0max_product_stock
const_165276739108495000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1products
const_165276739108496000 == 
[saffron_sky |-> 150, desert_white |-> 175, ocean_blue |-> 100]
----

\* CONSTANT definitions @modelParameterConstants:2customer_names
const_165276739108497000 == 
{"c1"}
----

\* CONSTANT definitions @modelParameterConstants:3max_coin_stock
const_165276739108498000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:4min_coin_stock
const_165276739108499000 == 
0
----

\* CONSTANT definitions @modelParameterConstants:5min_product_stock
const_1652767391084100000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:6cointypes
const_1652767391084101000 == 
{25,50,100}
----

\* CONSTANT definitions @modelParameterConstants:7vending_machine_names
const_1652767391084102000 == 
{"v1"}
----

=============================================================================
\* Modification History
\* Created Tue May 17 08:03:11 CEST 2022 by dirk-janswagerman

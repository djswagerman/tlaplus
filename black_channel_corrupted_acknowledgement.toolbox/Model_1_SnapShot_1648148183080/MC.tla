---- MODULE MC ----
EXTENDS black_channel_corrupted_acknowledgement, TLC

\* CONSTANT definitions @modelParameterConstants:1MaxMessagesInFlight
const_1648148175015137000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2Msg
const_1648148175015138000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1648148175015139000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 1
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:56:15 CET 2022 by dirk-janswagerman

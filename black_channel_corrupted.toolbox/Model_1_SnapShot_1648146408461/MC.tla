---- MODULE MC ----
EXTENDS black_channel_corrupted, TLC

\* CONSTANT definitions @modelParameterConstants:1MaxMessagesInFlight
const_164814640541932000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2Msg
const_164814640541933000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_164814640541934000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 1
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:26:45 CET 2022 by dirk-janswagerman

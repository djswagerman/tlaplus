---- MODULE MC ----
EXTENDS black_channel_corrupted_acknowledgement, TLC

\* CONSTANT definitions @modelParameterConstants:1MaxMessagesInFlight
const_164814710309068000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2Msg
const_164814710309069000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_164814710309070000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 1
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_164814710309071000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 1
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:38:23 CET 2022 by dirk-janswagerman

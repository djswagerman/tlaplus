---- MODULE MC ----
EXTENDS black_channel_corrupted_acknowledgement, TLC

\* CONSTANT definitions @modelParameterConstants:1MaxMessagesInFlight
const_164814708923461000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2Msg
const_164814708923462000 == 
{"a","b"}
----

\* PROPERTY definition @modelCorrectnessProperties:0
prop_164814708923463000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 1
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:38:09 CET 2022 by dirk-janswagerman

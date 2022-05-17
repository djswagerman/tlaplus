---- MODULE MC ----
EXTENDS black_channel_corrupted_acknowledgement, TLC

\* CONSTANT definitions @modelParameterConstants:1MaxMessagesInFlight
const_1648148240187146000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2Msg
const_1648148240187147000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1648148240187148000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 1
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1648148240187149000 ==
Len (acknowledgedMessages) <= 4 \/ corruptionCounter <= 2
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:57:20 CET 2022 by dirk-janswagerman

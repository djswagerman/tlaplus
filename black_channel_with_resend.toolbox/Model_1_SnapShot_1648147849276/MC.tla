---- MODULE MC ----
EXTENDS black_channel_with_resend, TLC

\* CONSTANT definitions @modelParameterConstants:1MaxMessagesInFlight
const_1648147846217105000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2Msg
const_1648147846217106000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1648147846217107000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 1
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1648147846217108000 ==
Len (acknowledgedMessage) <= 2 \/ corruptionCounter <= 1
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:50:46 CET 2022 by dirk-janswagerman

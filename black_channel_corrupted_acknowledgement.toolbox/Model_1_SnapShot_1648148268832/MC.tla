---- MODULE MC ----
EXTENDS black_channel_corrupted_acknowledgement, TLC

\* CONSTANT definitions @modelParameterConstants:1MaxMessagesInFlight
const_1648148261782156000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2Msg
const_1648148261782157000 == 
{"a","b"}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1648148261782158000 ==
createMessageCounter <= 5 /\ corruptionCounter <= 2
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1648148261782159000 ==
Len (acknowledgedMessages) <= 4 \/ corruptionCounter <= 2
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 19:57:41 CET 2022 by dirk-janswagerman

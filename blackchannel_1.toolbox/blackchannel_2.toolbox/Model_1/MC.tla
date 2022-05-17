---- MODULE MC ----
EXTENDS blackchannel_2, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_16481238737452000 == 
{"a","b"}
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_16481238737453000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_16481238737454000 ==
Len(messageChannel) <= MaxQueueLength
----
=============================================================================
\* Modification History
\* Created Thu Mar 24 13:11:13 CET 2022 by dirk-janswagerman

---- MODULE MC ----
EXTENDS blackchannel_3, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_1646569328955116000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:2MaxQueueLength
const_1646569328956117000 == 
4
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1646569328956118000 ==
Len (messageChannel) < 4
----
=============================================================================
\* Modification History
\* Created Sun Mar 06 13:22:08 CET 2022 by dirk-janswagerman

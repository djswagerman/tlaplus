---- MODULE MC ----
EXTENDS blackchannel_3, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_1646568961252113000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:2MaxQueueLength
const_1646568961252114000 == 
4
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1646568961252115000 ==
Len (messageChannel) < 4
----
=============================================================================
\* Modification History
\* Created Sun Mar 06 13:16:01 CET 2022 by dirk-janswagerman

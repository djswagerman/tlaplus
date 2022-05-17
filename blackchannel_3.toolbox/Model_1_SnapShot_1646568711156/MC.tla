---- MODULE MC ----
EXTENDS blackchannel_3, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_1646568708113102000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:2MaxQueueLength
const_1646568708113103000 == 
4
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1646568708113104000 ==
Len (messageChannel) < 4
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1646568708113105000 ==
Len(acknowkledgeChannel) = 0
----
=============================================================================
\* Modification History
\* Created Sun Mar 06 13:11:48 CET 2022 by dirk-janswagerman

---- MODULE MC ----
EXTENDS blackchannel_3, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_164656779936675000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:2MaxQueueLength
const_164656779936676000 == 
4
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164656779936877000 ==
Len (messageChannel) < 4
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_164656779936878000 ==
Len(acknowkledgeChannel) = 0
----
=============================================================================
\* Modification History
\* Created Sun Mar 06 12:56:39 CET 2022 by dirk-janswagerman

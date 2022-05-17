---- MODULE MC ----
EXTENDS blackchannel_3, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_164656754319371000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:2MaxQueueLength
const_164656754319372000 == 
4
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164656754319373000 ==
Len (messageChannel) < 4
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_164656754319374000 ==
Len(acknowkledgeChannel) = 0
----
=============================================================================
\* Modification History
\* Created Sun Mar 06 12:52:23 CET 2022 by dirk-janswagerman

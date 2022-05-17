---- MODULE MC ----
EXTENDS blackchannel_3, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_164666975160728000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:2MaxQueueLength
const_164666975160729000 == 
4
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164666975160730000 ==
Len (messageChannel) < 4
----
=============================================================================
\* Modification History
\* Created Mon Mar 07 17:15:51 CET 2022 by dirk-janswagerman

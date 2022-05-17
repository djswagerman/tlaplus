---- MODULE MC ----
EXTENDS blackchannel_3, TLC

\* CONSTANT definitions @modelParameterConstants:0Msg
const_164656847092387000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:2MaxQueueLength
const_164656847092388000 == 
4
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164656847092389000 ==
Len (messageChannel) < 4
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_164656847092390000 ==
Len(acknowkledgeChannel) = 0
----
=============================================================================
\* Modification History
\* Created Sun Mar 06 13:07:50 CET 2022 by dirk-janswagerman

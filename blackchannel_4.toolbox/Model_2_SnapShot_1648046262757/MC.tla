---- MODULE MC ----
EXTENDS blackchannel_4, TLC

\* CONSTANT definitions @modelParameterConstants:0MaxQueueLength
const_16480458594071002000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Msg
const_16480458594071003000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:3MaxMessagesInFlight
const_16480458594071004000 == 
2
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_16480458594071005000 ==
Len (messageChannel) <= 2
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_16480458594071006000 ==
\A i \in 1..Len (acknowledgedMessages) : acknowledgedMessages[i].counter = sendMessage[i].counter
----
=============================================================================
\* Modification History
\* Created Wed Mar 23 15:30:59 CET 2022 by dirk-janswagerman

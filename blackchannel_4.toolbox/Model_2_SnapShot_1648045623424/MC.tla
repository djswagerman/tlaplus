---- MODULE MC ----
EXTENDS blackchannel_4, TLC

\* CONSTANT definitions @modelParameterConstants:0MaxQueueLength
const_1648045596547992000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Msg
const_1648045596547993000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:3MaxMessagesInFlight
const_1648045596547994000 == 
2
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1648045596548995000 ==
Len (messageChannel) <= 3
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_1648045596548996000 ==
\A i \in 1..Len (acknowledgedMessages) : acknowledgedMessages[i].counter = sendMessage[i].counter
----
=============================================================================
\* Modification History
\* Created Wed Mar 23 15:26:36 CET 2022 by dirk-janswagerman

---- MODULE MC ----
EXTENDS blackchannel_4, TLC

\* CONSTANT definitions @modelParameterConstants:0MaxQueueLength
const_16480468239961024000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Msg
const_16480468239961025000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:2MaxMessagesInFlight
const_16480468239961026000 == 
2
----

\* PROPERTY definition @modelCorrectnessProperties:0
prop_16480468239961027000 ==
\A i \in 1..Len (acknowledgedMessages) : acknowledgedMessages[i].counter = sendMessage[i].counter
----
=============================================================================
\* Modification History
\* Created Wed Mar 23 15:47:03 CET 2022 by dirk-janswagerman

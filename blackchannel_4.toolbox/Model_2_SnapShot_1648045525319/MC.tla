---- MODULE MC ----
EXTENDS blackchannel_4, TLC

\* CONSTANT definitions @modelParameterConstants:0MaxQueueLength
const_1648045495406981000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Msg
const_1648045495406982000 == 
{"a", "b"}
----

\* CONSTANT definitions @modelParameterConstants:3MaxMessagesInFlight
const_1648045495406983000 == 
2
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1648045495406984000 ==
Len (messageChannel) <= 2 /\ corruptionCounter <= 2 /\ createMessageCounter <= 2
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1648045495407985000 ==
Len (messageChannel) <= 3
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_1648045495407986000 ==
\A i \in 1..Len (acknowledgedMessages) : acknowledgedMessages[i].counter = sendMessage[i].counter
----
=============================================================================
\* Modification History
\* Created Wed Mar 23 15:24:55 CET 2022 by dirk-janswagerman

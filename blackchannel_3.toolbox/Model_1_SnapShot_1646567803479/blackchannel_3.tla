--------------------------- MODULE blackchannel_3 ---------------------------


EXTENDS Integers, Naturals, Sequences, TLC, FiniteSets
CONSTANTS Msg, MaxQueueLength

                  
Remove(i, seq) ==   [j \in 1..(Len(seq)-1) |-> 
                        IF j < i THEN
                            seq[j]
                        ELSE
                            seq[j+1]]

RandomIndex (seq) == CHOOSE x \in 1..Len(seq) : x < Len(seq)
                                         
(* --algorithm blackchannel_3
variables
    messageChannel = <<>>;
    acknowkledgeChannel = <<>>;
    message = [content |-> <<>>, counter |-> 0, checksum |-> 0];
    sendCount = 0;
    receiveCount = 0;

macro Send (msg, channel)
begin
    channel := Append (channel, msg);
end macro;

macro Receive (msg, channel)
begin
    msg := Head (channel);
    channel := Tail (channel);
end macro;

process Sender \in {"S"}
variables
    sendQueue = <<>>;
    sendMessage = <<>>;
    receivedMessage = <<>>;
    acknowledged = FALSE;
begin
startSender:
    while TRUE do
        either
            PrepareMessage:
                await Len (messageChannel) = 0;
                with m \in Msg do
                    message.content := Append (message.content, m);
                end with;
        or
            AddMessageToSendQueue:
                await Len(message.content) > 0 /\ Len(sendQueue) < MaxQueueLength;
                message.counter := message.counter + 1;
                sendQueue := Append(sendQueue, message);
        or      
            PickMessage:
                await Len (sendQueue) > 0 /\ Len (messageChannel) < MaxQueueLength;
                sendMessage := Head (sendQueue);
                sendQueue := Tail (sendQueue);                
        or 
            SendMessage:
                await sendMessage # <<>> /\ Len(acknowkledgeChannel) = 0 /\ (acknowledged = FALSE);
                Send (sendMessage, messageChannel);
        or
            ReceiveAcknowledgement:
                await Len (acknowkledgeChannel) > 0;
                receivedMessage := Head (acknowkledgeChannel);
                acknowkledgeChannel := Tail (acknowkledgeChannel);
                acknowledged := (sendMessage.counter = receivedMessage.counter);
                if acknowledged then
                    sendMessage := <<>>;
                end if
                
        or
            skip;
        end either;
    end while;
end process;

process Receiver \in {"R"}
variable
    receivedMessage = <<>>;
begin
startReceiver:
    while TRUE do
        either
            await Len(messageChannel) > 0;
            Receive (receivedMessage, messageChannel);
\*            acknowkledgeChannel := Append (receivedMessage, acknowkledgeChannel);
        or
            skip;
        end either;
    end while;
end process;

process MessageCorrupter \in {"D"}
variables
    randomNumber;
begin
startMessageCorrupter:
    while TRUE do
        either
            RemoveMessage:
\*                await Len(messageChannel) > 0;
\*                messageChannel := Remove (RandomIndex(messageChannel), messageChannel);
                skip;
        or
            CorruptMessage:
                skip;
        or
            ChangeMessageOrder:
                skip;
        end either
    end while;
end process;

end algorithm; *)

\* BEGIN TRANSLATION (chksum(pcal) = "e9086d5b" /\ chksum(tla) = "bcfe0f2c")
\* Process variable receivedMessage of process Sender at line 39 col 5 changed to receivedMessage_
CONSTANT defaultInitValue
VARIABLES messageChannel, acknowkledgeChannel, message, sendCount, 
          receiveCount, pc, sendQueue, sendMessage, receivedMessage_, 
          acknowledged, receivedMessage, randomNumber

vars == << messageChannel, acknowkledgeChannel, message, sendCount, 
           receiveCount, pc, sendQueue, sendMessage, receivedMessage_, 
           acknowledged, receivedMessage, randomNumber >>

ProcSet == ({"S"}) \cup ({"R"}) \cup ({"D"})

Init == (* Global variables *)
        /\ messageChannel = <<>>
        /\ acknowkledgeChannel = <<>>
        /\ message = [content |-> <<>>, counter |-> 0, checksum |-> 0]
        /\ sendCount = 0
        /\ receiveCount = 0
        (* Process Sender *)
        /\ sendQueue = [self \in {"S"} |-> <<>>]
        /\ sendMessage = [self \in {"S"} |-> <<>>]
        /\ receivedMessage_ = [self \in {"S"} |-> <<>>]
        /\ acknowledged = [self \in {"S"} |-> FALSE]
        (* Process Receiver *)
        /\ receivedMessage = [self \in {"R"} |-> <<>>]
        (* Process MessageCorrupter *)
        /\ randomNumber = [self \in {"D"} |-> defaultInitValue]
        /\ pc = [self \in ProcSet |-> CASE self \in {"S"} -> "startSender"
                                        [] self \in {"R"} -> "startReceiver"
                                        [] self \in {"D"} -> "startMessageCorrupter"]

startSender(self) == /\ pc[self] = "startSender"
                     /\ \/ /\ pc' = [pc EXCEPT ![self] = "PrepareMessage"]
                        \/ /\ pc' = [pc EXCEPT ![self] = "AddMessageToSendQueue"]
                        \/ /\ pc' = [pc EXCEPT ![self] = "PickMessage"]
                        \/ /\ pc' = [pc EXCEPT ![self] = "SendMessage"]
                        \/ /\ pc' = [pc EXCEPT ![self] = "ReceiveAcknowledgement"]
                        \/ /\ TRUE
                           /\ pc' = [pc EXCEPT ![self] = "startSender"]
                     /\ UNCHANGED << messageChannel, acknowkledgeChannel, 
                                     message, sendCount, receiveCount, 
                                     sendQueue, sendMessage, receivedMessage_, 
                                     acknowledged, receivedMessage, 
                                     randomNumber >>

PrepareMessage(self) == /\ pc[self] = "PrepareMessage"
                        /\ Len (messageChannel) = 0
                        /\ \E m \in Msg:
                             message' = [message EXCEPT !.content = Append (message.content, m)]
                        /\ pc' = [pc EXCEPT ![self] = "startSender"]
                        /\ UNCHANGED << messageChannel, acknowkledgeChannel, 
                                        sendCount, receiveCount, sendQueue, 
                                        sendMessage, receivedMessage_, 
                                        acknowledged, receivedMessage, 
                                        randomNumber >>

AddMessageToSendQueue(self) == /\ pc[self] = "AddMessageToSendQueue"
                               /\ Len(message.content) > 0 /\ Len(sendQueue[self]) < MaxQueueLength
                               /\ message' = [message EXCEPT !.counter = message.counter + 1]
                               /\ sendQueue' = [sendQueue EXCEPT ![self] = Append(sendQueue[self], message')]
                               /\ pc' = [pc EXCEPT ![self] = "startSender"]
                               /\ UNCHANGED << messageChannel, 
                                               acknowkledgeChannel, sendCount, 
                                               receiveCount, sendMessage, 
                                               receivedMessage_, acknowledged, 
                                               receivedMessage, randomNumber >>

PickMessage(self) == /\ pc[self] = "PickMessage"
                     /\ Len (sendQueue[self]) > 0 /\ Len (messageChannel) < MaxQueueLength
                     /\ sendMessage' = [sendMessage EXCEPT ![self] = Head (sendQueue[self])]
                     /\ sendQueue' = [sendQueue EXCEPT ![self] = Tail (sendQueue[self])]
                     /\ pc' = [pc EXCEPT ![self] = "startSender"]
                     /\ UNCHANGED << messageChannel, acknowkledgeChannel, 
                                     message, sendCount, receiveCount, 
                                     receivedMessage_, acknowledged, 
                                     receivedMessage, randomNumber >>

SendMessage(self) == /\ pc[self] = "SendMessage"
                     /\ sendMessage[self] # <<>> /\ Len(acknowkledgeChannel) = 0 /\ (acknowledged[self] = FALSE)
                     /\ messageChannel' = Append (messageChannel, sendMessage[self])
                     /\ pc' = [pc EXCEPT ![self] = "startSender"]
                     /\ UNCHANGED << acknowkledgeChannel, message, sendCount, 
                                     receiveCount, sendQueue, sendMessage, 
                                     receivedMessage_, acknowledged, 
                                     receivedMessage, randomNumber >>

ReceiveAcknowledgement(self) == /\ pc[self] = "ReceiveAcknowledgement"
                                /\ Len (acknowkledgeChannel) > 0
                                /\ receivedMessage_' = [receivedMessage_ EXCEPT ![self] = Head (acknowkledgeChannel)]
                                /\ acknowkledgeChannel' = Tail (acknowkledgeChannel)
                                /\ acknowledged' = [acknowledged EXCEPT ![self] = (sendMessage[self].counter = receivedMessage_'[self].counter)]
                                /\ IF acknowledged'[self]
                                      THEN /\ sendMessage' = [sendMessage EXCEPT ![self] = <<>>]
                                      ELSE /\ TRUE
                                           /\ UNCHANGED sendMessage
                                /\ pc' = [pc EXCEPT ![self] = "startSender"]
                                /\ UNCHANGED << messageChannel, message, 
                                                sendCount, receiveCount, 
                                                sendQueue, receivedMessage, 
                                                randomNumber >>

Sender(self) == startSender(self) \/ PrepareMessage(self)
                   \/ AddMessageToSendQueue(self) \/ PickMessage(self)
                   \/ SendMessage(self) \/ ReceiveAcknowledgement(self)

startReceiver(self) == /\ pc[self] = "startReceiver"
                       /\ \/ /\ Len(messageChannel) > 0
                             /\ receivedMessage' = [receivedMessage EXCEPT ![self] = Head (messageChannel)]
                             /\ messageChannel' = Tail (messageChannel)
                          \/ /\ TRUE
                             /\ UNCHANGED <<messageChannel, receivedMessage>>
                       /\ pc' = [pc EXCEPT ![self] = "startReceiver"]
                       /\ UNCHANGED << acknowkledgeChannel, message, sendCount, 
                                       receiveCount, sendQueue, sendMessage, 
                                       receivedMessage_, acknowledged, 
                                       randomNumber >>

Receiver(self) == startReceiver(self)

startMessageCorrupter(self) == /\ pc[self] = "startMessageCorrupter"
                               /\ \/ /\ pc' = [pc EXCEPT ![self] = "RemoveMessage"]
                                  \/ /\ pc' = [pc EXCEPT ![self] = "CorruptMessage"]
                                  \/ /\ pc' = [pc EXCEPT ![self] = "ChangeMessageOrder"]
                               /\ UNCHANGED << messageChannel, 
                                               acknowkledgeChannel, message, 
                                               sendCount, receiveCount, 
                                               sendQueue, sendMessage, 
                                               receivedMessage_, acknowledged, 
                                               receivedMessage, randomNumber >>

RemoveMessage(self) == /\ pc[self] = "RemoveMessage"
                       /\ TRUE
                       /\ pc' = [pc EXCEPT ![self] = "startMessageCorrupter"]
                       /\ UNCHANGED << messageChannel, acknowkledgeChannel, 
                                       message, sendCount, receiveCount, 
                                       sendQueue, sendMessage, 
                                       receivedMessage_, acknowledged, 
                                       receivedMessage, randomNumber >>

CorruptMessage(self) == /\ pc[self] = "CorruptMessage"
                        /\ TRUE
                        /\ pc' = [pc EXCEPT ![self] = "startMessageCorrupter"]
                        /\ UNCHANGED << messageChannel, acknowkledgeChannel, 
                                        message, sendCount, receiveCount, 
                                        sendQueue, sendMessage, 
                                        receivedMessage_, acknowledged, 
                                        receivedMessage, randomNumber >>

ChangeMessageOrder(self) == /\ pc[self] = "ChangeMessageOrder"
                            /\ TRUE
                            /\ pc' = [pc EXCEPT ![self] = "startMessageCorrupter"]
                            /\ UNCHANGED << messageChannel, 
                                            acknowkledgeChannel, message, 
                                            sendCount, receiveCount, sendQueue, 
                                            sendMessage, receivedMessage_, 
                                            acknowledged, receivedMessage, 
                                            randomNumber >>

MessageCorrupter(self) == startMessageCorrupter(self)
                             \/ RemoveMessage(self) \/ CorruptMessage(self)
                             \/ ChangeMessageOrder(self)

Next == (\E self \in {"S"}: Sender(self))
           \/ (\E self \in {"R"}: Receiver(self))
           \/ (\E self \in {"D"}: MessageCorrupter(self))

Spec == Init /\ [][Next]_vars

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Sun Mar 06 12:56:33 CET 2022 by dirk-janswagerman
\* Created Mon Feb 28 21:25:56 CET 2022 by dirk-janswagerman

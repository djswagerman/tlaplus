--------------------------- MODULE blackchannel_2 ---------------------------


EXTENDS Integers, Naturals, Sequences, TLC, FiniteSets
CONSTANTS Msg, MaxQueueLength

                  
Remove(i, seq) ==   [j \in 1..(Len(seq)-1) |-> 
                        IF j < i THEN
                            seq[j]
                        ELSE
                            seq[j+1]]

RandomIndex (seq) == CHOOSE x \in 1..Len(seq) : x < Len(seq)

                                         
(* --algorithm blackchannel_2
variables
    messageChannel = <<>>;
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
variable
    message = <<>>;
begin
startSender:
    while TRUE do
        either
            PrepareMessage:
                with m \in Msg do
                    message  := Append (message, m);
                end with;
        or
            SendMessage:
                await Len (message) >= 1 /\ Len (messageChannel) < MaxQueueLength;
                Send (message, messageChannel);
                sendCount := sendCount + 1;
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
            receiveCount := receiveCount + 1;
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
                await Len(messageChannel) > 0;
                messageChannel := Remove (RandomIndex(messageChannel), messageChannel);
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

\* BEGIN TRANSLATION (chksum(pcal) = "8dd3b19d" /\ chksum(tla) = "7efa7d65")
CONSTANT defaultInitValue
VARIABLES messageChannel, sendCount, receiveCount, pc, message, 
          receivedMessage, randomNumber

vars == << messageChannel, sendCount, receiveCount, pc, message, 
           receivedMessage, randomNumber >>

ProcSet == ({"S"}) \cup ({"R"}) \cup ({"D"})

Init == (* Global variables *)
        /\ messageChannel = <<>>
        /\ sendCount = 0
        /\ receiveCount = 0
        (* Process Sender *)
        /\ message = [self \in {"S"} |-> <<>>]
        (* Process Receiver *)
        /\ receivedMessage = [self \in {"R"} |-> <<>>]
        (* Process MessageCorrupter *)
        /\ randomNumber = [self \in {"D"} |-> defaultInitValue]
        /\ pc = [self \in ProcSet |-> CASE self \in {"S"} -> "startSender"
                                        [] self \in {"R"} -> "startReceiver"
                                        [] self \in {"D"} -> "startMessageCorrupter"]

startSender(self) == /\ pc[self] = "startSender"
                     /\ \/ /\ pc' = [pc EXCEPT ![self] = "PrepareMessage"]
                        \/ /\ pc' = [pc EXCEPT ![self] = "SendMessage"]
                        \/ /\ TRUE
                           /\ pc' = [pc EXCEPT ![self] = "startSender"]
                     /\ UNCHANGED << messageChannel, sendCount, receiveCount, 
                                     message, receivedMessage, randomNumber >>

PrepareMessage(self) == /\ pc[self] = "PrepareMessage"
                        /\ \E m \in Msg:
                             message' = [message EXCEPT ![self] = Append (message[self], m)]
                        /\ pc' = [pc EXCEPT ![self] = "startSender"]
                        /\ UNCHANGED << messageChannel, sendCount, 
                                        receiveCount, receivedMessage, 
                                        randomNumber >>

SendMessage(self) == /\ pc[self] = "SendMessage"
                     /\ Len (message[self]) >= 1 /\ Len (messageChannel) < MaxQueueLength
                     /\ messageChannel' = Append (messageChannel, message[self])
                     /\ sendCount' = sendCount + 1
                     /\ pc' = [pc EXCEPT ![self] = "startSender"]
                     /\ UNCHANGED << receiveCount, message, receivedMessage, 
                                     randomNumber >>

Sender(self) == startSender(self) \/ PrepareMessage(self)
                   \/ SendMessage(self)

startReceiver(self) == /\ pc[self] = "startReceiver"
                       /\ \/ /\ Len(messageChannel) > 0
                             /\ receivedMessage' = [receivedMessage EXCEPT ![self] = Head (messageChannel)]
                             /\ messageChannel' = Tail (messageChannel)
                             /\ receiveCount' = receiveCount + 1
                          \/ /\ TRUE
                             /\ UNCHANGED <<messageChannel, receiveCount, receivedMessage>>
                       /\ pc' = [pc EXCEPT ![self] = "startReceiver"]
                       /\ UNCHANGED << sendCount, message, randomNumber >>

Receiver(self) == startReceiver(self)

startMessageCorrupter(self) == /\ pc[self] = "startMessageCorrupter"
                               /\ \/ /\ pc' = [pc EXCEPT ![self] = "RemoveMessage"]
                                  \/ /\ pc' = [pc EXCEPT ![self] = "CorruptMessage"]
                                  \/ /\ pc' = [pc EXCEPT ![self] = "ChangeMessageOrder"]
                               /\ UNCHANGED << messageChannel, sendCount, 
                                               receiveCount, message, 
                                               receivedMessage, randomNumber >>

RemoveMessage(self) == /\ pc[self] = "RemoveMessage"
                       /\ Len(messageChannel) > 0
                       /\ messageChannel' = Remove (RandomIndex(messageChannel), messageChannel)
                       /\ pc' = [pc EXCEPT ![self] = "startMessageCorrupter"]
                       /\ UNCHANGED << sendCount, receiveCount, message, 
                                       receivedMessage, randomNumber >>

CorruptMessage(self) == /\ pc[self] = "CorruptMessage"
                        /\ TRUE
                        /\ pc' = [pc EXCEPT ![self] = "startMessageCorrupter"]
                        /\ UNCHANGED << messageChannel, sendCount, 
                                        receiveCount, message, receivedMessage, 
                                        randomNumber >>

ChangeMessageOrder(self) == /\ pc[self] = "ChangeMessageOrder"
                            /\ TRUE
                            /\ pc' = [pc EXCEPT ![self] = "startMessageCorrupter"]
                            /\ UNCHANGED << messageChannel, sendCount, 
                                            receiveCount, message, 
                                            receivedMessage, randomNumber >>

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
\* Last modified Tue Mar 01 21:09:22 CET 2022 by dirk-janswagerman
\* Created Mon Feb 28 21:25:56 CET 2022 by dirk-janswagerman

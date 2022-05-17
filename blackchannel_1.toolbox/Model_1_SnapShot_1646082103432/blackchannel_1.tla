--------------------------- MODULE blackchannel_1 ---------------------------


EXTENDS Integers, Naturals, Sequences, TLC, FiniteSets
CONSTANTS Msg

                  
Remove(i, seq) ==   [j \in 1..(Len(seq)-1) |-> 
                        IF j < i THEN
                            seq[j]
                        ELSE
                            seq[j+1]]

RandomIndex (seq) == CHOOSE x \in 1..Len(seq) : x < Len(seq)

                                         
(* --algorithm dining_philosophers
variables
    messageChannel = <<>>;

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
                await Len (message) >= 1;
                Send (message, messageChannel);
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

\* BEGIN TRANSLATION (chksum(pcal) = "f9f8bcd6" /\ chksum(tla) = "28b703c5")
CONSTANT defaultInitValue
VARIABLES messageChannel, pc, message, receivedMessage, randomNumber

vars == << messageChannel, pc, message, receivedMessage, randomNumber >>

ProcSet == ({"S"}) \cup ({"R"}) \cup ({"D"})

Init == (* Global variables *)
        /\ messageChannel = <<>>
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
                     /\ UNCHANGED << messageChannel, message, receivedMessage, 
                                     randomNumber >>

PrepareMessage(self) == /\ pc[self] = "PrepareMessage"
                        /\ \E m \in Msg:
                             message' = [message EXCEPT ![self] = Append (message[self], m)]
                        /\ pc' = [pc EXCEPT ![self] = "startSender"]
                        /\ UNCHANGED << messageChannel, receivedMessage, 
                                        randomNumber >>

SendMessage(self) == /\ pc[self] = "SendMessage"
                     /\ Len (message[self]) >= 1
                     /\ messageChannel' = Append (messageChannel, message[self])
                     /\ pc' = [pc EXCEPT ![self] = "startSender"]
                     /\ UNCHANGED << message, receivedMessage, randomNumber >>

Sender(self) == startSender(self) \/ PrepareMessage(self)
                   \/ SendMessage(self)

startReceiver(self) == /\ pc[self] = "startReceiver"
                       /\ \/ /\ Len(messageChannel) > 0
                             /\ receivedMessage' = [receivedMessage EXCEPT ![self] = Head (messageChannel)]
                             /\ messageChannel' = Tail (messageChannel)
                          \/ /\ TRUE
                             /\ UNCHANGED <<messageChannel, receivedMessage>>
                       /\ pc' = [pc EXCEPT ![self] = "startReceiver"]
                       /\ UNCHANGED << message, randomNumber >>

Receiver(self) == startReceiver(self)

startMessageCorrupter(self) == /\ pc[self] = "startMessageCorrupter"
                               /\ \/ /\ pc' = [pc EXCEPT ![self] = "RemoveMessage"]
                                  \/ /\ pc' = [pc EXCEPT ![self] = "CorruptMessage"]
                                  \/ /\ pc' = [pc EXCEPT ![self] = "ChangeMessageOrder"]
                               /\ UNCHANGED << messageChannel, message, 
                                               receivedMessage, randomNumber >>

RemoveMessage(self) == /\ pc[self] = "RemoveMessage"
                       /\ Len(messageChannel) > 0
                       /\ messageChannel' = Remove (RandomIndex(messageChannel), messageChannel)
                       /\ pc' = [pc EXCEPT ![self] = "startMessageCorrupter"]
                       /\ UNCHANGED << message, receivedMessage, randomNumber >>

CorruptMessage(self) == /\ pc[self] = "CorruptMessage"
                        /\ TRUE
                        /\ pc' = [pc EXCEPT ![self] = "startMessageCorrupter"]
                        /\ UNCHANGED << messageChannel, message, 
                                        receivedMessage, randomNumber >>

ChangeMessageOrder(self) == /\ pc[self] = "ChangeMessageOrder"
                            /\ TRUE
                            /\ pc' = [pc EXCEPT ![self] = "startMessageCorrupter"]
                            /\ UNCHANGED << messageChannel, message, 
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
\* Last modified Mon Feb 28 22:01:28 CET 2022 by dirk-janswagerman
\* Created Mon Feb 28 21:25:56 CET 2022 by dirk-janswagerman

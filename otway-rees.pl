% ** The Otway-Rees Protocol** 

:- include('postulates.pl').

%Mensagem:
message(a,b,encryptedKey(nc,kas)).
message(a,b,encryptedKey(na,kas)).

message(b,s,encryptedKey(na,kas)).
message(b,s,encryptedKey(nc,kas)).
message(b,s,encryptedKey(nb,kbs)).
message(b,s,encryptedKey(nc,kbs)).

message(s,b,encryptedKey(na,kas)).
message(s,b,encryptedKey(shareKey(a,b,kab),kas)).
message(s,b,encryptedKey(onceSaid(b,nc),kas)).

message(s,b,encryptedKey(nb,kbs)).
message(s,b,encryptedKey(shareKey(a,b,kab),kbs)).
message(s,b,encryptedKey(onceSaid(a,nc),kbs)).

message(b,a,encryptedKey(na,kas)).
message(b,a,encryptedKey(shareKey(a,b,kab),kas)).
message(b,a,encryptedKey(onceSaid(b,nc),kas)).

%Assumptions:

believes(a,shareKey(a,s,kas)).
believes(b,shareKey(b,s,kbs)).
believes(s,shareKey(a,s,kas)).
believes(s,shareKey(b,s,kbs)).

believes(a,hasJurisdiction(s,shareKey(a,b,kab))).
believes(b,hasJurisdiction(s,shareKey(a,b,kab))).

believes(s,shareKey(a,b,kab)).

believes(a,isFresh(na)).
believes(a,isFresh(nc)).
believes(b,isFresh(nb)).

believes(a,isFresh(shareKey(a,b,kab))).
believes(b,isFresh(shareKey(a,b,kab))).

believes(a,hasJurisdiction(s,onceSaid(b,shareKey(a,b,kab)))).
believes(b,hasJurisdiction(s,onceSaid(b,shareKey(a,b,kab)))).
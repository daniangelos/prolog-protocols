% ** The Needham-Schroeder Protocol (with shared keys)

:- include('postulates.pl').

%Messages -Idealized Protocol- :
%the first message is omitted, resulting on the impression as if S acted spontaneously
message(s,a,encryptedKey(na,shareKey(a,b,kab),isFresh(shareKey(a,b,kab)),encryptedKey(shareKey(a,b,kab),kbs),kas)).
message(a,b,encryptedKey(shareKey(a,b,kab),kbs)).
message(b,a,encryptedKey(nb,shareKey(a,b,kab),kab)).
message(a,b,encryptedKey(nb,shareKey(a,b,kab),kab)).

%Assumptions:
believes(a,shareKey(a,s,kas)).
believes(s,shareKey(a,s,kas)).
believes(s,shareKey(a,b,kab)).
believes(b,shareKey(b,s,kbs)).
believes(s,shareKey(b,s,kbs)).

believes(a,hasJurisdiction(s,shareKey(a,b,k))).
believes(a,hasJurisdiction(s,isFresh(shareKey(a,b,k)))).
believes(b,hasJurisdiction(s,shareKey(a,b,s))).

believes(a,isFresh(na)).
believes(s,isFresh(shareKey(a,b,kab))).
believes(b,isFresh(nb)).
believes(b,isFresh(shareKey(a,b,k))).

sees(a,encryptedKey(shareKey(a,b,kab),isFresh(shareKey(a,b,kab)),encryptedKey(a,b,kbs),kas)).

%applying the nonce-verification postulate, we get:
believes(a,believes(s,shareKey(a,b,kab))).
believes(a,believes(s,isFresh(shareKey(a,b,kab)))).
%the jurisdiction postulate enable us to infer that:
believes(a,shareKey(a,b,kab)).
believes(a,isFresh(shareKey(a,b,kab))).
%therefore:
sees(a,encryptedKey(shareKey(a,b,kab))).

%allowing a to send a message to b, who decrypts the message
%from the message-meaning postulate:
believes(b,onceSaid(s,shareKey(a,b,kab))).
	
%We are supose to conclude that:
%believes(a,shareKey(a,b,kab)).
%believes(b,shareKey(a,b,kab)).

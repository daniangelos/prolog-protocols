% ** The Needham-Schroeder Protocol (with shared keys)

%Messages:
message(s,a,encryptedKey(statement(na,shareKey(a,b,kab),isFresh(shareKey(a,b,kab)),encryptedKey(shareKey(a,b,kab),kbs)),kas)).
message(a,b,encryptedKey(shareKey(a,b,kab),kbs)).

%Assumptions:
believes(a,shareKey(a,s,kas)).
believes(s,shareKey(a,s,kas)).
believes(s,shareKey(a,b,kab)).
believes(a,hasJurisdiction(s,shareKey(a,b,k))).
believes(a,hasJurisdiction(s,isFresh(shareKey(a,b,k)))).
believes(a,isFresh(na)).
believes(s,isFresh(shareKey(a,b,kab))).
believes(b,shareKey(b,s,kbs)).
believes(s,shareKey(b,s,kbs)).
believes(b,hasJurisdiction(s,shareKey(a,b,s))).
believes(b,isFresh(nb)).
believes(b,isFresh(shareKey(a,b,k))).


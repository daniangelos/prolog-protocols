% ** Formalização de Protocolos de Segurança **
% oi

% P,Q and R are principals
% X e Y are statements
% K is a key

%a principal may represent persons, computers or services
principal(p).
principal(q).
principal(r).
principalL(pL).
principalL(qL).
principalL(rL).

statement(x).
statement(y).

key(k).
secretKey(k-1).

server(s).

believes(p,x).
believes(p,(x,y)).
sees(p,x).
sees(p,(x,y)).
onceSaid(p,x).
hasJurisdiction(p,x).
isFresh(x).
shareKey(p,q,k).
hasPublicKey(p,k).
shareSecret(p,q,x).
encryptedKey(x,k).
encryptedKey(x,k-1).
combinedFormula(x,y).

believes(p,shareKey(p,q,k)).
sees(p,encryptedKey(x,k)).

believes(p,hasPublicKey(q,k)).
sees(p,encrypedKey(x,k)).

believes(p,shareSecret(p,q,y)).
sees(p,combinedFormula(x,y)).

%message_meaning
believes(P,onceSaid(Q,X)) :- believes(P,shareKey(P,Q,K)), sees(P,encryptedKey(X,K)).
believes(P,onceSaid(Q,X)) :- believes(p,hasPublicKey(Q,K)), sees(P,encrypedKey(X,K)).
believes(P,onceSaid(Q,X)) :- believes(p,shareSecret(P,Q,Y)), sees(P,combinedFormula(X,Y)).

%nonce_verification
believes(P,believes(Q,X)) :- believes(P,isFresh(X)), believes(P,onceSaid(Q,X)).

%jurisdiction_rule
believes(P,X) :- believes(P,hasJurisdiction(Q,X)), believes(P,believes(Q,X)).

%belief_property
believes(P,(X,Y)) :- believes(P,X), believes(Y).
believes(P,X) :- believes(P,(X,_)).
believes(P,believes(Q,X)) :- believes(P,believes(Q,(X,Y))).

%onceSaid_property
believes(P,onceSaid(Q,X)) :- believes(P,onceSaid(Q,(X,_))).

%sees_propertys
sees(P,X) :- sees(P,(X,Y)).
sees(P,X) :- sees(P,combinedFormula(X,Y)).
sees(P,X) :- believes(shareKey(Q,P,K)), sees(P,encryptedKey(X,K)).
sees(P,X) :- believes(P,hasPublicKey(P,K)), sees(P,encryptedKey(X,K)).
sees(P,X) :- believes(P,hasPublicKey(Q,K)), sees(P,encryptedKey(X,Kmenos1)). %neste caso, Kmenos1 deve ser uma chave secreta (k-1)

%one fresh, all fresh
believes(P,isFresh((X,Y))) :- believes(P,isFresh(X)).

%reflection_propertys
	%shared keys
believes(P,shareKey(Rlinha,R,K)) :- believes(P,shareKey(R,Rlinha,K)).
believes(P,believes(Q,shareKey(Rlinha,R,K))) :- believes(P,believes(Q,shareKey(R,Rlinha,K))).
	%shared secrets
believes(P,shareSecret(Rlinha,R,X)) :- believes(P,shareSecret(R,Rlinha,K)).
believes(P,believes(Q,shareSecret(Rlinha,R,X))) :- believes(P,believes(Q,shareSecret(R,Rlinha,X))).


%delegation statement
%believes(a,hasJurisdiction(S,shareKey(a,b,k))). **TO BE FINISHED

%Mensagem_para_visualizacao
sees(P,encryptedKey(X,K)) :- message(R,P,encryptedKey(X,K)).
sees(P,encryptedKey(X,K)) :- message(R,P,encryptedKey(X,K)).

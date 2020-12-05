function [A_obs, B_obs, C_obs, D_obs, X_hat_Selection, Xi_hat_Selection] ...
    = extendedStateObserver(G, m, poles)

% Conversion of plant transfer function to state-space realization in
% controller canonical form
[Ap,Bp,Cp,Dp]=tf2ss(cell2mat(G.num),cell2mat(G.den));
% Order of the plant
n=size(Ap,1);

% Extending the matrix Ap

% Matrix of the internal model
A_xi=zeros(m);

% Adding ones to the superdiagonal
for i=1:m-1
    if m==1
        break
    else
        A_xi(i,i+1)=1;
    end
end
% Clearing temporary variable
clear i;

% B matrix of the internal model with m extended states
B_xi=zeros(m,1);
B_xi(m)=1;

% C matrix of the internal model with m extended states
C_xi=zeros(1,m);
C_xi(1)=1;

% Extended matrix A
clear A;

A=[Ap Bp*C_xi;
    zeros(m,n) A_xi];

% Extended matrix B
B=[Bp;
    zeros(m,1)];

% Extended matrix C
C=[Cp zeros(1,m)];

% Gain selection for the extended-state observer
L=place(A.',C.',poles).';

% Compact implementation of the observer

% A matrix of the observer
A_obs=A-L*C;
% B matrix of the observer
B_obs=[B L];

% C matrix of the observer
C_obs=zeros(n+1,n+m);
C_obs(1:n,1:n)=eye(n);
C_obs(1:n,n+1:n+m)=zeros(n,m);
C_obs(n+1,1:n)=zeros(1,n);
C_obs(n+1,n+1:n+m)=C_xi;

% D matrix of the observer
D_obs=zeros(size(C_obs,1),size(B_obs,2));

% Vector for selecting the estimated state from the observer outputs
X_hat_Selection=zeros(n,n+1);
X_hat_Selection(1:n,1:n)=eye(n);

% Vector for selecting the estimated disturbance from the observer outputs
Xi_hat_Selection=[zeros(1,n) 1];
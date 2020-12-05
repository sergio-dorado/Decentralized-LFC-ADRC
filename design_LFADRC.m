%% Control design for Area 1

% Conversion to state-space form
G1ss=ss(G1);
% Closed-loop poles selection and state-gain
[K1, ~, e1] = ...
    lqr(G1ss.A, G1ss.B, eye(size(G1ss.A,1), size(G1ss.A,2)),1);
%e1=[-2.5765 -3.46 -7.38].';
%K1=place(G1ss.A,G1ss.B,e1);

% Change of sign for the state-gain
K1 = -K1;

% Observer-pole location
P = horzcat(e1.',[-5 -3 -1]);

[A_obs_1, B_obs_1, C_obs_1, D_obs_1, X_hat_1, Xi_hat_1] = ...
    extendedStateObserver(G1, 3, P);

%% Area 2

% Conversion to state-space form
G2ss = ss(G2);

% Closed-loop poles selection and state-gain
[K2, ~ , e2] = ...
    lqr(G2ss.A, G2ss.B, 2*eye(size(G2ss.A,1), size(G2ss.A,2)),1);

% Change of sign for the state-gain
K2 = -K2;

% Observer-pole location
[L2, ~, e2] = ...
    lqr(G2ss.A.',G2ss.C.', eye(size(G2ss.A,1), size(G2ss.A,2)), 10);

% Poles of the extended-state observer
P=[e2.' -3 -5 -2];

% Design of the extended-state observer
[A_obs_2, B_obs_2, C_obs_2, D_obs_2, X_hat_2, Xi_hat_2] = ...
    extendedStateObserver(G2,3,P);

%% Area 3

% Conversion to state-space form
G3ss = ss(G3);
% Closed-loop poles selection and state-gain
[K3,~,e3]=lqr(G3ss.A,G3ss.B,eye(size(G3ss.A,1),size(G3ss.A,2)),2);

% Change of sign for the state-gain
K3=-K3;

% Observer-pole location
[L3, ~, e3] = ...
    lqr(G3ss.A.', G3ss.C.', eye(size(G3ss.A,1), size(G3ss.A,2)), 10);

% Poles of the extended-state observer
P=[e3.' -3 -5 -2];

% Design of the extended-state observer
[A_obs_3, B_obs_3, C_obs_3, D_obs_3, X_hat_3, Xi_hat_3] =...
     extendedStateObserver(G3, 3, P);
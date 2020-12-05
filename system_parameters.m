%% System Parameters
% Description: parameters of the modified IEEE 39 bus system for LFC

%% Conventional Generators
% -------------------------------------------------------------
% Conventional generator parameters
% -------------------------------------------------------------

% Inertia constant [s]
H1=2.4868;
H2=2.6419;
H3=2.6419;
H4=2.6419;
H5=2.6419;
H6=2.6419;
H7=2.6419;
H8=2.6419;
H9=2.4862;
H10=2.3186;

% Rated power [MVA]
S1=911;
S2=835;
S3=835;
S4=835;
S5=835;
S6=835;
S7=835;
S8=835;
S9=911;
S10=590;

% Total inertia constant per area [s]
H_A1=(H1*S1+H2*S2+H3*S3)/(S1+S2+S3);
H_A2=(H4*S4+H5*S5+H6*S6+H7*S7)/(S4+S5+S6+S7);
H_A3=(H8*S8+H9*S9+H10*S10)/(S8+S9+S10);

%% Rotating Inertia-Mass

% Load damping coefficient (same for all areas)
D=2;

% Synchronizing torque coefficients

% Area 1 and 2
T12=2.5;
% Area 2 and 3
T23=3.8;
% Area 1 and 3
T13=5.0;

% -------------------------------------------------------------
% Transfer functions of the rotating mass inertia dynamics per area
% -------------------------------------------------------------

% Area 1
Grm_1=tf(1,[2*H_A1 D]);

% Area 2
Grm_2=tf(1,[2*H_A2 D]);

% Area 3
Grm_3=tf(1,[2*H_A3 D]);

% Generator 1 (Reheat steam) [Area 1]
Fhp1=0.3;
Trh1=8.720;
Tch1=0.2;
Tg1=0.1;
R1=0.0548;

% Governor transfer function
Gg1=tf(1,[Tg1 1]);
% Turbine transfer function
Gt1=tf([Fhp1*Trh1 1],conv([Tch1 1],[Trh1 1]));

% Generator 2 (Hydraulic) [Area 1]
Tg2=0.100;
Tw2=1.0;
Tr2=5.0;
Rt2=0.38;
Rp2=0.06;

% Governor transfer function
Gg2=tf(1,[Tg2 1]);
% Droop compensation transfer function
Gdc2=tf([Tr2 1],[(Rt2/Rp2)*Tr2 1]);
% Turbine transfer function
Gt2=tf([-Tw2 1],[0.5*Tw2 1]);

% Generator 3 (Hydraulic) [Area 1]
Tg3=0.180;
Tw3=1.0;
Tr3=5.0;
Rt3=0.38;
Rp3=0.06;

% Governor transfer function
Gg3=tf(1,[Tg3 1]);
% Droop compensation transfer function
Gdc3=tf([Tr3 1],[(Rt3/Rp3)*Tr3 1]);
% Turbine transfer function
Gt3=tf([-Tw3 1],[0.5*Tw3 1]);

% Generator 4 (Reheat steam)
Fhp4=0.3;
Trh4=8.000;
Tch4=0.2;
Tg4=0.180;
R4=0.06;

% Governor transfer function
Gg4=tf(1,[Tg4 1]);
% Turbine transfer function
Gt4=tf([Fhp4*Trh4 1],conv([Tch4 1],[Trh4 1]));

% Generator 5 (Hydraulic)
Tg5=0.180;
Tw5=1.0;
Tr5=5.0;
Rt5=0.38;
Rp5=0.0548;

% Governor transfer function
Gg5=tf(1,[Tg5 1]);
% Droop compensation transfer function
Gdc5=tf([Tr5 1],[(Rt5/Rp5)*Tr5 1]);
% Turbine transfer function
Gt5=tf([-Tw5 1],[0.5*Tw5 1]);

% Generator 6 (Hydraulic)
Tg6=0.180;
Tw6=1.0;
Tr6=5.0;
Rt6=0.38;
Rp6=0.06;

% Governor transfer function
Gg6=tf(1,[Tg6 1]);
% Droop compensation transfer function
Gdc6=tf([Tr6 1],[(Rt6/Rp6)*Tr6 1]);
% Turbine transfer function
Gt6=tf([-Tw6 1],[0.5*Tw6 1]);

% Generator 7 (Hydraulic)
Tg7=0.180;
Tw7=1.0;
Tr7=5.0;
Rt7=0.38;
Rp7=0.06;

% Governor transfer function
Gg7=tf(1,[Tg7 1]);
% Droop compensation transfer function
Gdc7=tf([Tr7 1],[(Rt7/Rp7)*Tr7 1]);
% Turbine transfer function
Gt7=tf([-Tw7 1],[0.5*Tw7 1]);

% Generator 8 (Hydraulic)
Tg8=0.180;
Tw8=1.0;
Tr8=5.0;
Rt8=0.38;
Rp8=0.06;

% Governor transfer function
Gg8=tf(1,[Tg8 1]);
% Droop compensation transfer function
Gdc8=tf([Tr8 1],[(Rt8/Rp8)*Tr8 1]);
% Turbine transfer function
Gt8=tf([-Tw8 1],[0.5*Tw8 1]);

% Generator 9 (Reheat steam)
Fhp9=0.3;
Trh9=8.720;
Tch9=0.2;
Tg9=0.1;
R9=0.0548;

% Governor transfer function
Gg9=tf(1,[Tg9 1]);
% Turbine transfer function
Gt9=tf([Fhp9*Trh9 1],conv([Tch9 1],[Trh9 1]));

% Generator 10 (Hydraulic)
Tg10=0.080;
Tw10=1.0;
Tr10=5.0;
Rt10=0.38;
Rp10=0.06;

% Governor transfer function
Gg10=tf(1,[Tg10 1]);
% Droop compensation transfer function
Gdc10=tf([Tr10 1],[(Rt10/Rp10)*Tr10 1]);
% Turbine transfer function
Gt10=tf([-Tw10 1],[0.5*Tw10 1]);

%% Wind Turbine Parameters

% -------------------------------------------------------------
% Wind Turbine Generator Model
% -------------------------------------------------------------

% Time constants of the pitch actuator
tp1=6.0;
tp2=0.041;
% Gain of the pitch actuator
kp1=1.25;
% Gain of the first-order lag
kp2=1.40;
% Blade characteristic
kpc=0.8;

% WT Generator 1 [Areas 1, 2 and 3]

% Pitch actuator
Gwp=kp1*tf([tp1 1],[1 1])*tf(1,[tp2 1]);
% First-order lag
Gwl=tf(kp2,[1 1]);

% Droop of W1 [Area 1]
RWT1=0.024;
% Droop of W3 [Area 3]
RWT3=0.024;

%% PV Generator Parameters

% -------------------------------------------------------------
% PV Generator model
% -------------------------------------------------------------

% Participation in LFC [Areas 1, 2 and 3]
Gpv_LFC=2.18*tf([1 10],[1 21.76]);

% Droop for PV generators

% Area 1
RPV1=0.05;
% Area 2
RPV2=0.05;
% Area 3
RPV3=0.05;

% Negative load
Gpv_load_1=tf(1,[1.8 1]);
Gpv_load_2=tf(1,[1.8 1]);
Gpv_load_3=tf(1,[1.8 1]);

%% Frequency Bias and Participation factors

% -------------------------------------------------------------
% Equivalent Droop of each area
% -------------------------------------------------------------

% Equivalent droop of Area 1
Req1=inv((1/R1)+(1/Rp2)+(1/Rp3)+(1/RWT1)+(1/RPV1));
% Equivalent droop of Area 2
Req2=inv((1/R4)+(1/Rp5)+(1/Rp6)+(1/Rp7)+(1/RPV2));
% Equivalent droop of Area 3
Req3=inv((1/R9)+(1/Rp8)+(1/Rp10)+(1/RWT3)+(1/RPV3));

% -------------------------------------------------------------
% Frequency Bias Factor
% -------------------------------------------------------------

% Frequency bias factor of Area 1
B1=(1/Req1)+D;
% Frequency bias factor of Area 2
B2=(1/Req2)+D;
% Frequency bias factor of Area 3
B3=(1/Req3)+D;

% -------------------------------------------------------------
% Participation Factors
% -------------------------------------------------------------

% Area 1
a_1=0.5;
a_2=0.125;
a_3=0.125;
a_WT1=0.125;
a_PV1=0.125;

% Area 2
a_4=0.5;
a_5=0.1;
a_6=0.1;
a_7=0.1;
a_PV2=0.2;

% Area 3
a_8=0.125;
a_9=0.5;
a_10=0.125;
a_WT3=0.125;
a_PV3=0.125;

%% Overall Nominal Plant Transfer Functions

% -------------------------------------------------------------
% Nominal Transfer Functions for each Area
% -------------------------------------------------------------

% Transfer function (Area 1)

GSum_A1=a_1*Gg1*Gt1+a_2*Gg2*Gdc2*Gt2...
    +a_3*Gg3*Gdc3*Gt3+a_WT1*Gwp*Gwl*kpc...
    +a_PV1*Gpv_LFC;

GSum_A1_d=a_1*Gg1*Gt1/R1+a_2*Gg2*Gdc2*Gt2/Rp2...
    +a_3*Gg3*Gdc3*Gt3/Rp3+a_WT1*Gwp*Gwl*kpc/RWT1...
    +a_PV1*Gpv_LFC/RPV1;

G1=(Grm_1*GSum_A1)/(1+Grm_1*GSum_A1_d);
G1=minreal(G1,0.1);

% Transfer function (Area 2)
GSum_A2=a_4*Gg4*Gt4+a_5*Gg5*Gdc5*Gt5...
    +a_6*Gg6*Gdc6*Gt6+a_7*Gg7*Gdc7*Gt7...
    +a_PV2*Gpv_LFC;

GSum_A2_d=a_4*Gg4*Gt4/R4+a_5*Gg5*Gdc5*Gt5/Rp5...
    +a_6*Gg6*Gdc6*Gt6/Rp6+a_7*Gg7*Gdc7*Gt7/Rp7...
    +a_PV2*Gpv_LFC/RPV2;

G2=(Grm_2*GSum_A2)/(1+Grm_2*GSum_A2_d);
G2=minreal(G2,0.1);

% Transfer function (Area 3)
GSum_A3=a_9*Gg9*Gt9+a_8*Gg8*Gdc8*Gt8...
    +a_10*Gg10*Gdc10*Gt10...
    +a_WT3*Gwp*Gwl*kpc+a_PV3*Gpv_LFC;

GSum_A3_d=a_9*Gg9*Gt9/R9+a_8*Gg8*Gdc8*Gt8/Rp8...
    +a_10*Gg10*Gdc10*Gt10/Rp10...
    +a_WT3*Gwp*Gwl*kpc/RWT3+a_PV3*Gpv_LFC/RPV3;

G3=(Grm_3*GSum_A3)/(1+Grm_3*GSum_A3_d);
G3=minreal(G3,0.1);
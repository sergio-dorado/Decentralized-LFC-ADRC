%% DATA POSTPROCESSING - SIMULATION RESULTS

% Description: this script generates the plots showing the results based
% on the execution of the Simulink model 'DecentralizedLFADRC.slx'.

clc
close all

% Simulation time
t=tie_line.time;

% Frequency response without ADRC
w1_no_ADRC=frequency.signals.values(:,1)*2*pi/60;
w2_no_ADRC=frequency.signals.values(:,2)*2*pi/60;
w3_no_ADRC=frequency.signals.values(:,3)*2*pi/60;

% Frequency with ADRC
w1=frequency_ADRC.signals.values(:,1)*2*pi/60;
w2=frequency_ADRC.signals.values(:,2)*2*pi/60;
w3=frequency_ADRC.signals.values(:,3)*2*pi/60;

% Tieline power with ADRC
p12=tie_line_ADRC.signals.values(:,1);
p23=tie_line_ADRC.signals.values(:,2);
p31=tie_line_ADRC.signals.values(:,3);

% Tieline power without ADRC
p12_no_ADRC=tie_line.signals.values(:,1);
p23_no_ADRC=tie_line.signals.values(:,2);
p31_no_ADRC=tie_line.signals.values(:,3);

% Colors for plots
color_plot_A1=[0.8706 0.4902 0];
color_plot_A2=[0.4941 0.1843 0.5569];
color_plot_A3=[0.3020 0.7451 0.9333];

%% Load area disturbances

% Area 1
lda1=LoadDisturbanceArea1.signals.values();
% Area 2
lda2=LoadDisturbanceArea2.signals.values();
% Area 3
lda3=LoadDisturbanceArea3.signals.values();

% Plot of area disturbances

figure('Renderer', 'painters', 'Position', [10 10 800 600])
set(0, 'DefaultLineLineWidth', 1.5);
set(0,'DefaultAxesFontSize', 18)
set(0,'DefaultTextFontSize', 18)
set(0, 'DefaultTextFontName', 'Palatino')
set(0, 'DefaultAxesFontName', 'Palatino')

plot(t,lda1,'Color',color_plot_A1,'linewidth',2)
hold on
plot(t,lda2,'Color',color_plot_A2,'linewidth',2)
plot(t,lda3,'Color',color_plot_A3,'linewidth',2)

title('Load Disturbance per Area','interpreter','latex')
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta P_L$ (pu)','interpreter','latex')

leg1=legend('Area 1','Area 2','Area 3', 'location', 'best');

set(leg1,'interpreter','latex');
set(leg1,'location','northwest');
set(gca,'FontName','Times');

grid on

xlim([0 480])
%% Frequency Deviation No ADRC

close all

figure('Renderer', 'painters', 'Position', [10 10 800 600])
plot(t,w1_no_ADRC,'Color',color_plot_A1,'linewidth',2)
hold on
plot(t,w2_no_ADRC,'Color',color_plot_A2,'linewidth',2)
plot(t,w3_no_ADRC,'Color',color_plot_A3,'linewidth',2)
title('Frequency Deviation in each Control Area (no ADRC)','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta \omega_{e}$ (pu)','interpreter','latex','fontsize',20)
leg1=legend('Area 1','Area 2','Area 3');
set(leg1,'interpreter','latex');
set(leg1,'FontSize',20);
set(leg1,'location','best');
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])

grid on

%% Frequency deviation with ADRC

close all

figure('Renderer', 'painters', 'Position', [10 10 800 600])
plot(t,w1,'Color',color_plot_A1,'linewidth',2)
hold on
plot(t,w2,'Color',color_plot_A2,'linewidth',2)
plot(t,w3,'Color',color_plot_A3,'linewidth',2)
title('Frequency Deviation in each Control Area','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta \omega_e$ (pu)','interpreter','latex','fontsize',20)
leg1=legend('Area 1','Area 2','Area 3');
set(leg1,'interpreter','latex');
set(leg1,'FontSize',20);
set(leg1,'location','southeast');
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])

grid on

%% Frequency deviation in each control area

close all

% Area 1
figure('Renderer', 'painters', 'Position', [10 10 1000 600])
plot(t,w1,'Color',color_plot_A1,'linewidth',2)
title('Frequency Deviation in Control Area 1','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta \omega_{e,1}$ (pu)','interpreter','latex','fontsize',20)
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])
grid on

hold off
axes('Position',[0.12 0.65 0.3 0.25])
box on
plot(t,w1,'Color',color_plot_A1,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta \omega_{e,1}$ (pu)','interpreter','latex')
xlim([100 150])
grid on

axes('Position',[0.47 0.20 0.3 0.25])
box on
plot(t,lda1,'Color',[0.64 0.078 0.180],'linewidth',1.5)
set(gca,'FontName','Times');
title('Load Disturbance of Area 1','interpreter','latex')
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta P_{L,1}$ (pu)','interpreter','latex')
xlim([0 480])
ylim([-0.5 4.5])
grid on

axes('Position',[0.47 0.65 0.3 0.25])
box on
plot(t,w1,'Color',color_plot_A1,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta \omega_{e,1}$ (pu)','interpreter','latex')
xlim([400 480])
grid on
%%
% Area 2

close all

figure('Renderer', 'painters', 'Position', [10 10 1000 600])
plot(t,w2,'Color',color_plot_A2,'linewidth',2)
title('Frequency Deviation in Control Area 2','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta \omega_{e,2}$ (pu)','interpreter','latex','fontsize',20)
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])
ylim([-6e-4 6e-4])
grid on

hold off
axes('Position',[0.12 0.65 0.3 0.25])
box on
plot(t,w2,'Color',color_plot_A2,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta \omega_{e,2}$ (pu)','interpreter','latex')
xlim([0 100])
grid on

axes('Position',[0.12 0.18 0.3 0.25])
box on
plot(t,lda2,'Color',[0.64 0.078 0.180],'linewidth',1.5)
set(gca,'FontName','Times');
title('Load Disturbance of Area 2','interpreter','latex')
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta P_{L,2}$ (pu)','interpreter','latex')
xlim([0 480])
ylim([-0.5 5.5])
grid on

axes('Position',[0.571 0.65 0.3 0.25])
box on
plot(t,w2,'Color',color_plot_A2,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta \omega_{e,2}$ (pu)','interpreter','latex')
xlim([230 300])
ylim([-1.5e-3 1.5e-3])
grid on

axes('Position',[0.571 0.18 0.3 0.25])
box on
plot(t,w2,'Color',color_plot_A2,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta \omega_{e,2}$ (pu)','interpreter','latex')
xlim([405 460])
grid on

%%

% Area 3

close all

figure('Renderer', 'painters', 'Position', [10 10 1000 600])
plot(t,w3,'Color',color_plot_A3,'linewidth',2)
title('Frequency Deviation in Control Area 3','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta \omega_{e,3}$ (pu)','interpreter','latex','fontsize',20)
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])
ylim([-6e-3 6e-3])
grid on

hold off
axes('Position',[0.18 0.62 0.3 0.25])
box on
plot(t,w3,'Color',color_plot_A3,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta \omega_{e,3}$ (pu)','interpreter','latex')
xlim([30 80])
ylim([-50e-4 50e-4])
grid on

axes('Position',[0.18 0.18 0.3 0.25])
box on
plot(t,lda3,'Color',[0.64 0.078 0.180],'linewidth',1.5)
set(gca,'FontName','Times');
title('Load Disturbance of Area 3','interpreter','latex')
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta P_{L,3}$ (pu)','interpreter','latex')
xlim([0 480])
ylim([-0.5 5.5])
grid on

axes('Position',[0.546 0.62 0.3 0.25])
box on
plot(t,w3,'Color',color_plot_A3,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta \omega_{e,3}$ (pu)','interpreter','latex')
xlim([200 300])
ylim([-40e-5 40e-5])
grid on

axes('Position',[0.546 0.18 0.3 0.25])
box on
plot(t,w3,'Color',color_plot_A3,'linewidth',1.5)
set(gca,'FontName','Times');
xlabel('Time (s)','interpreter','latex')
ylabel('$\Delta \omega_{e,3}$ (pu)','interpreter','latex')
xlim([400 480])
ylim([-40e-5 40e-5])
grid on

%% Tie line power with ADRC

close all

figure('Renderer', 'painters', 'Position', [10 10 800 600])
plot(t,p12,'Color',color_plot_A1,'linewidth',2)
hold on
plot(t,p23,'Color',color_plot_A2,'linewidth',2)
plot(t,p31,'Color',color_plot_A3,'linewidth',2)
title('Tieline Exchange between Control Areas','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta P$ (pu)','interpreter','latex','fontsize',20)
leg1=legend('$\Delta P_{12}$','$\Delta P_{23}$','$\Delta P_{31}$');
set(leg1,'interpreter','latex');
set(leg1,'FontSize',20);
set(leg1,'location','southeast');
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])
grid on

%% Tieline power without ADRC 

figure('Renderer', 'painters', 'Position', [10 10 800 600])
plot(t,p12_no_ADRC,'Color',color_plot_A1,'linewidth',2)
hold on
plot(t,p23_no_ADRC,'Color',color_plot_A2,'linewidth',2)
plot(t,p31_no_ADRC,'Color',color_plot_A3,'linewidth',2)
title('Tieline Exchange between Control Areas (no ADRC)','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('$\Delta P$ (pu)','interpreter','latex','fontsize',20)
leg1=legend('$\Delta P_{12}$','$\Delta P_{23}$','$\Delta P_{31}$');
set(leg1,'interpreter','latex');
set(leg1,'FontSize',20);
set(leg1,'location','southeast');
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])
grid on

%% ACE (no ADRC)

ACE_1_no_ADRC = ACE.signals.values(:, 1);
ACE_2_no_ADRC = ACE.signals.values(:, 2);
ACE_3_no_ADRC = ACE.signals.values(:, 3);

figure('Renderer', 'painters', 'Position', [10 10 800 600])
plot(t,ACE_1_no_ADRC,'Color',color_plot_A1,'linewidth',2)
hold on
plot(t,ACE_2_no_ADRC,'Color',color_plot_A2,'linewidth',2)
plot(t,ACE_3_no_ADRC,'Color',color_plot_A3,'linewidth',2)
title('ACE for each Control Area','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('ACE (pu)','interpreter','latex','fontsize',20)
leg1=legend('ACE$_1$','ACE$_2$','ACE$_3$');
set(leg1,'interpreter','latex');
set(leg1,'FontSize',20);
set(leg1,'location','northeast');
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])

grid on

%% ACE (with ADRC)

close all

ACE_1 = ACE_ADRC.signals.values(:, 1);
ACE_2 = ACE_ADRC.signals.values(:, 2);
ACE_3 = ACE_ADRC.signals.values(:, 3);

figure('Renderer', 'painters', 'Position', [10 10 800 600])
plot(t,ACE_1,'Color',color_plot_A1,'linewidth',2)
hold on
plot(t,ACE_2,'Color',color_plot_A2,'linewidth',2)
plot(t,ACE_3,'Color',color_plot_A3,'linewidth',2)
title('ACE for each Control Area','interpreter','latex','fontsize',22)
xlabel('Time (s)','interpreter','latex','fontsize',20)
ylabel('ACE (pu)','interpreter','latex','fontsize',20)
leg1=legend('ACE$_1$','ACE$_2$','ACE$_3$');
set(leg1,'interpreter','latex');
set(leg1,'FontSize',20);
set(leg1,'location','northeast');
set(gca,'FontSize',20);
set(gca,'FontName','Times');
xlim([0 480])

grid on

%% Metrics - Frequency ISE/IAE (no ADRC)

clc

ISE_w1_no_ADRC = sum((abs(w1_no_ADRC).^2) * dt );
ISE_w2_no_ADRC = sum((abs(w2_no_ADRC).^2) * dt );
ISE_w3_no_ADRC = sum((abs(w3_no_ADRC).^2) * dt );

IAE_w1_no_ADRC = sum((abs(w1_no_ADRC)) * dt );
IAE_w2_no_ADRC = sum((abs(w2_no_ADRC)) * dt );
IAE_w3_no_ADRC = sum((abs(w3_no_ADRC)) * dt );

fprintf('ISE_w1_no_ADRC: %.4f\n', ISE_w1_no_ADRC)
fprintf('ISE_w2_no_ADRC: %.4f\n', ISE_w2_no_ADRC)
fprintf('ISE_w3_no_ADRC: %.4f\n', ISE_w3_no_ADRC)

fprintf('IAE_w1_no_ADRC: %.4f\n', IAE_w1_no_ADRC)
fprintf('IAE_w2_no_ADRC: %.4f\n', IAE_w2_no_ADRC)
fprintf('IAE_w3_no_ADRC: %.4f\n', IAE_w3_no_ADRC)

%% Frequency ISE/IAE (with ADRC)

clc

format long

dt = abs(t(1) - t(2));

ISE_w1 = sum((abs(w1).^2) * dt );
ISE_w2 = sum((abs(w2).^2) * dt );
ISE_w3 = sum((abs(w3).^2) * dt );

fprintf('ISE_w1: %.4e\n', ISE_w1)
fprintf('ISE_w2: %.4e\n', ISE_w2)
fprintf('ISE_w3: %.4e\n', ISE_w3)

IAE_w1 = sum((abs(w1)) * dt );
IAE_w2 = sum((abs(w2)) * dt );
IAE_w3 = sum((abs(w3)) * dt );

fprintf('IAE_w1: %.4e\n', IAE_w1)
fprintf('IAE_w2: %.4f\n', IAE_w2)
fprintf('IAE_w3: %.4e\n', IAE_w3)

%% Tieline ISE/IAE (no ADRC)

clc

ISE_p12_no_ADRC = sum((abs(p12_no_ADRC).^2) * dt );
ISE_p23_no_ADRC = sum((abs(p23_no_ADRC).^2) * dt );
ISE_p31_no_ADRC = sum((abs(p31_no_ADRC).^2) * dt );

IAE_p12_no_ADRC = sum((abs(p12_no_ADRC)) * dt );
IAE_p23_no_ADRC = sum((abs(p23_no_ADRC)) * dt );
IAE_p31_no_ADRC = sum((abs(p31_no_ADRC)) * dt );

fprintf('ISE_p12_no_ADRC: %.4f\n', ISE_p12_no_ADRC)
fprintf('ISE_p23_no_ADRC: %.4e\n', ISE_p23_no_ADRC)
fprintf('ISE_p31_no_ADRC: %.4e\n', ISE_p31_no_ADRC)

fprintf('IAE_p12_no_ADRC: %.4f\n', IAE_p12_no_ADRC)
fprintf('IAE_p23_no_ADRC: %.4e\n', IAE_p23_no_ADRC)
fprintf('IAE_p31_no_ADRC: %.4e\n', IAE_p31_no_ADRC)

%% Tieline ISE/IAE (with ADRC)

clc

ISE_p12 = sum((abs(p12).^2) * dt );
ISE_p23 = sum((abs(p23).^2) * dt );
ISE_p31 = sum((abs(p31).^2) * dt );

fprintf('ISE_p12: %.4e\n', ISE_p12)
fprintf('ISE_p23: %.4e\n', ISE_p23)
fprintf('ISE_p31: %.4e\n', ISE_p31)

IAE_p12 = sum((abs(p12)) * dt );
IAE_p23 = sum((abs(p23)) * dt );
IAE_p31 = sum((abs(p31)) * dt );

fprintf('IAE_p12: %.4e\n', IAE_p12)
fprintf('IAE_p23: %.4e\n', IAE_p23)
fprintf('IAE_p31: %.4e\n\n', IAE_p31)
%% ACE ISE/IAE (no ADRC)

clc

ISE_ACE_1_no_ADRC = sum((abs(ACE_1_no_ADRC).^2) * dt );
ISE_ACE_2_no_ADRC = sum((abs(ACE_2_no_ADRC).^2) * dt );
ISE_ACE_3_no_ADRC = sum((abs(ACE_3_no_ADRC).^2) * dt );

fprintf('ISE_ACE_1_no_ADRC: %.4e\n', ISE_ACE_1_no_ADRC)
fprintf('ISE_ACE_2_no_ADRC: %.4e\n', ISE_ACE_2_no_ADRC)
fprintf('ISE_ACE_3_no_ADRC: %.4e\n', ISE_ACE_3_no_ADRC)

IAE_ACE_1_no_ADRC = sum((abs(ACE_1_no_ADRC)) * dt );
IAE_ACE_2_no_ADRC = sum((abs(ACE_2_no_ADRC)) * dt );
IAE_ACE_3_no_ADRC = sum((abs(ACE_3_no_ADRC)) * dt );

fprintf('IAE_ACE_1_no_ADRC: %.4e\n', IAE_ACE_1_no_ADRC)
fprintf('IAE_ACE_2_no_ADRC: %.4f\n', IAE_ACE_2_no_ADRC)
fprintf('IAE_ACE_3_no_ADRC: %.4e\n', IAE_ACE_3_no_ADRC)


%% ACE (with ADRC)

clc

ISE_ACE_1 = sum((abs(ACE_1).^2) * dt );
ISE_ACE_2 = sum((abs(ACE_2).^2) * dt );
ISE_ACE_3 = sum((abs(ACE_3).^2) * dt );

fprintf('ISE_ACE_1: %.4e\n', ISE_ACE_1)
fprintf('ISE_ACE_2: %.4e\n', ISE_ACE_2)
fprintf('ISE_ACE_3: %.4e\n', ISE_ACE_3)

IAE_ACE_1 = sum((abs(ACE_1)) * dt );
IAE_ACE_2 = sum((abs(ACE_2)) * dt );
IAE_ACE_3 = sum((abs(ACE_3)) * dt );

fprintf('IAE_ACE_1: %.4e\n', IAE_ACE_1)
fprintf('IAE_ACE_2: %.4e\n', IAE_ACE_2)
fprintf('IAE_ACE_3: %.4e\n', IAE_ACE_3)
% AERSP 458 Project 2
% Teammates: To,Han-Yu & Aditya Singhal
clear, clc
format long;
%initial conditions t = 0
a0 = 12000;
e0 = 0.4;
i0 = 28.5/180*pi; % [rad]
omega0 = 70/180*pi; % [rad]
w0 = 50/180*pi; % [rad]
theta0 = 0; % [rad]
%time
t0 = 0;
tf = 2.42e6;
%other variables
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8); %tolerance
mu = 3.986e5; % [km^3/s^2]
T = 2*pi*sqrt(a0^3/mu); % orbital period
%State space variables
x0 = [a0; e0; i0; omega0; w0; theta0];
[t, xfinal] = ode45('StateSpace',[t0 T], x0, options); %for 1 orbital T
[t2, xfinal2] = ode45('StateSpace',[t0 tf], x0, options); % t0 to tf
fprintf('a = %f km \ne = %f \ni = %f rad \nOmega = %f rad \nw = %f rad \ntheta = %f rad\n',...
    xfinal2(end,1),xfinal2(end,2),xfinal2(end,3),xfinal2(end,4),xfinal2(end,5),mod(xfinal2(end,6),(2*pi)));

%plots
figure();
subplot(2,3,1);
plot(t, xfinal(:,1) - x0(1), 'linewidth',1.5);
title('\Delta a in 1 orbital period');
xlabel('t [s]');
ylabel('\Delta a [km]');
xlim([0 T]);


subplot(2,3,2);
plot(t, xfinal(:,2) - x0(2), 'linewidth',1.5);
title('\Delta e in 1 orbital period');
xlabel('t [s]');
ylabel('\Delta e');
xlim([0 T]);

subplot(2,3,3);
plot(t, xfinal(:,3)- x0(3), 'linewidth',1.5);
title('\Delta i in 1 orbital period');
xlabel('t [s]');
ylabel('\Delta i [rad]');
xlim([0 T]);

subplot(2,3,4);
plot(t, xfinal(:,4)- x0(4), 'linewidth',1.5);
title('\Delta \Omega in 1 orbital period');
xlabel('t [s]');
ylabel('\Delta \Omega [rad]');
xlim([0 T]);

subplot(2,3,5);
plot(t, xfinal(:,5)- x0(5), 'linewidth',1.5);
title('\Delta \omega in 1 orbital period');
xlabel('t [s]');
ylabel('\Delta \omega [rad]');
xlim([0 T]);

subplot(2,3,6);
plot(t, mod((xfinal(:,6)- x0(6)),2*pi), 'linewidth',1.5);
title('\Delta \theta in 1 orbital period');
xlabel('t [s]');
ylabel('\Delta \theta [rad]');
xlim([0 T]);

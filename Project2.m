% AERSP 458 Project 2
% Teammates: To,Han-Yu & Aditya Singhal
clear, clc

%thrust accelerations
ar = 7e-8;
atheta = 4e-8;
aN = 5e-8;
%initial conditions t = 0
t0 = 0;
a0 = 12000;
e0 = 0.4;
i0 = 28.5; % [deg]
omega0 = 70; % [deg]
w0 = 50; % [deg]
theta0 = 0; % [deg]
%final
tf = 2.42e6;
%Earth varibles
mu = 3.986e5; % [km^3/s^2]
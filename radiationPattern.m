% Plots Ideal and Experimental Radiation Pattern
% Microsoft Surface Clinic 2016

clf
% Load Ideal and Experimental Data
load rpIdealExperiment.mat

% Scale
r_scale = r - max(r)
r_exp_scale = r_exp - max(r_exp)

% Plot
th = 0:pi/8:2*pi;
polarplot(th,r_scale,'-o');
legend('Ideal')
hold on
polarplot(th, r_exp_scale,'-x');
hold off
legend('Ideal','Experimental')
title('TP-Link Radiation Pattern')
rlim([-30 0])
% view([90 -90])
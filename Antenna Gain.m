%Microsoft Surface Clinic Team
%10/5 Experiment 1
Trans_P = 0;
% s11 vswr 1.3 mismatch loss = 0.07


% Trans_Ant_Gain = want to find
Trans_Loss = 0.18; %vswr = 1.5
Misc_Loss = 0;
Rec_Ant_Gain = 12.5 -2.41;
Rec_Loss = 0; %vswr = 1.07
Distance = 1.778;
Wavelength = 0.122;
Friis_Eq = 20*log10(Wavelength/(4*pi*(Distance)));
Rec_P = -32.5;
% Rec_P = Trans_P + Trans_Ant_Gain - Trans_Loss - Misc_Loss + Rec_Ant_Gain - Rec_Loss + Friis_Eq
Trans_Ant_Gain = -Trans_P + Rec_P + Trans_Loss + Misc_Loss - Rec_Ant_Gain + Rec_Loss - Friis_Eq

%Dipole antenna 1: Trans_Ant_Gain = 3.1856 with vswr S11 = 1.6 vswr S22 =
%1.07 Rec_P = -32.22
%Dipole Antenna 2: Trans_Ant_Gain = 2.9056 with vswr S11 = 1.61 vswr S22 =
%1.07 Rec_P = -32.5

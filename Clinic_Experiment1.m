%Microsoft Surface Clinic Team
%10/5 Experiment 1
Trans_P = 0;
% Trans_Ant_Gain = want to find
Trans_Loss = 9.07; %vswr = 30.249
% Trans_Loss = 0.05;
Misc_Loss = 0;
Rec_Ant_Gain = 12.5 - 2.41;
Rec_Loss = 0; %vswr = 1
Distance = 1.778;
Wavelength = 0.122;
Frisk_Eq = 20*log10(Wavelength/(4*pi*Distance));
Rec_P = -58.8;
% Rec_P = Trans_P + Trans_Ant_Gain - Trans_Loss - Misc_Loss + Rec_Ant_Gain - Rec_Loss + Frisk_Eq
Trans_Ant_Gain = -Trans_P + Rec_P + Trans_Loss + Misc_Loss - Rec_Ant_Gain + Rec_Loss - Frisk_Eq

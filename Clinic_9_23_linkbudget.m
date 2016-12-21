%Microsoft Surface Clinic Team
%9/23 link budget calculation

Trans_P = 0;
Trans_Ant_Gain = 9;
Trans_Loss = 0;
Misc_Loss = 0;
Rec_Ant_Gain = 11.5;
Rec_Loss = 0;
Distance = 10;
Wavelength = 0.122;
Frisk_Eq = 20*log10(Wavelength/(4*pi*Distance))

Rec_P = Trans_P + Trans_Ant_Gain - Trans_Loss - Misc_Loss + Rec_Ant_Gain - Rec_Loss + Frisk_Eq

% S = [0.48 0.38];%S11 S22
% MM = 10.*log10(1-10.^(S./10))
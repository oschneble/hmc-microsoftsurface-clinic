%Microsoft Surface Clinic Team
%10/5 Experiment 1

%GOVERNING EQUATIONS:
% MM = 10log10(1-10^(s11/10))
% Gt = Pr - Pt - Gr - 20log10(lambda/(4*pi*r))

%INPUTS:
Trans_P = 0; %transmitting 0dB from port 1
Frequency = 2.45E9;

S11= ;
S21 = -32.5;

%CALCULATED VALUES:
%Trans_Loss = -10*log10(1-((VSWR-1)/(VSWR+1))^2);
MM_Loss = 10*log10(1-10^(s11/10));%REPLACE VSWR WITH S11 IN THIS EQN (CHECK W/ SPENCER NOTES)
Wavelength = 3*10^8/Frequency;


%OTHER VALUES: 
%Trans_Loss = 0.18; %vswr = 1.5
Misc_Loss = 0;
Rec_Ant_Gain = 12.5;%vary w/ frequency
Rec_Loss = 0; 
Distance = 1.778;%anechoic chamber length in m
Friis_Eq = 20*log10(Wavelength/(4*pi*(Distance)));%FREE SPACE PATH LOSS FAR FIELD ONLY

%GAIN CALCULATION:
% Rec_P = Trans_P + Trans_Ant_Gain - Trans_Loss - Misc_Loss + Rec_Ant_Gain - Rec_Loss + Friis_Eq
% S21 is ReP-TransP (or ratio of Pforward/Ptotal)
Trans_Ant_Gain = S21 + MM_Loss - Rec_Ant_Gain - Friis_Eq

%Dipole antenna 1: Trans_Ant_Gain = 3.1856 with vswr S11 = 1.6 vswr S22 =
%1.07 Rec_P = -32.22
%Dipole Antenna 2: Trans_Ant_Gain = 2.9056 with vswr S11 = 1.61 vswr S22 =
%1.07 Rec_P = -32.5

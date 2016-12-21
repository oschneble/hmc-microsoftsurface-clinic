%10/19/2016
%Clinic Experiment 1


Distance = [9.799339599 4.699009398 3.149606299 0.914401829 1.612903226];
Distance1 = [9.799339599 4.699009398 3.149606299 0.914401829 ];
Distance2 = linspace(0,10,100);

Trans_P = 0;
Trans_Ant_Gain = 3.1856; 
Trans_Loss = 0.07; %swr = 1.3
Misc_Loss = 0;
Rec_Ant_Gain = 2.9056;
Rec_Loss = 0.5;%swr =1.98

Wavelength = 0.122;
Friis_Eq = 20.*log10(Wavelength./(4.*pi.*Distance2));
x = Trans_P + Trans_Ant_Gain - Trans_Loss - Misc_Loss + Rec_Ant_Gain - Rec_Loss;
Rec_P = Trans_P + Trans_Ant_Gain - Trans_Loss - Misc_Loss + Rec_Ant_Gain - Rec_Loss + Friis_Eq;

offset = [4.5 4.5 4.5 4.5 4.5];
offset1 = [4.5 4.5 4.5 4.5];
v_v = [-57 -49 -46.5 -38 -40];
v_v1 = v_v + offset-x;
v_h = [-65 -57 -61 -54 ];
v_h1 = v_h + offset1-x;
h_h = [-65 -54.5 -53 -40 ];
h_h1 = h_h + offset1-x;
fourty_five = [-55 -51 -48 -42 ];
fourty_five1 = fourty_five + offset1-x;


Rec_P = Trans_P + Trans_Ant_Gain - Trans_Loss - Misc_Loss + Rec_Ant_Gain - Rec_Loss + Friis_Eq;

plot(Distance, v_v1,'d', Distance1, v_h1, 'o', Distance1, h_h1, 'x', Distance1, fourty_five1, '*', Distance2, Friis_Eq, 'blue')
legend('v/v','v/h','h/h','45', 'Friis Equation')
axis([0 10 -70 -20])
xlabel('Distance (m)')
ylabel('Power Loss (dB)')
title('Power Loss over Distance')



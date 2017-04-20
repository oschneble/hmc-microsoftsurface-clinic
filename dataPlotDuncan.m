%Find slope fits for Path Loss following ITU
%where PL = -(20*log10(f)+ N*log10(x) + Lf)
%First we import each file;
fNum = 1;
%% Data File Parameters
[data_file_name, folder_name] = uigetfile('*.csv', 'Select the trace reference CSV file');
%folder_name = '/Users/cherieho/Downloads/Big Beckman 1-18/SameLevelDay1/'
%data_file_name = 'processed_data.csv'
data_file_add = strcat(folder_name, data_file_name);
data_matrix(:,:,fNum) = csvread(data_file_add);      % puts info in matrix M
num_trials = 6; % Hexagon Data Collection Pattern
freqs = [650 750 950 2450 5200];
%% Extract Data
num_dist = size(data_matrix,1);
distances_m(:,1,fNum) = data_matrix(:,1,fNum);
polarization(:,1,fNum) = data_matrix(:,2,fNum);
free_space_loss(:,1,fNum) = data_matrix(:,3,fNum); % No obstacle, purely based on distance
endCol_Lfs = 4+num_trials-1;
L_fs(:,1:6, fNum) = data_matrix(:,4:endCol_Lfs, fNum);
%% Stop
endCol_deltaFriis = endCol_Lfs+num_trials-1;
delta_Friis(:,1:6,fNum) = data_matrix(:,endCol_Lfs:endCol_deltaFriis, fNum);
vv =[];
vh =[];
vvd =[];
vhd =[];
for i = 1:num_dist
    if polarization(i,1,fNum) == 1 %v/v
        vv = [vv; L_fs(i,:, fNum)];
        vvd = [vvd; distances_m(i, :, fNum)*[1 1 1 1 1 1]];
    elseif polarization(i,1,fNum) == 2
        vh = [vh; L_fs(i,:, fNum)];
        vhd = [vhd; distances_m(i, : , fNum)*[1 1 1 1 1 1]];
    end
end

%% Plot
figure(1);
set(gca,'FontSize',14)
set(0,'DefaultLineMarkerSize',12);
hold on
num_dist = size(data_matrix,1);
plot_mean_std=true;

if plot_mean_std
    for i = 1:num_dist
        if freqs(fNum)== 650
            if polarization(i,1,fNum) == 1 %v/v
                vv650 = plot(distances_m(i,1,fNum), mean(L_fs(i,:,fNum)),'r*');
                errorbar(distances_m(i,1,fNum),mean(L_fs(i,:,fNum)),std(L_fs(i,:,fNum)),'r');
%             elseif polarization(i) == 2 %v/h
%                 vh650 = plot(distances_m(i), mean(L_fs(i,:)),'rx');
%                 errorbar(distances_m(i),mean(L_fs(i,:)),std(L_fs(i,:)),'r');
%             else
%                 hh650 = plot(distances_m(i), mean(L_fs(i,:)),'go');
%                 errorbar(distances_m(i),mean(L_fs(i,:)),std(L_fs(i,:)),'g');
            end
        elseif freqs(fNum)== 750
            if polarization(i,1,fNum) == 1 %v/v
                vv750 = plot(distances_m(i,1,fNum), mean(L_fs(i,:,fNum)),'m*');
                errorbar(distances_m(i,1,fNum),mean(L_fs(i,:,fNum)),std(L_fs(i,:,fNum)),'m');
%            elseif polarization(i) == 2 %v/h
%                 vh750 = plot(distances_m(i), mean(L_fs(i,:)),'gx');
%                 errorbar(distances_m(i),mean(L_fs(i,:)),std(L_fs(i,:)),'g');
%            else
%                 hh750 = plot(distances_m(i), mean(L_fs(i,:)),'go');
%                 errorbar(distances_m(i),mean(L_fs(i,:)),std(L_fs(i,:)),'g');
            end
        elseif freqs(fNum)== 950
            if polarization(i) == 1 %v/v
                vv950 = plot(distances_m(i,1,fNum), mean(L_fs(i,:,fNum)),'g*');
                errorbar(distances_m(i,1,fNum),mean(L_fs(i,:,fNum)),std(L_fs(i,:,fNum)),'g');
%             elseif polarization(i) == 2 %v/h
%                 vh950 = plot(distances_m(i), mean(L_fs(i,:)),'bx');
%                 errorbar(distances_m(i),mean(L_fs(i,:)),std(L_fs(i,:)),'b');
%             else
%                 hh950 = plot(distances_m(i), mean(L_fs(i,:)),'go');
%                 errorbar(distances_m(i),mean(L_fs(i,:)),std(L_fs(i,:)),'g');
            end
        elseif freqs(fNum)== 2450
            if polarization(i,1,fNum) == 1 %v/v
                vv2450 = plot(distances_m(i,1,fNum), mean(L_fs(i,:,fNum)),'c*');
                errorbar(distances_m(i,1,fNum),mean(L_fs(i,:,fNum)),std(L_fs(i,:,fNum)),'c');
%             elseif polarization(i) == 2 %v/h
%                 vh2450 = plot(distances_m(i), mean(L_fs(i,:)),'mx');
%                 errorbar(distances_m(i),mean(L_fs(i,:)),std(L_fs(i,:)),'m');
%             else
%                 hh2450 = plot(distances_m(i), mean(L_fs(i,:)),'go');
%                 errorbar(distances_m(i),mean(L_fs(i,:)),std(L_fs(i,:)),'g');
            end
        else
            if polarization(i,1,fNum) == 1 %v/v
                vv5200 = plot(distances_m(i,1,fNum), mean(L_fs(i,:,fNum)),'b*');
                errorbar(distances_m(i,1,fNum),mean(L_fs(i,:,fNum)),std(L_fs(i,:,fNum)),'b');
%             elseif polarization(i) == 2 %v/h
%                 vh5200 = plot(distances_m(i), mean(L_fs(i,:)),'cx');
%                 errorbar(distances_m(i),mean(L_fs(i,:)),std(L_fs(i,:)),'c');
%             else
%                 hh5200 = plot(distances_m(i), mean(L_fs(i,:)),'go');
%                 errorbar(distances_m(i),mean(L_fs(i,:)),std(L_fs(i,:)),'g');
            end
        end
        
    end
end 
title('Parsons Hallway Path Loss')
ylabel('Path Loss (dB)')
xlabel('Distance between Antennas (m)')
dist_copy = distances_m(:,1,fNum)*[1 1 1 1 1 1];
%cftool(dist_copy,L_fs(:,:,fNum));
fNum = fNum + 1;

%% Add ITU comparison
%legend([vv650 vv750 vv950 vv2450 vv5200],{'650MHz', '750MHz', '950MHz', '2.45GHz','5.2GHz'});
d = 0:0.1:10;
Off = [11.9 22.7 26.8 10.8];
N = [11.8 12.2 13.9 19.8];
%Off = [6.2  17.2 23.3 7.7 12.7]
%N = [11.8 12.4  17.2 13.5 13.9]
%N = [33.6 26.4 23.5 40.5 21.8]
%Off = [28 28 28 28 28]
ITU650 = 20*log10(650) + N(1)*log10(d) - Off(1);
ITU750 = 20*log10(750) + N(2)*log10(d) - Off(2);
ITU950 = 20*log10(950) + N(3)*log10(d) - Off(3);
ITU2450 = 20*log10(2450) + N(4)*log10(d) - Off(4); %From Jadhavar paper
%ITU5200 = 20*log10(5200) + N(5)*log10(d) - Off(5);
plot(d, ITU650, 'r');
plot(d, ITU750, 'm');
plot(d, ITU950, 'g');
plot(d, ITU2450, 'c');
%plot(d, ITU5200, 'b');


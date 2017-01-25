% graphProcessedTraceData.m
% Graph output file from traceDataProcessing.m.
% Cherie Ho. Microsoft Surface Clinic, Fall 2016

%% Data File Parameters
folder_name = '/Users/cherieho/Downloads/Big Beckman 1-18/SameLevelDay1/'
data_file_name = 'processed_data.csv'
data_file_add = strcat(folder_name, data_file_name);
data_matrix = csvread(data_file_add);      % puts info in matrix M
num_trials = 6; % Hexagon Data Collection Pattern

%% Extract Data
distances_m = data_matrix(:,1);
polarization = data_matrix(:,2);
free_space_loss = data_matrix(:,3); % No obstacle, purely based on distance
endCol_Lfs = 4+num_trials-1;
L_fs = data_matrix(:,4:endCol_Lfs);
endCol_deltaFriis = endCol_Lfs+num_trials-1;
delta_Friis = data_matrix(:,endCol_Lfs:endCol_deltaFriis);

%% Graph

figure
set(gca,'FontSize',14)
hold on
num_dist = size(data_matrix,1);

% TODO: the following plotting doesn't seem efficient...
for i = 1:num_dist
    if polarization(i) == 1 %v/v
        plot(distances_m(i)*ones(1,num_trials), L_fs(i,:),'r*');
    elseif polarization(i) == 2 %v/h
        plot(distances_m(i)*ones(1,num_trials), L_fs(i,:),'bx');
    else
        plot(distances_m(i)*ones(1,num_trials), L_fs(i,:),'go');
    end
end

legend('V/V','V/H','H/H')
title('Big Beckman Along Same Level Path Loss')
ylabel('Path Loss (dB)')
xlabel('Distance between Antennas (m)')
hold off

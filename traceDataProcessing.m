% traceDataProcessing.m
% Patrick Scalise, Cherie Ho. Microsoft Surface Clinic, Fall 2016

% Given a set of .csv files taken from N9320B spectrum analyzer, an
% associated set of lengths, and other pertinent info, calculates the path
% loss for each measurement.

cf = 2.45E9;        % center frequency in Hertz

% ref_file is the filename of a reference .csv file with distance and
% filename information
% format is Distance (m), Power (dBm), Trace1, Trace2, Trace3,...
% For this implementation only the distances are needed

ref_file = '/Users/cherieho/Downloads/11-5 polarization traces/ref_hh_hv_through_floor.csv';  
skip_row_num = 2; % Currently: Header has 2 rows
skip_col_num = 3; % Currently: Skip 3 columns
num_trials = 6;

output_matrix = csvread(ref_file, skip_row_num, skip_col_num);      % puts info in matrix M

distances_m = output_matrix(:,1)';      % pulls distances
polarization = output_matrix(:,2)'; % Pulls Polarization
trace_num_list = output_matrix(:,3:8); % put trace number in list of traces based on case (B/1)
trace_folder_name = '/Users/cherieho/Downloads/11-5 polarization traces/'
% Function to make trace filename from trace number
make_trace_filename = @(x) strcat(trace_folder_name,'TRACE',...
    sprintf('%3.3d', x),'.CSV');
filenames = arrayfun(make_trace_filename, trace_num_list, 'un',0);

n = size(output_matrix,1); % Number of cases that will be analyzed
received_power = zeros(n,num_trials); % make empty array for Received power

% for every trace, pull the center frequency power and put it in received
% power
for i = 1:n 
    for j = 1:num_trials
        file = filenames{i,j};
        received_power(i,j) = max_frequency_value(file, cf);
    end
end


% Link budget parameters

P_t   = 20; % Transmit Power
L_mmt = 0.13; % Mismatch Loss for Transmit Cable
G_t   = 3.1856; % Trasmit Gain
G_r   = 2.9056; % Receive Gain
L_mmr = 0.30; % Mismatch Loss for Receive Cable
spectrumAnalyzerError = -4.65;      % CHANGE THIS

c = 2.998E8;        % Speed of light in m/s
lambda = c / cf;    % Wavelength in m


L_fs = P_t - received_power + G_t + G_r - L_mmt - L_mmr - spectrumAnalyzerError;
% Use Friis equation to calulate expected transmission loss
free_space_loss_fun = @(distance) 20 * log10(lambda./(4*pi*distance));
free_space_loss = arrayfun(free_space_loss_fun, distances_m);

delta_Friis = L_fs + diag(free_space_loss)*ones(size(L_fs));

% Creates output matrix of distance, theoretical free space loss, measured
% loss, and the difference between them
output_matrix = [distances_m', polarization', (free_space_loss)', (-1*L_fs), (delta_Friis)];

% sorts matrix by distance
N = sortrows(output_matrix);
% outputs sorted data to .csv file
csvwrite('processed_data.csv', N)
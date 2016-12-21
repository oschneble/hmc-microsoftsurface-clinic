function [ received_power ] = center_frequency_value( filename, cf )
%center_frequency_value returns the receieved power at the center
%frequency of a .csv file. Data file MUST have a value for the exact
%center frequency of interest
%   filename is the string filename of a .csv data file
%   cf is the center frequency of the bandwidth in Hz

endpoint = 472;     % last row of the csv data
                    % normally it's 472

data = csvread(filename, 12, 0, [12 0 endpoint 2]); 
% data is in order Number, Frequency, Amplitude

[row, ~] = find(data(:,2) == (cf));     % pulls the second column (Frequency)

received_power = data(row, 3);          % outputs the third coulumn (dBm)

end


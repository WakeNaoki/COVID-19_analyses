data = readtable('130001_tokyo_covid19_patients.csv','FileEncoding','UTF-8');
data.Properties.VariableNames{1} = 'No';
data.Properties.VariableNames{2} = 'AreaCode';
data.Properties.VariableNames{3} = 'Prefecture';
data.Properties.VariableNames{5} = 'Date';
data.Properties.VariableNames{6} = 'DateIdx';
data.Properties.VariableNames{8} = 'Area';
data.Properties.VariableNames{9} = 'Age';
data.Properties.VariableNames{10} = 'Gender';
data.Properties.VariableNames{16} = 'IsDischarged';

for i = 1:size(data,1)
    data.Date{i} = datenum(data.Date{i});
end

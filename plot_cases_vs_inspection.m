if exist('data','var') == 0 || exist('data_inspection','var') == 0
    Covid19_opendataparser
end
event_dates = cell2mat(data.Date);
date_start = min(unique(event_dates));
date_end = max(unique(event_dates));
date = date_start:date_end+1;
cases=histcounts(event_dates,date);

dates_inspection_idx = cell2mat(data_inspection.Date);
cases_inspection=NaN*cases;
idx=1;
for i = date
    idx_in_table = find(dates_inspection_idx == i);
    if ~isnan(idx_in_table)
        cases_inspection(idx) = data_inspection.InspectionCount(idx_in_table);
    end
    idx = idx+1;
end


figure(3);hold on;
tmp_m = colormap('jet');
for i = 1:length(cases)
    idx = round((size(tmp_m,1)-1)*(double(i)/length(cases)))+1;
    plot(cases_inspection(i),cases(i),'.','MarkerFaceColor',tmp_m(idx,:),'MarkerEdgeColor',tmp_m(idx,:),'MarkerSize',10);
end

axis equal
xlim([0 1200])
ylim([0 1200])
line([0 1200],[0 1200], 'Color','k')

c = colorbar;
c.Label.FontSize = 20;
c.Label.String = 'Normalized date';
xlabel('# of inspections in a day')
ylabel('# of new CVcases in a day')
ax = gca;
ax.FontSize = 12;
title('#Inspection vs #CVcases','Fontsize',20);

dates = cell2mat(data.Date);
date_start = min(unique(dates));
date_end = max(unique(dates));
f=figure(1);
histogram(dates,date_start:date_end)
ax=gca;
ax.XTickLabel = datestr(ax.XTick);
ax.XTickLabelRotation = 30;
title('Cases count');

// backtest_periods.mqh
struct BacktestPeriod {
   datetime start;
   datetime end;
   string label;
};

BacktestPeriod backtestPeriods[] = {
   {D'2020.02.15 00:00', D'2020.06.30 23:59', "COVID Crash & Recovery"},
   {D'2020.07.01 00:00', D'2021.03.31 23:59', "Post-COVID Stimulus Rally"},
   {D'2021.04.01 00:00', D'2021.12.31 23:59', "Inflation Fears Begin"},
   {D'2022.01.01 00:00', D'2022.09.30 23:59', "Rate Hike Cycle Starts"},
   {D'2022.10.01 00:00', D'2023.06.30 23:59', "Bear Market & Repricing"},
   {D'2023.07.01 00:00', D'2024.03.31 23:59', "Sideways & Recovery"},
   {D'2024.04.01 00:00', D'2024.12.31 23:59', "AI Boom & Rotation"},
   {D'2025.01.01 00:00', D'2025.10.24 23:59', "2025 YTD"}
};

void SetBacktestPeriod(datetime &testStart, datetime &testEnd, int selector) {
   testStart = backtestPeriods[selector].start;
   testEnd   = backtestPeriods[selector].end;
}

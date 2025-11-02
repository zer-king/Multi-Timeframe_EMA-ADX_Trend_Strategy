#include "config.mqh"
#include "backtest_periods.mqh"
#include "trend_filter.mqh"
#include "trade_logic.mqh"

datetime testStart, testEnd;

int OnInit() {
   SetBacktestPeriod(testStart, testEnd, periodSelector);
   return INIT_SUCCEEDED;
}

void OnTick() {
   OnTickLogic(testStart, testEnd);
}

double OnTester() {
   return AccountInfoDouble(ACCOUNT_BALANCE);
}

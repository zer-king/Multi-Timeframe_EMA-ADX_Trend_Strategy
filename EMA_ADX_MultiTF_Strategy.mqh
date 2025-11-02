input int emaVeryFastPeriod = 20;
input int emaFastPeriod     = 25;
input int emaSlowPeriod     = 50;
input int adxPeriod         = 50;
input double adxThreshold   = 32.0;
input bool enableCrossoverFilter = false;  // Optional EMA crossover filter
input int crossoverLookback = 20;
input bool barsLookbackBool = true;
input int barsLookBack      = 500;
input double lotSize        = 0.01;
input double pRange         = 4;
input double lRange         = 2;

ENUM_TIMEFRAMES timeframes[] = { PERIOD_H1, PERIOD_M15, PERIOD_M30 };

input int periodSelector = 5;  // Select from 0 to 7

#include "config.mqh"
#include "backtest_periods.mqh"
#include "trend_filter.mqh"
#include "trade_logic.mqh"

// Added the config file as inputs to main file to allow for input parameters for backtesting

// declared as start and end to allow for no clash of global variables from other files the declare functions
datetime start, end;

int OnInit() {
   SetBacktestPeriod(start, end, periodSelector);
   return INIT_SUCCEEDED;
}

void OnTick() {
   OnTickLogic(start, end,enableCrossoverFilter);
}

double OnTester() {
   return AccountInfoDouble(ACCOUNT_BALANCE);
}

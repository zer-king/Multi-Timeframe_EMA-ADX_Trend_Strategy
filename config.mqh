// config.mqh
input int emaVeryFastPeriod = 20;
input int emaFastPeriod     = 25;
input int emaSlowPeriod     = 50;
input int adxPeriod         = 50;
input double adxThreshold   = 40.0;
input int crossoverLookback = 20;
input bool barsLookbackBool = true;
input int barsLookBack      = 1000;
input double lotSize        = 0.01;
input double pRange         = 6;
input double lRange         = 3;
input bool enableCrossoverFilter = false;  // Optional EMA crossover filter

ENUM_TIMEFRAMES timeframes[] = { PERIOD_H1, PERIOD_M15, PERIOD_M30 };

input int periodSelector = 7;  // Select from 0 to 7

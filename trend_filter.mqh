// trend_filter.mqh
bool IsTrending(string symbol, ENUM_TIMEFRAMES tf, bool &isBullish) {
   double adx[], emaVeryFast[], emaFast[], emaSlow[];
   int bars = barsLookbackBool ? barsLookBack : iBars(symbol, tf);

   int handleEMAVeryFast = iMA(symbol, tf, emaVeryFastPeriod, 0, MODE_EMA, PRICE_CLOSE);
   int handleEMAFast     = iMA(symbol, tf, emaFastPeriod, 0, MODE_EMA, PRICE_CLOSE);
   int handleEMASlow     = iMA(symbol, tf, emaSlowPeriod, 0, MODE_EMA, PRICE_CLOSE);
   int handleADX         = iADX(symbol, tf, adxPeriod);

   CopyBuffer(handleEMAVeryFast, 0, 0, bars, emaVeryFast);
   CopyBuffer(handleEMAFast,     0, 0, bars, emaFast);
   CopyBuffer(handleEMASlow,     0, 0, bars, emaSlow);
   CopyBuffer(handleADX,         0, 0, bars, adx);

   ArraySetAsSeries(adx, true);
   ArraySetAsSeries(emaVeryFast, true);
   ArraySetAsSeries(emaFast, true);
   ArraySetAsSeries(emaSlow, true);

   if (adx[0] < adxThreshold)
      return false;

   isBullish = emaFast[0] > emaSlow[0] && emaVeryFast[0] > emaFast[0];
   return true;
}
bool CrossoverDetected(const double &emaFast[], const double &emaSlow[], int lookback) {
   for (int i = 1; i <= lookback; i++) {
      double prevFast = emaFast[i];
      double prevSlow = emaSlow[i];
      if ((prevFast > prevSlow && emaFast[0] < emaSlow[0]) ||
          (prevFast < prevSlow && emaFast[0] > emaSlow[0]))
         return true;
   }
   return false;
}


// trade_logic.mqh
void ExecuteTrade(bool isBuy) {
   MqlTradeRequest request = {};
   MqlTradeResult result = {};

   request.action   = TRADE_ACTION_DEAL;
   request.symbol   = Symbol();
   request.volume   = lotSize;
   request.type     = isBuy ? ORDER_TYPE_BUY : ORDER_TYPE_SELL;
   request.price    = isBuy ? SymbolInfoDouble(Symbol(), SYMBOL_ASK) : SymbolInfoDouble(Symbol(), SYMBOL_BID);
   request.tp       = isBuy ? request.price + pRange : request.price - pRange;
   request.sl       = isBuy ? request.price - lRange : request.price + lRange;
   request.deviation= 5;
   request.type_filling = ORDER_FILLING_IOC;
   request.type_time    = ORDER_TIME_GTC;

   if (!OrderSend(request, result))
      PrintFormat("OrderSend error %d", GetLastError());

   PrintFormat("retcode=%u  deal=%I64u  order=%I64u", result.retcode, result.deal, result.order);
}

void OnTickLogic( datetime testStart, datetime testEnd,bool CrossoverFilter  ) {
   if (TimeCurrent() < testStart || TimeCurrent() > testEnd)
      return;

   bool bullishTrend = true;
   bool bearishTrend = true;

   for (int i = 0; i < ArraySize(timeframes); i++) {
      bool isBullish;
      if (!IsTrending(_Symbol, timeframes[i], isBullish,CrossoverFilter))
         return;

      bullishTrend &= isBullish;
      bearishTrend &= !isBullish;
   }

   if (PositionsTotal() == 0) {
      if (bullishTrend) {
         ExecuteTrade(true);
         Print("Bullish trend confirmed across all timeframes. Consider Buy.");
      } else if (bearishTrend) {
         ExecuteTrade(false);
         Print("Bearish trend confirmed across all timeframes. Consider Sell.");
      }
   }
}

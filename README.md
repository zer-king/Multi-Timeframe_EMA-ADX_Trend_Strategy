Multi-Timeframe EMA-ADX Trend Strategy (MQL5)
This MQL5 Expert Advisor identifies high-conviction trend setups using a combination of exponential moving averages (EMAs) and the Average Directional Index (ADX) across multiple timeframes. It executes trades only when trend conditions are confirmed across all selected timeframes, helping filter out noise and avoid false signals.
🔧 Strategy Overview
• 	Trend Filter:
• 	Uses three EMAs (20, 25, 50) to detect directional bias.
• 	ADX (50-period) must exceed a threshold (default: 40.0) to confirm trend strength.
• 	Optional crossover filter (disabled by default) can detect recent EMA reversals.
• 	Multi-Timeframe Confirmation:
• 	Applies trend logic across M15, M30, and H1.
• 	Trades only if all timeframes agree on bullish or bearish direction.
• 	Trade Execution:
• 	Market orders with fixed lot size (default: 0.01).
• 	Static take-profit and stop-loss levels (pRange, lRange).
• 	No overlapping trades — checks PostionsTotal() before entry.
• 	Backtest Period Selector:
• 	Includes 8 predefined market regimes (e.g., COVID Crash, AI Boom).
• 	Enables targeted performance analysis across macro environments.
⚙️ Configurable Inputs
// === Strategy Parameters ===
input int    emaVeryFastPeriod = 20;     // Shortest EMA
input int    emaFastPeriod     = 25;     // Medium EMA
input int    emaSlowPeriod     = 50;     // Longest EMA
input int    adxPeriod         = 50;     // ADX smoothing period
input double adxThreshold     = 40.0;    // Minimum ADX to confirm trend
input int    crossoverLookback = 20;     // EMA crossover lookback (optional)
input bool   barsLookbackBool  = true;   // Use fixed bar count or full history
input int    barsLookBack      = 1000;   // Number of bars to evaluate
input double lotSize           = 0.01;   // Trade volume
input double pRange            = 6;      // Take-profit distance
input double lRange            = 3;      // Stop-loss distance

// === Timeframe Selection ===
ENUM_TIMEFRAMES timeframes[] = { PERIOD_H1, PERIOD_M15, PERIOD_M30 };

// === Backtest Period Selector ===
input int periodSelector = 7;  // Select from 0 to 7 (see predefined periods)
🧪 Backtest Periods

BacktestPeriod backtestPeriods[] =
{
  {"COVID Crash & Recovery",         2020.02.15 → 2020.06.30},
  {"Post-COVID Stimulus Rally",     2020.07.01 → 2021.03.31},
  {"Inflation Fears Begin",         2021.04.01 → 2021.12.31},
  {"Rate Hike Cycle Starts",        2022.01.01 → 2022.09.30},
  {"Bear Market & Repricing",       2022.10.01 → 2023.06.30},
  {"Sideways & Recovery",           2023.07.01 → 2024.03.31},
  {"AI Boom & Rotation",            2024.04.01 → 2024.12.31},
  {"2025 YTD",                      2025.01.01 → 2025.10.24}
};

📁 File Structure
• 	OnInit() — Initializes backtest period
• 	IsTrending() — Evaluates EMA and ADX conditions per timeframe
• 	OnTick() — Executes trade logic if all timeframes confirm trend
• 	OnTester() — Returns final balance for backtest evaluation
🚀 Usage
1. 	Load the EA onto a chart in MetaTrader 5.
2. 	Configure input parameters as needed.
3. 	Run strategy tester with selected PeriodSelector.
4. 	Monitor trade execution and performance metrics.
🧠 Notes
• 	Strategy avoids trading during consolidation or weak trends.
• 	Designed for clarity, modularity, and extensibility.
• 	Ideal for directional setups in trending markets.

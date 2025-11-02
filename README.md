<b>Multi-Timeframe EMA-ADX Trend Strategy (MQL5)</b><br><br> This MQL5 Expert Advisor identifies high-conviction trend setups using a combination of exponential moving averages (EMAs) and the Average Directional Index (ADX) across multiple timeframes. It executes trades only when trend conditions are confirmed across all selected timeframes, helping filter out noise and avoid false signals.
<hr>
<b>Strategy Overview</b><br>
<ul><li><b>Trend Filter</b><br>• Uses three EMAs (20, 25, 50) to detect directional bias<br>• ADX (50-period) must exceed a threshold (default: 40.0) to confirm trend strength<br>• Optional crossover filter (disabled by default) can detect recent EMA reversals</li>
<li><b>Multi-Timeframe Confirmation</b><br>• Applies trend logic across M15, M30, and H1<br>• Trades only if all timeframes agree on bullish or bearish direction</li>
<li><b>Trade Execution</b><br>• Market orders with fixed lot size (default: 0.01)<br>• Static take-profit and stop-loss levels (<code>pRange</code>, <code>lRange</code>)<br>• No overlapping trades — checks <code>PositionsTotal()</code> before entry</li>
<li><b>Backtest Period Selector</b><br>• Includes 8 predefined market regimes (e.g., COVID Crash, AI Boom)<br>• Enables targeted performance analysis across macro environments</li></ul>
<hr>
<b>Configurable Inputs </b><br>
<pre><code>// === Strategy Parameters ===input int    emaVeryFastPeriod = 20;     // Shortest EMAinput int    emaFastPeriod     = 25;     // Medium EMAinput int    emaSlowPeriod     = 50;     // Longest EMAinput int    adxPeriod         = 50;     // ADX smoothing periodinput double adxThreshold     = 40.0;    // Minimum ADX to confirm trendinput int    crossoverLookback = 20;     // EMA crossover lookback (optional)input bool   barsLookbackBool  = true;   // Use fixed bar count or full historyinput int    barsLookBack      = 1000;   // Number of bars to evaluateinput double lotSize           = 0.01;   // Trade volumeinput double pRange            = 6;      // Take-profit distanceinput double lRange            = 3;      // Stop-loss distance// === Timeframe Selection ===ENUM_TIMEFRAMES timeframes[] = { PERIOD_H1, PERIOD_M15, PERIOD_M30 };// === Backtest Period Selector ===input int periodSelector = 7;  // Select from 0 to 7 (see predefined periods)</code></pre>
<hr>
<b>Backtest Periods</b><br>
<pre><code>BacktestPeriod backtestPeriods[] ={{"COVID Crash & Recovery",         D'2020.02.15 00:00' → D'2020.06.30 23:59'},{"Post-COVID Stimulus Rally",     D'2020.07.01 00:00' → D'2021.03.31 23:59'},{"Inflation Fears Begin",         D'2021.04.01 00:00' → D'2021.12.31 23:59'},{"Rate Hike Cycle Starts",        D'2022.01.01 00:00' → D'2022.09.30 23:59'},{"Bear Market & Repricing",       D'2022.10.01 00:00' → D'2023.06.30 23:59'},{"Sideways & Recovery",           D'2023.07.01 00:00' → D'2024.03.31 23:59'},{"AI Boom & Rotation",            D'2024.04.01 00:00' → D'2024.12.31 23:59'},{"2025 YTD",                      D'2025.01.01 00:00' → D'2025.10.24 23:59'}};</code></pre>
<hr>
<b>File Structure</b><br>
<ul><li><code>OnInit()</code> — Initializes backtest period</li><li><code>IsTrending()</code> — Evaluates EMA and ADX conditions per timeframe</li><li><code>OnTick()</code> — Executes trade logic if all timeframes confirm trend</li><li><code>OnTester()</code> — Returns final balance for backtest evaluation</li></ul>
<hr>
<b>Usage</b><br>
<ol><li>Load the EA onto a chart in MetaTrader 5</li><li>Configure input parameters as needed</li><li>Run strategy tester with selected <code>periodSelector</code></li><li>Monitor trade execution and performance metrics</li></ol>
<hr>
<b>Notes</b><br>
<ul><li>Strategy avoids trading during consolidation or weak trends</li><li>Designed for clarity, modularity, and extensibility</li><li>Ideal for directional setups in trending markets</li></ul>

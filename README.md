<b>Multi-Timeframe EMA-ADX Trend Strategy (MQL5)</b><br><br> This MQL5 Expert Advisor identifies high-conviction trend setups using a combination of exponential moving averages (EMAs) and the Average Directional Index (ADX) across multiple timeframes. It executes trades only when trend conditions are confirmed across all selected timeframes, helping filter out noise and avoid false signals.
<hr>
<b>Strategy Overview</b><br>
<ul><li><b>Trend Filter</b><br>• Uses three EMAs (20, 25, 50) to detect directional bias<br>• ADX (50-period) must exceed a threshold (default: 40.0) to confirm trend strength<br>• Optional crossover filter (disabled by default) can detect recent EMA reversals</li>
<li><b>Multi-Timeframe Confirmation</b><br>• Applies trend logic across M15, M30, and H1<br>• Trades only if all timeframes agree on bullish or bearish direction</li>
<li><b>Trade Execution</b><br>• Market orders with fixed lot size (default: 0.01)<br>• Static take-profit and stop-loss levels (<code>pRange</code>, <code>lRange</code>)<br>• No overlapping trades — checks <code>PositionsTotal()</code> before entry</li>
<li><b>Backtest Period Selector</b><br>• Includes 8 predefined market regimes (e.g., COVID Crash, AI Boom)<br>• Enables targeted performance analysis across macro environments</li></ul>
<hr>
<b>Configurable Inputs </b><br>
<h2>⚙️ Strategy Parameters</h2>

<p>This section outlines all configurable inputs used in the EMA-ADX Multi-Timeframe Trading Strategy.</p>

<h3>📈 Trend Detection</h3>
<ul>
  <li><b>Very Fast EMA Period:</b> <code>20</code> — shortest moving average</li>
  <li><b>Fast EMA Period:</b> <code>25</code> — medium-term moving average</li>
  <li><b>Slow EMA Period:</b> <code>50</code> — long-term moving average</li>
  <li><b>ADX Period:</b> <code>50</code> — smoothing period for trend strength</li>
  <li><b>ADX Threshold:</b> <code>40.0</code> — minimum value to confirm a strong trend</li>
  <li><b>Crossover Lookback:</b> <code>20</code> — optional filter to avoid recent EMA reversals</li>
</ul>

<h3>📊 Data Evaluation</h3>
<ul>
  <li><b>Use Fixed Bar Count:</b> <code>true</code> — toggle between fixed or full history</li>
  <li><b>Bars to Evaluate:</b> <code>1000</code> — number of bars used in trend analysis</li>
</ul>

<h3>💰 Trade Execution</h3>
<ul>
  <li><b>Lot Size:</b> <code>0.01</code> — volume per trade</li>
  <li><b>Take-Profit Range:</b> <code>6</code> — distance in points</li>
  <li><b>Stop-Loss Range:</b> <code>3</code> — distance in points</li>
</ul>

<h3>⏱️ Timeframe Confirmation</h3>
<ul>
  <li><b>Timeframes Used:</b> <code>H1</code>, <code>M15</code>, <code>M30</code> — all must agree for trade entry</li>
</ul>

<h3>📅 Backtest Period Selector</h3>
<ul>
  <li><b>Selector Index:</b> <code>7</code> — maps to a predefined market regime (e.g. "2025 YTD")</li>
</ul>
<hr>
<b>Backtest Periods</b><br>
<h2>📅 Backtest Periods</h2>

<p>The strategy includes eight predefined market regimes for targeted performance analysis. Each period reflects a distinct macro environment.</p>

<table>
  <thead>
    <tr>
      <th>Label</th>
      <th>Start Date</th>
      <th>End Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><b>COVID Crash & Recovery</b></td>
      <td><code>2020.02.15 00:00</code></td>
      <td><code>2020.06.30 23:59</code></td>
    </tr>
    <tr>
      <td><b>Post-COVID Stimulus Rally</b></td>
      <td><code>2020.07.01 00:00</code></td>
      <td><code>2021.03.31 23:59</code></td>
    </tr>
    <tr>
      <td><b>Inflation Fears Begin</b></td>
      <td><code>2021.04.01 00:00</code></td>
      <td><code>2021.12.31 23:59</code></td>
    </tr>
    <tr>
      <td><b>Rate Hike Cycle Starts</b></td>
      <td><code>2022.01.01 00:00</code></td>
      <td><code>2022.09.30 23:59</code></td>
    </tr>
    <tr>
      <td><b>Bear Market & Repricing</b></td>
      <td><code>2022.10.01 00:00</code></td>
      <td><code>2023.06.30 23:59</code></td>
    </tr>
    <tr>
      <td><b>Sideways & Recovery</b></td>
      <td><code>2023.07.01 00:00</code></td>
      <td><code>2024.03.31 23:59</code></td>
    </tr>
    <tr>
      <td><b>AI Boom & Rotation</b></td>
      <td><code>2024.04.01 00:00</code></td>
      <td><code>2024.12.31 23:59</code></td>
    </tr>
    <tr>
      <td><b>2025 YTD</b></td>
      <td><code>2025.01.01 00:00</code></td>
      <td><code>2025.10.24 23:59</code></td>
    </tr>
  </tbody>
</table>
<hr>
<b>File Structure</b><br>
<ul><li><code>OnInit()</code> — Initializes backtest period</li><li><code>IsTrending()</code> — Evaluates EMA and ADX conditions per timeframe</li><li><code>OnTick()</code> — Executes trade logic if all timeframes confirm trend</li><li><code>OnTester()</code> — Returns final balance for backtest evaluation</li></ul>
<hr>
<b>Usage</b><br>
<ol><li>Load the EA onto a chart in MetaTrader 5</li><li>Configure input parameters as needed</li><li>Run strategy tester with selected <code>periodSelector</code></li><li>Monitor trade execution and performance metrics</li></ol>
<hr>
<b>Notes</b><br>
<ul><li>Strategy avoids trading during consolidation or weak trends</li><li>Designed for clarity, modularity, and extensibility</li><li>Ideal for directional setups in trending markets</li></ul>

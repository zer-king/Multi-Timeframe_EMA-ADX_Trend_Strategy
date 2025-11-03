
<h1>📊 Strategy Optimization Report: EMA-ADX Multi-Timeframe Trend Strategy</h1>

<p>This repository documents the development, testing, and optimization of a multi-timeframe EMA-ADX trend-following strategy applied to <strong>XAUUSD</strong>. It includes modular strategy logic, configurable inputs, and a detailed performance report across multiple market regimes.</p>

<hr>

<h2>🧠 Strategy Overview</h2>

<p>The strategy combines:</p>
<ul>
  <li><strong>Three EMA filters</strong>: EMA(20), EMA(25), EMA(50)</li>
  <li><strong>ADX trend strength filter</strong>: ADX must be above 32</li>
  <li><strong>Trade condition:</strong> Trade is executed only when <code>EMA(20)</code> is above both <code>EMA(25)</code> and <code>EMA(50)</code>, <em>and</em> no recent crossover has occurred</li>
  <li><strong>Multi-timeframe confirmation</strong>: Entry on M15, trend filter on M30 & H1</li>
  <li>Optional <strong>crossover filter</strong> and <strong>bar lookback logic</strong> for additional control</li>
</ul>

<p>This final modification improved signal clarity by ensuring trades are only taken in strong, sustained trends—reducing noise and avoiding false entries during volatile or indecisive conditions.</p>

<hr>

<h2>📁 File Structure</h2>

<table>
  <thead>
    <tr>
      <th>File</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr><td><code>EMA_ADX_MultiTF_Strategy.mqh</code></td><td>Main strategy logic with modular function calls</td></tr>
    <tr><td><code>config.mqh</code></td><td>Input parameters for EMA, ADX, lot size, filters</td></tr>
    <tr><td><code>trade_logic.mqh</code></td><td>Trade execution logic and direction handling</td></tr>
    <tr><td><code>trend_filter.mqh</code></td><td>ADX and EMA-based trend validation</td></tr>
    <tr><td><code>backtest_periods.mqh</code></td><td>Predefined market regimes for structured testing</td></tr>
    <tr><td><code>Strategy Optimization Report.pdf</code></td><td>Full report comparing original vs optimized parameters</td></tr>
    <tr><td><code>README.md</code></td><td>Project overview and usage guide</td></tr>
  </tbody>
</table>

<hr>

<h2>📈 Optimization Summary</h2>

<ul>
  <li><strong>Original Parameters</strong>:  EMA(20/25/50), ADX(40), M15/M30/H1 timeframes timeframes</li>
  <li><strong>Issues</strong>: Low trade count, high drawdown (~70%), poor fit for 1:500 leverage</li>
  <li><strong>Final Parameters</strong>: EMA(20/25/50), ADX(32), M15/M30/H1 timeframes</li>
  <li><strong>Trade Logic</strong>: EMA(20) must be above both EMA(25) and EMA(50), with no recent crossover and ADX > 32</li>
  <li><strong>Results</strong>: Increased trade frequency, improved profit factor, reduced drawdown</li>
</ul>

<p>See the <a href="./Strategy%20Optimization%20Report.pdf"><code>Strategy Optimization Report.pdf</code></a> for full metrics and rationale.</p>

<hr>

<h2>🛠️ How to Use</h2>

<ol>
  <li>Place <code>.mqh</code> files in your <code>MQL5/Experts/PortfolioProjects/</code> folder</li>
  <li>Include <code>EMA_ADX_MultiTF_Strategy.mqh</code> in your <code>.mq5</code> expert file</li>
  <li>Adjust parameters in <code>EMA_ADX_MultiTF_Strategy.mqh</code> as needed since that works for backtesting but <code>config.mqh</code>is there for standard practice</li>
  <li>Use <code>SetBacktestPeriod()</code> from <code>backtest_periods.mqh</code> to target specific market regimes</li>
  <li>Compile and run backtests in MetaTrader 5</li>
</ol>

<hr>

<h2>📌 Notes</h2>

<ul>
  <li>Strategy is modular and designed for easy toggling of filters and overlays</li>
  <li>All inputs are exposed for backtesting and optimization</li>
  <li>Code is structured for clarity, maintainability, and professional presentation</li>
</ul>

<hr>

<h2>📬 Contact</h2>

<p>For questions, collaboration, or feedback, feel free to reach out via GitHub.</p>

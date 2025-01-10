unit HTML_Chart_CSS;

interface

uses
  System.SysUtils;

type
  THTMLChartCSS = class
  public
    class function GetChartCSS: string;
    class function GetChartContainerCSS: string;
    class function GetChartAnimationCSS: string;
    class function GetChartResponsiveCSS: string;
  end;

implementation

class function THTMLChartCSS.GetChartCSS: string;
begin
  Result :=
    ':root {' + sLineBreak +
    '    --primary-color: #4e73df;' + sLineBreak +
    '    --success-color: #1cc88a;' + sLineBreak +
    '    --warning-color: #f6c23e;' + sLineBreak +
    '    --danger-color: #e74a3b;' + sLineBreak +
    '}' + sLineBreak +
    '.chart-card {' + sLineBreak +
    '    background: white;' + sLineBreak +
    '    padding: 1.5rem;' + sLineBreak +
    '    border-radius: 0.5rem;' + sLineBreak +
    '    box-shadow: 0 0.15rem 1.75rem rgba(58, 59, 69, 0.15);' + sLineBreak +
    '    height: 100%;' + sLineBreak +
    '    transition: transform 0.2s ease;' + sLineBreak +
    '}' + sLineBreak +
    '.charts-section {' + sLineBreak +
    '    display: grid;' + sLineBreak +
    '    grid-template-columns: repeat(2, 1fr);' + sLineBreak +
    '    gap: 1.5rem;' + sLineBreak +
    '    margin-bottom: 1.5rem;' + sLineBreak +
    '}' + sLineBreak +
    '.kpis {' + sLineBreak +
    '    display: grid;' + sLineBreak +
    '    grid-template-columns: repeat(3, 1fr);' + sLineBreak +
    '    gap: 1.5rem;' + sLineBreak +
    '    margin-bottom: 1.5rem;' + sLineBreak +
    '}' + sLineBreak +
    '.kpi-card {' + sLineBreak +
    '    background: white;' + sLineBreak +
    '    padding: 1.5rem;' + sLineBreak +
    '    border-radius: 0.5rem;' + sLineBreak +
    '    box-shadow: 0 0.15rem 1.75rem rgba(58, 59, 69, 0.15);' + sLineBreak +
    '    text-align: center;' + sLineBreak +
    '}';
end;

class function THTMLChartCSS.GetChartContainerCSS: string;
begin
  Result :=
    '.chart-container-father {' + sLineBreak +
    '    position: relative;' + sLineBreak +
    '    height: 300px;' + sLineBreak +
    '    width: 100%;' + sLineBreak +
    '    overflow: auto;' + sLineBreak +
    '}' + sLineBreak +
    '.chart-container {' + sLineBreak +
    '    position: relative;' + sLineBreak +
    '    width: 100%;' + sLineBreak +
    '    height: 100%;' + sLineBreak +
    '    min-height: 300px;' + sLineBreak +
    '}';
end;

class function THTMLChartCSS.GetChartAnimationCSS: string;
begin
  Result :=
    '@keyframes chartFadeIn {' + sLineBreak +
    '    from { opacity: 0; transform: translateY(20px); }' + sLineBreak +
    '    to { opacity: 1; transform: translateY(0); }' + sLineBreak +
    '}' + sLineBreak +
    '.chart-container canvas {' + sLineBreak +
    '    animation: chartFadeIn 0.5s ease-out;' + sLineBreak +
    '}';
end;

class function THTMLChartCSS.GetChartResponsiveCSS: string;
begin
  Result :=
    '@media (max-width: 768px) {' + sLineBreak +
    '    .charts-section { grid-template-columns: 1fr; }' + sLineBreak +
    '    .chart-container-father { height: 250px; }' + sLineBreak +
    '    .kpis { grid-template-columns: 1fr; }' + sLineBreak +
    '}';
end;

end.


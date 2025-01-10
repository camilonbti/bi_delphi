unit HTML_Chart_CSS;

interface

uses
  System.SysUtils;

type
  THTMLChartCSS = class
  private

  public
    class function GetChartCSS: string;
    class function GetChartsSectionCSS: string; static;
    class function GetChartContainerCSS: string;
    class function GetChartAnimationCSS: string;
    class function GetChartResponsiveCSS: string;
    class function GetChartTooltipCSS: string;
    class function GetChartScrollbarCSS: string;
  end;

implementation

class function THTMLChartCSS.GetChartCSS: string;
begin
  Result :=
    '.chart-card {' + sLineBreak +
    '  background: white;' + sLineBreak +
    '  padding: 1.5rem;' + sLineBreak +
    '  border-radius: 0.5rem;' + sLineBreak +
    '  box-shadow: 0 0.15rem 1.75rem rgba(58, 59, 69, 0.15);' + sLineBreak +
    '  height: 100%;' + sLineBreak +
    '  transition: transform 0.2s ease;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.chart-card:hover {' + sLineBreak +
    '  transform: translateY(-3px);' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.chart-card h5 {' + sLineBreak +
    '  color: var(--primary-color);' + sLineBreak +
    '  font-size: 1rem;' + sLineBreak +
    '  font-weight: 700;' + sLineBreak +
    '  margin-bottom: 1rem;' + sLineBreak +
    '  white-space: nowrap;' + sLineBreak +
    '  overflow: hidden;' + sLineBreak +
    '  text-overflow: ellipsis;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '@media (max-width: 768px) {' + sLineBreak +
    '  .chart-card {' + sLineBreak +
    '    padding: 1rem;' + sLineBreak +
    '    margin-bottom: 1rem;' + sLineBreak +
    '  }' + sLineBreak +
    '  .chart-card h5 {' + sLineBreak +
    '    font-size: 0.9rem;' + sLineBreak +
    '    margin-bottom: 0.75rem;' + sLineBreak +
    '  }' + sLineBreak +
    '}';
end;
class function THTMLChartCSS.GetChartContainerCSS: string;
begin
  Result :=
    '.chart-container-father {' + sLineBreak +
    '  position: relative;' + sLineBreak +
    '  height: 300px;' + sLineBreak +
    '  width: 100%;' + sLineBreak +
    '  overflow: auto;' + sLineBreak +
    '  scrollbar-width: thin;' + sLineBreak +
    '  scrollbar-color: rgba(0, 0, 0, 0.2) transparent;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.chart-container {' + sLineBreak +
    '  position: relative;' + sLineBreak +
    '  width: 100%;' + sLineBreak +
    '  height: auto;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.chart-container:hover canvas {' + sLineBreak +
    '  filter: brightness(0.98);' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '@media (max-width: 768px) {' + sLineBreak +
    '  .chart-container-father {' + sLineBreak +
    '    height: 250px;' + sLineBreak +
    '  }' + sLineBreak +
    '}';
end;

class function THTMLChartCSS.GetChartAnimationCSS: string;
begin
  Result :=
    '@keyframes chartFadeIn {' + sLineBreak +
    '  from {' + sLineBreak +
    '    opacity: 0;' + sLineBreak +
    '    transform: translateY(20px);' + sLineBreak +
    '  }' + sLineBreak +
    '  to {' + sLineBreak +
    '    opacity: 1;' + sLineBreak +
    '    transform: translateY(0);' + sLineBreak +
    '  }' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.chart-container canvas {' + sLineBreak +
    '  animation: chartFadeIn 0.5s ease-out;' + sLineBreak +
    '}';
end;

class function THTMLChartCSS.GetChartScrollbarCSS: string;
begin
  Result :=
    '.chart-container-father {' + sLineBreak +
    '  scrollbar-width: thin;' + sLineBreak +
    '  scrollbar-color: rgba(0, 0, 0, 0.2) transparent;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.chart-container-father::-webkit-scrollbar {' + sLineBreak +
    '  width: 6px;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.chart-container-father::-webkit-scrollbar-track {' + sLineBreak +
    '  background: transparent;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.chart-container-father::-webkit-scrollbar-thumb {' + sLineBreak +
    '  background-color: rgba(0, 0, 0, 0.2);' + sLineBreak +
    '  border-radius: 3px;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.chart-container-father:hover::-webkit-scrollbar-thumb {' + sLineBreak +
    '  background-color: rgba(0, 0, 0, 0.3);' + sLineBreak +
    '}';
end;

class function THTMLChartCSS.GetChartTooltipCSS: string;
begin
  Result :=
    '.chartjs-tooltip {' + sLineBreak +
    '  background: rgba(0, 0, 0, 0.8);' + sLineBreak +
    '  color: white;' + sLineBreak +
    '  border-radius: 3px;' + sLineBreak +
    '  padding: 6px;' + sLineBreak +
    '  font-size: 12px;' + sLineBreak +
    '  pointer-events: none;' + sLineBreak +
    '  box-shadow: 0 2px 4px rgba(0,0,0,0.1);' + sLineBreak +
    '}';
end;

class function THTMLChartCSS.GetChartResponsiveCSS: string;
begin
  Result :=
    '@media (max-width: 768px) {' + sLineBreak +
    '  .chart-card {' + sLineBreak +
    '    margin-bottom: 1rem;' + sLineBreak +
    '  }' + sLineBreak +
    '  .chart-container-father {' + sLineBreak +
    '    height: 250px;' + sLineBreak + // Altura menor em dispositivos móveis
    '  }' + sLineBreak +
    '}';
end;

class function THTMLChartCSS.GetChartsSectionCSS: string;
begin
  Result :=
    '.charts-section {' + sLineBreak +
    '  display: grid;' + sLineBreak +
    '  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));' + sLineBreak +
    '  gap: 20px;' + sLineBreak +
    '  margin-bottom: 30px;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '@media (max-width: 768px) {' + sLineBreak +
    '  .charts-section {' + sLineBreak +
    '    gap: 15px;' + sLineBreak +
    '    margin-bottom: 20px;' + sLineBreak +
    '  }' + sLineBreak +
    '}';
end;


end.

unit CreateChart;

interface

uses
  System.SysUtils, System.Classes, System.StrUtils;

type
  TChartType = (ctBar, ctPie, ctLine);
  TChartOrientation = (coVertical, coHorizontal);

  TChartParams = record
    Title: string;
    GroupField: string;
    ValueField: string;
    ChartType: TChartType;
    Orientation: TChartOrientation;
    ContainerID: string;
  end;

  TCreateChart = class
  private
    class function GetChartTypeStr(AType: TChartType): string;
    class function GetChartOptions(const Params: TChartParams): string;
    class function GetChartContainer(const Params: TChartParams): string;
    class function GetChartScriptInternal(const Params: TChartParams): string;
    class function GetDataProcessingFunction: string;
  public
    class function Generate(const Params: TChartParams): string;
  end;

implementation

{ TCreateChart }

class function TCreateChart.GetChartTypeStr(AType: TChartType): string;
begin
  case AType of
    ctBar: Result := 'bar';
    ctPie: Result := 'pie';
    ctLine: Result := 'line';
  else
    Result := 'bar';
  end;
end;

class function TCreateChart.GetChartOptions(const Params: TChartParams): string;
begin
  Result :=
    '    options: {' + sLineBreak +
    '      responsive: true,' + sLineBreak +
    '      maintainAspectRatio: false,' + sLineBreak +
    '      indexAxis: ' + IfThen(Params.Orientation = coHorizontal, '"y"', '"x"') + ',' + sLineBreak +
    '      plugins: {' + sLineBreak +
    '        legend: { display: false },' + sLineBreak +
    '        tooltip: {' + sLineBreak +
    '          callbacks: {' + sLineBreak +
    '            label: function(context) {' + sLineBreak +
    '              return formatMoney(context.raw);' + sLineBreak +
    '            }' + sLineBreak +
    '          }' + sLineBreak +
    '        }' + sLineBreak +
    '      },' + sLineBreak +
    '      scales: {' + sLineBreak +
    '        x: {' + sLineBreak +
    '          ticks: {' + sLineBreak +
    '            callback: function(value) {' + sLineBreak +
    '              return formatMoney(value);' + sLineBreak +
    '            }' + sLineBreak +
    '          }' + sLineBreak +
    '        }' + sLineBreak +
    '      }' + sLineBreak +
    '    }';
end;

class function TCreateChart.GetChartContainer(const Params: TChartParams): string;
begin
  Result :=
    '<div class="chart-card">' + sLineBreak +
    Format('  <h5>%s</h5>', [Params.Title]) + sLineBreak +
    '  <div class="chart-container-father">' + sLineBreak +
    Format('    <div class="chart-container"><canvas id="%s"></canvas></div>', [Params.ContainerID]) + sLineBreak +
    '  </div>' + sLineBreak +
    '</div>';
end;

class function TCreateChart.GetChartScriptInternal(const Params: TChartParams): string;
begin
  Result :=
    'document.addEventListener("DOMContentLoaded", function() {' + sLineBreak +
    Format('  const ctx = document.getElementById("%s").getContext("2d");', [Params.ContainerID]) + sLineBreak +
    Format('  const data = processarDados(mockData, "%s", "%s");', [Params.GroupField, Params.ValueField]) + sLineBreak +
    '  new Chart(ctx, {' + sLineBreak +
    Format('    type: "%s",', [GetChartTypeStr(Params.ChartType)]) + sLineBreak +
    '    data: {' + sLineBreak +
    '      labels: data.labels,' + sLineBreak +
    '      datasets: [{' + sLineBreak +
    Format('        label: "%s",', [Params.Title]) + sLineBreak +
    '        data: data.values,' + sLineBreak +
    '        backgroundColor: "rgba(78, 115, 223, 0.6)",' + sLineBreak +
    '        borderRadius: 4,' + sLineBreak +
    '        maxBarThickness: 50' + sLineBreak +
    '      }]' + sLineBreak +
    '    },' + sLineBreak +
    GetChartOptions(Params) + sLineBreak +
    '  });' + sLineBreak +
    '});';
end;

class function TCreateChart.GetDataProcessingFunction: string;
begin
  Result :=
    'function formatMoney(value) {' + sLineBreak +
    '  return new Intl.NumberFormat("pt-BR", {' + sLineBreak +
    '    style: "currency",' + sLineBreak +
    '    currency: "BRL"' + sLineBreak +
    '  }).format(value);' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    'function processarDados(data, groupField, valueField) {' + sLineBreak +
    '  const result = { labels: [], values: [] };' + sLineBreak +
    '  const groupedData = {};' + sLineBreak +
    '' + sLineBreak +
    '  data.forEach(item => {' + sLineBreak +
    '    if (!groupedData[item[groupField]]) {' + sLineBreak +
    '      groupedData[item[groupField]] = 0;' + sLineBreak +
    '      result.labels.push(item[groupField]);' + sLineBreak +
    '    }' + sLineBreak +
    '    groupedData[item[groupField]] += item[valueField];' + sLineBreak +
    '  });' + sLineBreak +
    '' + sLineBreak +
    '  result.labels.forEach(label => {' + sLineBreak +
    '    result.values.push(groupedData[label]);' + sLineBreak +
    '  });' + sLineBreak +
    '' + sLineBreak +
    '  return result;' + sLineBreak +
    '}';
end;

class function TCreateChart.Generate(const Params: TChartParams): string;
begin
  Result :=
    GetDataProcessingFunction + sLineBreak +
    GetChartContainer(Params) + sLineBreak +
    '<script>' + sLineBreak +
    GetChartScriptInternal(Params) + sLineBreak +
    '</script>';
end;


end.


unit HTML_Chart_Scripts;

interface

uses
  System.SysUtils;

type
  THTMLChartScripts = class
  public
    class function GetFormatMoneyFunction: string;
    class function GetDataProcessingFunction: string;
    class function GetChartInitFunction: string;
    class function GetChartUpdateFunction: string;
  end;

implementation

class function THTMLChartScripts.GetFormatMoneyFunction: string;
begin
  Result :=
    'function formatMoney(value) {' + sLineBreak +
    '  return new Intl.NumberFormat("pt-BR", {' + sLineBreak +
    '    style: "currency",' + sLineBreak +
    '    currency: "BRL"' + sLineBreak +
    '  }).format(value);' + sLineBreak +
    '}';
end;

class function THTMLChartScripts.GetDataProcessingFunction: string;
begin
  Result :=
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

class function THTMLChartScripts.GetChartInitFunction: string;
begin
  Result :=
    'function initChart(containerId, data, options) {' + sLineBreak +
    '  const ctx = document.getElementById(containerId).getContext("2d");' + sLineBreak +
    '  return new Chart(ctx, {' + sLineBreak +
    '    type: options.type || "bar",' + sLineBreak +
    '    data: {' + sLineBreak +
    '      labels: data.labels,' + sLineBreak +
    '      datasets: [{' + sLineBreak +
    '        data: data.values,' + sLineBreak +
    '        backgroundColor: "rgba(78, 115, 223, 0.6)",' + sLineBreak +
    '        borderRadius: 4,' + sLineBreak +
    '        maxBarThickness: 50' + sLineBreak +
    '      }]' + sLineBreak +
    '    },' + sLineBreak +
    '    options: {' + sLineBreak +
    '      responsive: true,' + sLineBreak +
    '      maintainAspectRatio: false,' + sLineBreak +
    '      indexAxis: options.horizontal ? "y" : "x",' + sLineBreak +
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
    '          grid: { display: false },' + sLineBreak +
    '          ticks: {' + sLineBreak +
    '            callback: function(value) {' + sLineBreak +
    '              return formatMoney(value);' + sLineBreak +
    '            }' + sLineBreak +
    '          }' + sLineBreak +
    '        },' + sLineBreak +
    '        y: {' + sLineBreak +
    '          grid: { display: false }' + sLineBreak +
    '        }' + sLineBreak +
    '      },' + sLineBreak +
    '      animation: {' + sLineBreak +
    '        duration: 1000,' + sLineBreak +
    '        easing: "easeOutQuart"' + sLineBreak +
    '      }' + sLineBreak +
    '    }' + sLineBreak +
    '  });' + sLineBreak +
    '}';
end;

class function THTMLChartScripts.GetChartUpdateFunction: string;
begin
  Result :=
    'function updateChart(chart, newData) {' + sLineBreak +
    '  chart.data.labels = newData.labels;' + sLineBreak +
    '  chart.data.datasets[0].data = newData.values;' + sLineBreak +
    '  chart.update();' + sLineBreak +
    '}';
end;

end.

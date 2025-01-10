unit HTML_Chart_Scripts;

interface

uses
  System.SysUtils, System.StrUtils;

type
  THTMLChartScripts = class
  private
    function GetHelperFunctions: string;
  public
    class function GetFormatMoneyFunction: string;
    class function GetUpdateKPIsFunction: string;
    class function GetRenderChartsFunction(
              const ACampoAgrupamento: string;  // Campo para agrupar (REGIAO, LOJA, etc)
              const ACampoValor: string;        // Campo para somar (SUBTOTAL)
              const ATitulo: string;            // Título do gráfico
              const AContainerID: string;       // ID do elemento canvas
              const ATipoGrafico: string;       // Tipo (bar, pie, line)
              const AOrientacao: string         // Orientação (vertical/horizontal)
              ): string;

    class function GetInitFunction: string;
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

class function THTMLChartScripts.GetUpdateKPIsFunction: string;
begin
  Result :=
    'function updateKPIs() {' + sLineBreak +
    '  const totalVendas = mockData.reduce((sum, item) => sum + item.SUBTOTAL, 0);' + sLineBreak +
    '  const totalPedidos = mockData.length;' + sLineBreak +
    '  const ticketMedio = totalVendas / totalPedidos;' + sLineBreak +
    '' + sLineBreak +
    '  document.getElementById("totalSales").textContent = formatMoney(totalVendas);' + sLineBreak +
    '  document.getElementById("totalOrders").textContent = totalPedidos;' + sLineBreak +
    '  document.getElementById("averageTicket").textContent = formatMoney(ticketMedio);' + sLineBreak +
    '}';
end;

class function THTMLChartScripts.GetRenderChartsFunction(
  const ACampoAgrupamento: string;  // Campo para agrupar (REGIAO, LOJA, etc)
  const ACampoValor: string;        // Campo para somar (SUBTOTAL)
  const ATitulo: string;            // Título do gráfico
  const AContainerID: string;       // ID do elemento canvas
  const ATipoGrafico: string;       // Tipo (bar, pie, line)
  const AOrientacao: string         // Orientação (vertical/horizontal)
): string;
begin
  Result :=
    'function renderCharts() {' + sLineBreak +
    '  const ctx = document.getElementById("' + AContainerID + '").getContext("2d");' + sLineBreak +
    '  const data = processarDados(mockData, "' + ACampoAgrupamento + '", "' + ACampoValor + '");' + sLineBreak +
    '' + sLineBreak +
    '  new Chart(ctx, {' + sLineBreak +
    '    type: "' + ATipoGrafico + '",' + sLineBreak +
    '    data: {' + sLineBreak +
    '      labels: data.labels,' + sLineBreak +
    '      datasets: [{' + sLineBreak +
    '        label: "' + ATitulo + '",' + sLineBreak +
    '        data: data.values,' + sLineBreak +
    '        backgroundColor: "rgba(78, 115, 223, 0.6)",' + sLineBreak +
    '        borderRadius: 4,' + sLineBreak +
    '        maxBarThickness: 50' + sLineBreak +
    '      }]' + sLineBreak +
    '    },' + sLineBreak +
    '    options: {' + sLineBreak +
    '      responsive: true,' + sLineBreak +
    '      maintainAspectRatio: false,' + sLineBreak +
    '      indexAxis: "' + IfThen(AOrientacao = 'horizontal', 'y', 'x') + '",' + sLineBreak +
    '      plugins: {' + sLineBreak +
    '        legend: { display: false },' + sLineBreak +
    '        title: {' + sLineBreak +
    '          display: true,' + sLineBreak +
    '          text: "' + ATitulo + '"' + sLineBreak +
    '        },' + sLineBreak +
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
    '    }' + sLineBreak +
    '  });' + sLineBreak +
    '}';
end;




class function THTMLChartScripts.GetInitFunction: string;
begin
  Result :=
    'document.addEventListener("DOMContentLoaded", function() {' + sLineBreak +
    '  updateKPIs();' + sLineBreak +
    '  populateTable();' + sLineBreak +
    '  renderRegionChart();' + sLineBreak +
    '  renderStoreChart();' + sLineBreak +
    '});';
end;

function THTMLChartScripts.GetHelperFunctions: string;
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
    '  ' + sLineBreak +
    '  data.forEach(item => {' + sLineBreak +
    '    if (!groupedData[item[groupField]]) {' + sLineBreak +
    '      groupedData[item[groupField]] = 0;' + sLineBreak +
    '    }' + sLineBreak +
    '    groupedData[item[groupField]] += item[valueField];' + sLineBreak +
    '  });' + sLineBreak +
    '  ' + sLineBreak +
    '  for (const key in groupedData) {' + sLineBreak +
    '    result.labels.push(key);' + sLineBreak +
    '    result.values.push(groupedData[key]);' + sLineBreak +
    '  }' + sLineBreak +
    '  ' + sLineBreak +
    '  return result;' + sLineBreak +
    '}';
end;

end.


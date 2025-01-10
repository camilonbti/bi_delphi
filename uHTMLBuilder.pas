unit uHTMLBuilder;

interface

uses
  System.SysUtils, System.Classes, HTMLDataset;

type
  THTMLBuilder = class
  private
    function GetCSS: string;
    function GetMeta: string;
    function GetMockData: string;
    function GetTableScript: string;
    class function GetTableStructure: string;
    function GetScripts: string;
    function GetCharts: string;
    function GetChartJS: string;
    class function GetChartsStructure: string;
    function GetKPIStructure: string;
    function GetExportButton: string;
    function GetPaginationStructure: string;
    function GetFiltersStructure: string;
    function ConfigurarGraficos: TArray<TChartConfig>;
  public
    function GerarHTML: string;
  end;

implementation

uses CreateChart, HTML_Chart_CSS, HTML_Table_CSS,
  HTML_Chart_Scripts;

function THTMLBuilder.GetMeta: string;
begin
  Result :=
    '<meta charset="UTF-8">' + sLineBreak +
    '<meta name="viewport" content="width=device-width, initial-scale=1.0">';
end;

function THTMLBuilder.GetChartJS: string;
begin
  Result := '<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>';
end;

function THTMLBuilder.GetCSS: string;
begin
  Result :=
    '<style>' + sLineBreak +
    // Estilos base
    'body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f0f0f0; color: #333; }' + sLineBreak +
    'main { max-width: 1200px; margin: 0 auto; background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }' + sLineBreak +
    'h1 { color: #333; text-align: center; }' + sLineBreak +

    // Estilos dos gráficos
    THTMLChartCSS.GetChartCSS + sLineBreak +
    THTMLChartCSS.GetChartContainerCSS + sLineBreak +
    THTMLChartCSS.GetChartAnimationCSS + sLineBreak +
    THTMLChartCSS.GetChartResponsiveCSS + sLineBreak +

    // Estilos da tabela
    THTMLTableCSS.GetTableCSS + sLineBreak +
    THTMLTableCSS.GetTableHeaderCSS + sLineBreak +
    THTMLTableCSS.GetTableContentCSS + sLineBreak +
    THTMLTableCSS.GetTableStatusCSS + sLineBreak +
    THTMLTableCSS.GetTableResponsiveCSS + sLineBreak +

    '</style>';
end;


function THTMLBuilder.GetMockData: string;
begin
  Result := THTMLDataset.GetMockData;
end;

class function THTMLBuilder.GetTableStructure: string;
begin
  Result :=
    '<section class="table-section">' + sLineBreak +
    '  <div class="table-header">' + sLineBreak +
    '    <h5>Lista de Vendas</h5>' + sLineBreak +
    '    <button id="exportBtn" class="export-btn">Exportar CSV</button>' + sLineBreak +
    '  </div>' + sLineBreak +
    '  <div class="table-responsive">' + sLineBreak +
    '    <table class="table">' + sLineBreak +
    '      <thead>' + sLineBreak +
    '        <tr>' + sLineBreak +
    '          <th>Data</th>' + sLineBreak +
    '          <th>Produto</th>' + sLineBreak +
    '          <th>Loja</th>' + sLineBreak +
    '          <th>Vendedor</th>' + sLineBreak +
    '          <th>Valor</th>' + sLineBreak +
    '        </tr>' + sLineBreak +
    '      </thead>' + sLineBreak +
    '      <tbody id="tableBody"></tbody>' + sLineBreak +
    '    </table>' + sLineBreak +
    '  </div>' + sLineBreak +
    '  <nav id="pagination"></nav>' + sLineBreak +
    '</section>';
end;


function THTMLBuilder.GetTableScript: string;
begin
  Result :=
    'function formatMoney(value) {' + sLineBreak +
    '  return new Intl.NumberFormat("pt-BR", {' + sLineBreak +
    '    style: "currency",' + sLineBreak +
    '    currency: "BRL"' + sLineBreak +
    '  }).format(value);' + sLineBreak +
    '}' + sLineBreak;
end;

function THTMLBuilder.GetScripts: string;
begin
  Result :=
    'function renderCharts() {' + sLineBreak +
    '  // Gráfico por Região' + sLineBreak +
    '  const dadosRegiao = processarDados(mockData, "REGIAO", "SUBTOTAL");' + sLineBreak +
    '  new Chart(document.getElementById("salesByRegionChart"), {' + sLineBreak +
    '    type: "bar",' + sLineBreak +
    '    data: {' + sLineBreak +
    '      labels: dadosRegiao.labels,' + sLineBreak +
    '      datasets: [{' + sLineBreak +
    '        data: dadosRegiao.values,' + sLineBreak +
    '        backgroundColor: "rgba(78, 115, 223, 0.6)"' + sLineBreak +
    '      }]' + sLineBreak +
    '    },' + sLineBreak +
    '    options: {' + sLineBreak +
    '      responsive: true,' + sLineBreak +
    '      plugins: {' + sLineBreak +
    '        legend: { display: false },' + sLineBreak +
    '        tooltip: {' + sLineBreak +
    '          callbacks: {' + sLineBreak +
    '            label: function(context) {' + sLineBreak +
    '              return formatMoney(context.raw);' + sLineBreak +
    '            }' + sLineBreak +
    '          }' + sLineBreak +
    '        }' + sLineBreak +
    '      }' + sLineBreak +
    '    }' + sLineBreak +
    '  });' + sLineBreak +
    '' + sLineBreak +
    '  // Gráfico por Loja' + sLineBreak +
    '  const dadosLoja = processarDados(mockData, "LOJA", "SUBTOTAL");' + sLineBreak +
    '  new Chart(document.getElementById("salesByStoreChart"), {' + sLineBreak +
    '    type: "bar",' + sLineBreak +
    '    data: {' + sLineBreak +
    '      labels: dadosLoja.labels,' + sLineBreak +
    '      datasets: [{' + sLineBreak +
    '        data: dadosLoja.values,' + sLineBreak +
    '        backgroundColor: "rgba(78, 115, 223, 0.6)"' + sLineBreak +
    '      }]' + sLineBreak +
    '    },' + sLineBreak +
    '    options: {' + sLineBreak +
    '      responsive: true,' + sLineBreak +
    '      plugins: {' + sLineBreak +
    '        legend: { display: false },' + sLineBreak +
    '        tooltip: {' + sLineBreak +
    '          callbacks: {' + sLineBreak +
    '            label: function(context) {' + sLineBreak +
    '              return formatMoney(context.raw);' + sLineBreak +
    '            }' + sLineBreak +
    '          }' + sLineBreak +
    '        }' + sLineBreak +
    '      }' + sLineBreak +
    '    }' + sLineBreak +
    '  });' + sLineBreak +
    '' + sLineBreak +
    '  // Preencher tabela' + sLineBreak +
    '  const tbody = document.getElementById("tableBody");' + sLineBreak +
    '  mockData.forEach(item => {' + sLineBreak +
    '    const tr = document.createElement("tr");' + sLineBreak +
    '    tr.innerHTML = `' + sLineBreak +
    '      <td>${item.DATA}</td>' + sLineBreak +
    '      <td>${item.PRODUTO}</td>' + sLineBreak +
    '      <td>${item.LOJA}</td>' + sLineBreak +
    '      <td>${item.VENDEDOR}</td>' + sLineBreak +
    '      <td>${formatMoney(item.SUBTOTAL)}</td>' + sLineBreak +
    '    `;' + sLineBreak +
    '    tbody.appendChild(tr);' + sLineBreak +
    '  });' + sLineBreak +
    '}';
end;



function THTMLBuilder.GetCharts: string;
var
  ChartParams: TChartParams;
begin
//  ChartParams.Title := 'Vendas por Região';
//  ChartParams.GroupField := 'REGIAO';
//  ChartParams.ValueField := 'SUBTOTAL';
//  ChartParams.ChartType := ctBar;
//  ChartParams.Orientation := coVertical;
//  ChartParams.ContainerID := 'chartVendasRegiao';
//
//  Result := TCreateChart.Generate(ChartParams);
end;

function THTMLBuilder.GerarHTML: string;
var
  Dataset: THTMLDataset;
  ChartConfigs: TArray<TChartConfig>;
begin
  Dataset := THTMLDataset.Create;
  try
    ChartConfigs := ConfigurarGraficos;

    Result :=
      '<!DOCTYPE html>' + sLineBreak +
      '<html lang="pt-BR">' + sLineBreak +
      '<head>' + sLineBreak +
      GetMeta + sLineBreak +
      GetCSS + sLineBreak +
      '<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>' + sLineBreak +
      '</head>' + sLineBreak +
      '<body>' + sLineBreak +
      '<main role="main">' + sLineBreak +
      '  <header>' + sLineBreak +
      '    <h1>Dashboard de Vendas</h1>' + sLineBreak +
      '  </header>' + sLineBreak +
      GetChartsStructure + sLineBreak +
      GetTableStructure + sLineBreak +
      '</main>' + sLineBreak +
      '<script>' + sLineBreak +
      Dataset.GetMockData + sLineBreak +
      Dataset.GetScripts(ChartConfigs) + sLineBreak +
      '</script>' + sLineBreak +
      '</body>' + sLineBreak +
      '</html>';
  finally
    Dataset.Free;
  end;
end;


class function THTMLBuilder.GetChartsStructure: string;
begin
  Result :=
    '<div class="charts-section">' + sLineBreak +
    '  <div class="chart-card">' + sLineBreak +
    '    <h5>Vendas por Região</h5>' + sLineBreak +
    '    <div class="chart-container-father">' + sLineBreak +
    '      <div class="chart-container">' + sLineBreak +
    '        <canvas id="salesByRegionChart"></canvas>' + sLineBreak +
    '      </div>' + sLineBreak +
    '    </div>' + sLineBreak +
    '  </div>' + sLineBreak +
    '  <div class="chart-card">' + sLineBreak +
    '    <h5>Vendas por Loja</h5>' + sLineBreak +
    '    <div class="chart-container-father">' + sLineBreak +
    '      <div class="chart-container">' + sLineBreak +
    '        <canvas id="salesByStoreChart"></canvas>' + sLineBreak +
    '      </div>' + sLineBreak +
    '    </div>' + sLineBreak +
    '  </div>' + sLineBreak +
    '</div>';
end;


function THTMLBuilder.GetFiltersStructure: string;
begin
  Result :=
    '<section class="filters">' + sLineBreak +
    '  <div class="filter-group">' + sLineBreak +
    '    <label>Região:</label>' + sLineBreak +
    '    <select id="filterRegion">' + sLineBreak +
    '      <option value="">Todas</option>' + sLineBreak +
    '    </select>' + sLineBreak +
    '  </div>' + sLineBreak +
    '  <div class="filter-group">' + sLineBreak +
    '    <label>Loja:</label>' + sLineBreak +
    '    <select id="filterStore">' + sLineBreak +
    '      <option value="">Todas</option>' + sLineBreak +
    '    </select>' + sLineBreak +
    '  </div>' + sLineBreak +
    '</section>';
end;


function THTMLBuilder.GetKPIStructure: string;
begin
  Result :=
    '<section class="kpis">' + sLineBreak +
    '  <article class="kpi-card">' + sLineBreak +
    '    <h2>Total de Vendas</h2>' + sLineBreak +
    '    <p id="totalSales">R$ 0,00</p>' + sLineBreak +
    '  </article>' + sLineBreak +
    '  <article class="kpi-card">' + sLineBreak +
    '    <h2>Ticket Médio</h2>' + sLineBreak +
    '    <p id="averageTicket">R$ 0,00</p>' + sLineBreak +
    '  </article>' + sLineBreak +
    '  <article class="kpi-card">' + sLineBreak +
    '    <h2>Total de Pedidos</h2>' + sLineBreak +
    '    <p id="totalOrders">0</p>' + sLineBreak +
    '  </article>' + sLineBreak +
    '</section>';
end;

function THTMLBuilder.GetPaginationStructure: string;
begin
  Result :=
    '<div class="pagination">' + sLineBreak +
    '  <button id="prevPage">Anterior</button>' + sLineBreak +
    '  <span id="pageInfo">Página 1</span>' + sLineBreak +
    '  <button id="nextPage">Próxima</button>' + sLineBreak +
    '</div>';
end;

function THTMLBuilder.GetExportButton: string;
begin
  Result := '<button id="exportButton" class="export-btn">Exportar Dados</button>';
end;

function THTMLBuilder.ConfigurarGraficos: TArray<TChartConfig>;
begin
  SetLength(Result, 2);

  // Gráfico de Vendas por Região
  Result[0].CampoAgrupamento := 'ID_REGIAO';
  Result[0].CampoCaption := 'REGIAO';
  Result[0].CampoValor := 'SUBTOTAL';
  Result[0].Titulo := 'Vendas por Região';
  Result[0].ContainerID := 'salesByRegionChart';
  Result[0].TipoGrafico := 'bar';
  Result[0].Orientacao := 'vertical';

  // Gráfico de Vendas por Loja
  Result[1].CampoAgrupamento := 'ID_LOJA';
  Result[1].CampoCaption := 'LOJA';
  Result[1].CampoValor := 'SUBTOTAL';
  Result[1].Titulo := 'Vendas por Loja';
  Result[1].ContainerID := 'salesByStoreChart';
  Result[1].TipoGrafico := 'bar';
  Result[1].Orientacao := 'horizontal';
end;

end.

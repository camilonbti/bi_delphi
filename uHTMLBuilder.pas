unit uHTMLBuilder;

interface

uses
  System.SysUtils, System.Classes;

type
  THTMLBuilder = class
  private
    function GetCSS: string;
    function GetMeta: string;
    function GetMockData: string;
    function GetTableScript: string;
    function GetTableStructure: string;
    function GetScripts: string;
    function GetCharts: string;
    function GetChartJS: string;
  public
    function GerarHTML: string;
  end;

implementation

uses CreateChart;

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
    'body { font-family: Arial; margin: 20px; }' + sLineBreak +
    '.container { max-width: 1200px; margin: 0 auto; }' + sLineBreak +
    '.table-section {' + sLineBreak +
    '    background: white;' + sLineBreak +
    '    border-radius: 0.5rem;' + sLineBreak +
    '    box-shadow: 0 0.15rem 1.75rem rgba(58, 59, 69, 0.15);' + sLineBreak +
    '    margin-bottom: 1.5rem;' + sLineBreak +
    '    overflow: hidden;' + sLineBreak +
    '}' + sLineBreak +
    '.table { width: 100%; border-collapse: collapse; }' + sLineBreak +
    'th, td { padding: 8px; text-align: left; border: 1px solid #ddd; }' + sLineBreak +
    'th { background-color: #4e73df; color: white; }' + sLineBreak +
    '</style>' + sLineBreak +

    '<style>' + sLineBreak +
    '.chart-container { width: 100%; height: auto; min-height: 300px; }' + sLineBreak +
    '</style>';
end;

function THTMLBuilder.GetMockData: string;
var
  Dados: TStringList;
begin
  Dados := TStringList.Create;
  try

    Dados.Add('const mockData = ');

    Dados.Add('[');
    // Vendas dia 1
    Dados.Add('    {');
    Dados.Add('        "ID_SAIDA": 2692490,');
    Dados.Add('        "ID_PEDIDO": 5796655,');
    Dados.Add('        "DATA": "2024-01-01",');
    Dados.Add('        "ID_PRODUTO": 16572,');
    Dados.Add('        "PRODUTO": "LIQUIDIFICADOR WALITA DAILY VERMELHO",');
    Dados.Add('        "ID_LOJA": 16,');
    Dados.Add('        "ID_REGIAO": 28,');
    Dados.Add('        "REGIAO": "REGIONAL 03",');
    Dados.Add('        "LOJA": "C.M.16 - RUY BARBOSA",');
    Dados.Add('        "ID_VENDEDOR": 453,');
    Dados.Add('        "VENDEDOR": "GILMAR GONÇALVES DOS SANTOS",');
    Dados.Add('        "ID_GRUPO": 234,');
    Dados.Add('        "GRUPO": "PORTATEIS",');
    Dados.Add('        "ID_SUBGRUPO": 97,');
    Dados.Add('        "SUBGRUPO": "LIQUIDIFICADORES",');
    Dados.Add('        "ID_MARCA": 101,');
    Dados.Add('        "MARCA": "WALITA",');
    Dados.Add('        "QUANTIDADE": 1,');
    Dados.Add('        "PRECO_VENDA": 299,');
    Dados.Add('        "SUBTOTAL": 299');
    Dados.Add('    },');
    // Vendas dia 2
    Dados.Add('    {');
    Dados.Add('        "ID_SAIDA": 2692491,');
    Dados.Add('        "ID_PEDIDO": 5796656,');
    Dados.Add('        "DATA": "2024-01-02",');
    Dados.Add('        "ID_PRODUTO": 20285,');
    Dados.Add('        "PRODUTO": "LAVADORA SEMI AUTO COLORMAQ 20KG BRANCO",');
    Dados.Add('        "ID_LOJA": 26,');
    Dados.Add('        "ID_REGIAO": 30,');
    Dados.Add('        "REGIAO": "REGIONAL 04",');
    Dados.Add('        "LOJA": "C.M.26 - FEIRA DE SANTANA II",');
    Dados.Add('        "ID_VENDEDOR": 972,');
    Dados.Add('        "VENDEDOR": "ELISANGELA GOMES GABRIEL",');
    Dados.Add('        "ID_GRUPO": 228,');
    Dados.Add('        "GRUPO": "LINHA BRANCA",');
    Dados.Add('        "ID_SUBGRUPO": 62,');
    Dados.Add('        "SUBGRUPO": "LAVADORAS",');
    Dados.Add('        "ID_MARCA": 81,');
    Dados.Add('        "MARCA": "COLORMAQ",');
    Dados.Add('        "QUANTIDADE": 1,');
    Dados.Add('        "PRECO_VENDA": 799,');
    Dados.Add('        "SUBTOTAL": 799');
    Dados.Add('    },');
    // Vendas dia 3
    Dados.Add('    {');
    Dados.Add('        "ID_SAIDA": 2692504,');
    Dados.Add('        "ID_PEDIDO": 5796667,');
    Dados.Add('        "DATA": "2024-01-03",');
    Dados.Add('        "ID_PRODUTO": 21053,');
    Dados.Add('        "PRODUTO": "APARADOR DE PELOS MONDIAL BODY GROOM 06",');
    Dados.Add('        "ID_LOJA": 42,');
    Dados.Add('        "ID_REGIAO": 30,');
    Dados.Add('        "REGIAO": "REGIONAL 04",');
    Dados.Add('        "LOJA": "C.M.42 - CAMAÇARI",');
    Dados.Add('        "ID_VENDEDOR": 943,');
    Dados.Add('        "VENDEDOR": "ANDREY NASCIMENTO SILVA",');
    Dados.Add('        "ID_GRUPO": 234,');
    Dados.Add('        "GRUPO": "PORTATEIS",');
    Dados.Add('        "ID_SUBGRUPO": 129,');
    Dados.Add('        "SUBGRUPO": "APARADOR DE PELOS",');
    Dados.Add('        "ID_MARCA": 132,');
    Dados.Add('        "MARCA": "MONDIAL",');
    Dados.Add('        "QUANTIDADE": 1,');
    Dados.Add('        "PRECO_VENDA": 149,');
    Dados.Add('        "SUBTOTAL": 149');
    Dados.Add('    },');
    // Vendas dia 4
    Dados.Add('    {');
    Dados.Add('        "ID_SAIDA": 2692864,');
    Dados.Add('        "ID_PEDIDO": 5796986,');
    Dados.Add('        "DATA": "2024-01-04",');
    Dados.Add('        "ID_PRODUTO": 21972,');
    Dados.Add('        "PRODUTO": "LAVADORA SEMI AUTO COLORMAQ 15KG BRANCA",');
    Dados.Add('        "ID_LOJA": 10,');
    Dados.Add('        "ID_REGIAO": 27,');
    Dados.Add('        "REGIAO": "REGIONAL 02",');
    Dados.Add('        "LOJA": "C.M.10 - UTINGA",');
    Dados.Add('        "ID_VENDEDOR": 318,');
    Dados.Add('        "VENDEDOR": "DEISY DIAS DE SOUZA",');
    Dados.Add('        "ID_GRUPO": 228,');
    Dados.Add('        "GRUPO": "LINHA BRANCA",');
    Dados.Add('        "ID_SUBGRUPO": 62,');
    Dados.Add('        "SUBGRUPO": "LAVADORAS",');
    Dados.Add('        "ID_MARCA": 81,');
    Dados.Add('        "MARCA": "COLORMAQ",');
    Dados.Add('        "QUANTIDADE": 1,');
    Dados.Add('        "PRECO_VENDA": 699,');
    Dados.Add('        "SUBTOTAL": 699');
    Dados.Add('    }');
    Dados.Add('];');

    Result := Dados.Text;
  finally
    Dados.Free;
  end;
end;

function THTMLBuilder.GetTableStructure: string;
begin
  Result :=
    '<div class="table-section">' + sLineBreak +
    '  <div class="table-header">' + sLineBreak +
    '    <h5>Dados de Vendas</h5>' + sLineBreak +
    '  </div>' + sLineBreak +
    '  <div class="table-container">' + sLineBreak +
    '    <table class="table" id="mainTable">' + sLineBreak +
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
    '</div>';
end;

function THTMLBuilder.GetTableScript: string;
begin
  Result :=
    'function formatMoney(value) {' + sLineBreak +
    '  return new Intl.NumberFormat("pt-BR", {' + sLineBreak +
    '    style: "currency",' + sLineBreak +
    '    currency: "BRL"' + sLineBreak +
    '  }).format(value);' + sLineBreak +
    '}' + sLineBreak +

    'function populateTable() {' + sLineBreak +
    '  const tbody = document.getElementById("tableBody");' + sLineBreak +
    '  if (!tbody) return;' + sLineBreak +
    '  mockData.forEach(item => {' + sLineBreak +
    '    const row = document.createElement("tr");' + sLineBreak +
    '    row.innerHTML = `' + sLineBreak +
    '      <td>${item.DATA}</td>' + sLineBreak +
    '      <td>${item.PRODUTO}</td>' + sLineBreak +
    '      <td>${item.LOJA}</td>' + sLineBreak +
    '      <td>${item.VENDEDOR}</td>' + sLineBreak +
    '      <td>${formatMoney(item.SUBTOTAL)}</td>' + sLineBreak +
    '    `;' + sLineBreak +
    '    tbody.appendChild(row);' + sLineBreak +
    '  });' + sLineBreak +
    '}' + sLineBreak;
end;

function THTMLBuilder.GetScripts: string;
begin
  Result :=
    'function populateTable() {' + sLineBreak +
    '  const tbody = document.getElementById("tableBody");' + sLineBreak +
    '  if (!tbody) return;' + sLineBreak +
    '  mockData.forEach(item => {' + sLineBreak +
    '    const row = document.createElement("tr");' + sLineBreak +
    '    row.innerHTML = ' +
    '      `<td>${item.DATA}</td><td>${item.PRODUTO}</td><td>${item.LOJA}</td><td>${item.VENDEDOR}</td><td>${item.SUBTOTAL}</td>`;' + sLineBreak +
    '    tbody.appendChild(row);' + sLineBreak +
    '  });' + sLineBreak +
    '}' + sLineBreak +
    'function renderChart() {' + sLineBreak +
    '  const ctx = document.getElementById("chartVendasRegiao").getContext("2d");' + sLineBreak +
    '  new Chart(ctx, {' + sLineBreak +
    '    type: "bar",' + sLineBreak +
    '    data: {' + sLineBreak +
    '      labels: mockData.map(item => item.REGIAO),' + sLineBreak +
    '      datasets: [{' + sLineBreak +
    '        label: "Vendas por Região",' + sLineBreak +
    '        data: mockData.map(item => item.SUBTOTAL),' + sLineBreak +
    '        backgroundColor: "rgba(75, 192, 192, 0.2)",' + sLineBreak +
    '        borderColor: "rgba(75, 192, 192, 1)",' + sLineBreak +
    '        borderWidth: 1' + sLineBreak +
    '      }]' + sLineBreak +
    '    },' + sLineBreak +
    '    options: {' + sLineBreak +
    '      responsive: true,' + sLineBreak +
    '      scales: {' + sLineBreak +
    '        y: { beginAtZero: true }' + sLineBreak +
    '      }' + sLineBreak +
    '    }' + sLineBreak +
    '  });' + sLineBreak +
    '}' + sLineBreak;
end;


function THTMLBuilder.GerarHTML: string;
begin
  Result :=
    '<!DOCTYPE html>' + sLineBreak +
    '<html lang="pt-BR">' + sLineBreak +
    '<head>' + sLineBreak +
    GetMeta + sLineBreak +   // Metadados
    GetCSS + sLineBreak +    // CSS
    '<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>' + sLineBreak + // Biblioteca Chart.js
    '</head>' + sLineBreak +
    '<body>' + sLineBreak +
    '<div class="container">' + sLineBreak +
    GetTableStructure + sLineBreak + // Estrutura da tabela
    '<canvas id="chartVendasRegiao"></canvas>' + sLineBreak + // Contêiner do gráfico
    '</div>' + sLineBreak +
    '<script>' + sLineBreak +
    'document.addEventListener("DOMContentLoaded", function() {' + sLineBreak +
    GetMockData + sLineBreak +  // Dados mock
    GetScripts + sLineBreak +  // Scripts de renderização (tabela e gráfico)
    '});' + sLineBreak +
    '</script>' + sLineBreak +
    '</body>' + sLineBreak +
    '</html>';
end;



function THTMLBuilder.GetCharts: string;
var
  ChartParams: TChartParams;
begin
  ChartParams.Title := 'Vendas por Região';
  ChartParams.GroupField := 'REGIAO';
  ChartParams.ValueField := 'SUBTOTAL';
  ChartParams.ChartType := ctBar;
  ChartParams.Orientation := coVertical;
  ChartParams.ContainerID := 'chartVendasRegiao';

  Result := TCreateChart.Generate(ChartParams);
end;


end.




unit uHTMLBuilder;

interface

uses
  System.SysUtils, System.Classes, HTMLDataset, HTML_Chart_CSS, HTML_Table_CSS,
  HTML_Chart_Scripts, uColorPaletteManager, uHTMLTableManager;

type
  THTMLBuilder = class
  private
    // Métodos de construção de componentes
    function GetCSS: string;
    function GetMeta: string;
    function GetScripts: string;
    function GetChartJS: string;
    function GetColorPalette: string;

    // Métodos de estrutura HTML
    function GetHTMLStructure: string;
    function GetChartsStructure: string;
    function GetTableStructure: string;
    function GetKPIStructure: string;
    function GetFiltersStructure: string;

    // Configurações
    function ConfigurarGraficos: TArray<TChartConfig>;

    // Helpers
    function GetExportButton: string;
    function GetPaginationStructure: string;

    function GetKPIStyles: string;
    function GetFilterStyles: string;

  public
    function GerarHTML: string;
  end;

implementation

function THTMLBuilder.GetMeta: string;
begin
  Result :=
    '<meta charset="UTF-8">' + sLineBreak +
    '<meta name="viewport" content="width=device-width, initial-scale=1.0">' + sLineBreak +
    '<meta name="description" content="Dashboard de Vendas">' + sLineBreak +
    '<meta name="theme-color" content="#4e73df">';
end;

function THTMLBuilder.GetChartJS: string;
begin
  Result := '<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>';
end;

function THTMLBuilder.GetColorPalette: string;
begin
  Result := '<script>' + sLineBreak + TColorPaletteManager.GetColorPaletteScript + sLineBreak + '</script>';
end;

function THTMLBuilder.GetCSS: string;
begin
  Result :=
    '<style>' + sLineBreak +
    // Estilos base
    'body { font-family: "Segoe UI", Arial, sans-serif; margin: 0; padding: 20px; background-color: #f8f9fc; color: #333; }' + sLineBreak +
    'main { max-width: 1200px; margin: 0 auto; }' + sLineBreak +
    'h1 { color: #333; text-align: center; margin-bottom: 2rem; }' + sLineBreak +

    // Grid layout para os gráficos
    THTMLChartCSS.GetChartsSectionCSS + sLineBreak +

    // Estilos dos gráficos
    THTMLChartCSS.GetChartCSS + sLineBreak +
    THTMLChartCSS.GetChartContainerCSS + sLineBreak +
    THTMLChartCSS.GetChartAnimationCSS + sLineBreak +
    THTMLChartCSS.GetChartResponsiveCSS + sLineBreak +
    THTMLChartCSS.GetChartTooltipCSS + sLineBreak +
    THTMLChartCSS.GetChartScrollbarCSS + sLineBreak +

    // Estilos da tabela
    THTMLTableCSS.GetTableCSS + sLineBreak +
    THTMLTableCSS.GetTableHeaderCSS + sLineBreak +
    THTMLTableCSS.GetTableContentCSS + sLineBreak +
    THTMLTableCSS.GetTableStatusCSS + sLineBreak +
    THTMLTableCSS.GetTableResponsiveCSS + sLineBreak +

    '</style>';
end;


function THTMLBuilder.GetHTMLStructure: string;
begin
  Result :=
    '<!DOCTYPE html>' + sLineBreak +
    '<html lang="pt-BR">' + sLineBreak +
    '<head>' + sLineBreak +
    GetMeta + sLineBreak +
    GetCSS + sLineBreak +
    GetChartJS + sLineBreak +
    GetColorPalette + sLineBreak +
    '</head>' + sLineBreak +
    '<body>' + sLineBreak +
    '<main role="main">' + sLineBreak +
    '  <header>' + sLineBreak +
    '    <h1>Dashboard de Vendas</h1>' + sLineBreak +
    '  </header>' + sLineBreak +
    GetFiltersStructure + sLineBreak +
    GetKPIStructure + sLineBreak +
    GetChartsStructure + sLineBreak +
    GetTableStructure + sLineBreak +
    '</main>' + sLineBreak +
    GetScripts + sLineBreak +
    '</body>' + sLineBreak +
    '</html>';
end;

function THTMLBuilder.GetChartsStructure: string;
begin
  Result :=
    '<section class="charts-section">' + sLineBreak +
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
    '</section>';
end;


function THTMLBuilder.GetTableStructure: string;
begin
  Result :=
    '<section class="table-section">' + sLineBreak +
    '  <div class="table-header">' + sLineBreak +
    '    <h5>Lista de Vendas</h5>' + sLineBreak +
    GetExportButton + sLineBreak +
    '  </div>' + sLineBreak +
    '  <div class="table-container">' + sLineBreak +
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
    GetPaginationStructure + sLineBreak +
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

function THTMLBuilder.GetFiltersStructure: string;
begin
  Result :=
    '<section class="filters">' + sLineBreak +
    '  <div class="filter-group">' + sLineBreak +
    '    <label for="filterRegion">Região:</label>' + sLineBreak +
    '    <select id="filterRegion">' + sLineBreak +
    '      <option value="">Todas</option>' + sLineBreak +
    '    </select>' + sLineBreak +
    '  </div>' + sLineBreak +
    '  <div class="filter-group">' + sLineBreak +
    '    <label for="filterStore">Loja:</label>' + sLineBreak +
    '    <select id="filterStore">' + sLineBreak +
    '      <option value="">Todas</option>' + sLineBreak +
    '    </select>' + sLineBreak +
    '  </div>' + sLineBreak +
    '</section>';
end;

function THTMLBuilder.GetExportButton: string;
begin
  Result := '<button id="exportButton" class="export-btn">Exportar Dados</button>';
end;

function THTMLBuilder.GetPaginationStructure: string;
begin
  Result :=
    '<nav class="pagination">' + sLineBreak +
    '  <button id="prevPage" class="pagination-btn">Anterior</button>' + sLineBreak +
    '  <span id="pageInfo">Página 1</span>' + sLineBreak +
    '  <button id="nextPage" class="pagination-btn">Próxima</button>' + sLineBreak +
    '</nav>';
end;

// Em uHTMLBuilder.pas, adicione ao método GetScripts:
function THTMLBuilder.GetScripts: string;
var
  TableManager: TTableManager;
begin
  TableManager := TTableManager.Create;
  try
    Result :=
      '<script>' + sLineBreak +
      // Scripts existentes
      THTMLChartScripts.GetFormatMoneyFunction + sLineBreak +
      THTMLChartScripts.GetDataProcessingFunction + sLineBreak +
      THTMLChartScripts.GetChartInitFunction + sLineBreak +
      THTMLChartScripts.GetChartUpdateFunction + sLineBreak +

      // Adiciona scripts da tabela
      TableManager.GetTableUtilsScript + sLineBreak +
      TableManager.GetTableScript + sLineBreak +
      TableManager.GetTableInitializationScript + sLineBreak +

      '</script>';
  finally
    TableManager.Free;
  end;
end;


function THTMLBuilder.GetKPIStyles: string;
begin
  Result :=
    '.kpis {' + sLineBreak +
    '  display: grid;' + sLineBreak +
    '  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));' + sLineBreak +
    '  gap: 1rem;' + sLineBreak +
    '  margin-bottom: 2rem;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.kpi-card {' + sLineBreak +
    '  background: white;' + sLineBreak +
    '  padding: 1.5rem;' + sLineBreak +
    '  border-radius: 0.5rem;' + sLineBreak +
    '  box-shadow: 0 0.15rem 1.75rem rgba(58, 59, 69, 0.15);' + sLineBreak +
    '  text-align: center;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.kpi-card h2 {' + sLineBreak +
    '  color: var(--text-color);' + sLineBreak +
    '  font-size: 1rem;' + sLineBreak +
    '  margin-bottom: 0.5rem;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.kpi-card p {' + sLineBreak +
    '  color: var(--primary-color);' + sLineBreak +
    '  font-size: 1.5rem;' + sLineBreak +
    '  font-weight: bold;' + sLineBreak +
    '  margin: 0;' + sLineBreak +
    '}';
end;

function THTMLBuilder.GetFilterStyles: string;
begin
  Result :=
    '.filters {' + sLineBreak +
    '  display: flex;' + sLineBreak +
    '  gap: 1rem;' + sLineBreak +
    '  margin-bottom: 2rem;' + sLineBreak +
    '  flex-wrap: wrap;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.filter-group {' + sLineBreak +
    '  display: flex;' + sLineBreak +
    '  flex-direction: column;' + sLineBreak +
    '  gap: 0.5rem;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.filter-group label {' + sLineBreak +
    '  font-size: 0.875rem;' + sLineBreak +
    '  color: var(--text-color);' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.filter-group select {' + sLineBreak +
    '  padding: 0.5rem;' + sLineBreak +
    '  border: 1px solid var(--border-color);' + sLineBreak +
    '  border-radius: 0.25rem;' + sLineBreak +
    '  min-width: 200px;' + sLineBreak +
    '}';
end;

function THTMLBuilder.ConfigurarGraficos: TArray<TChartConfig>;
begin
  SetLength(Result, 2); // Apenas 2 gráficos principais: por Região e por Loja

  // Gráfico por Região
  Result[0].CampoAgrupamento := 'ID_REGIAO';  // Campo para agrupar
  Result[0].CampoCaption := 'REGIAO';         // Campo para exibição
  Result[0].CampoValor := 'SUBTOTAL';         // Campo para somar
  Result[0].Titulo := 'Vendas por Região';
  Result[0].ContainerID := 'salesByRegionChart';
  Result[0].TipoGrafico := 'bar';
  Result[0].Orientacao := 'vertical';

  // Gráfico por Loja
  Result[1].CampoAgrupamento := 'ID_LOJA';    // Campo para agrupar
  Result[1].CampoCaption := 'LOJA';           // Campo para exibição
  Result[1].CampoValor := 'SUBTOTAL';         // Campo para somar
  Result[1].Titulo := 'Vendas por Loja';
  Result[1].ContainerID := 'salesByStoreChart';
  Result[1].TipoGrafico := 'bar';
  Result[1].Orientacao := 'horizontal';        // Horizontal para melhor visualização quando houver muitas lojas
end;

function THTMLBuilder.GerarHTML: string;
begin
  Result :=
    '<!DOCTYPE html>' + sLineBreak +
    '<html lang="pt-BR">' + sLineBreak +
    '<head>' + sLineBreak +
    GetMeta + sLineBreak +
    '<style>' + sLineBreak +
    // CSS variables e estilos base
    TColorPaletteManager.GetCSSVariables + sLineBreak +
    // Estilos dos componentes
    THTMLChartCSS.GetChartCSS + sLineBreak +
    THTMLChartCSS.GetChartContainerCSS + sLineBreak +
    THTMLChartCSS.GetChartAnimationCSS + sLineBreak +
    THTMLChartCSS.GetChartResponsiveCSS + sLineBreak +
    THTMLChartCSS.GetChartTooltipCSS + sLineBreak +
    THTMLChartCSS.GetChartScrollbarCSS + sLineBreak +
    // Estilos da tabela
    THTMLTableCSS.GetTableCSS + sLineBreak +
    THTMLTableCSS.GetTableHeaderCSS + sLineBreak +
    THTMLTableCSS.GetTableContentCSS + sLineBreak +
    THTMLTableCSS.GetTableStatusCSS + sLineBreak +
    THTMLTableCSS.GetTableResponsiveCSS + sLineBreak +
    '</style>' + sLineBreak +
    '<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>' + sLineBreak +
    '</head>' + sLineBreak +
    '<body>' + sLineBreak +
    '<main role="main">' + sLineBreak +
    '  <header>' + sLineBreak +
    '    <h1>Dashboard de Vendas</h1>' + sLineBreak +
    '  </header>' + sLineBreak +
    GetFiltersStructure + sLineBreak +
    GetKPIStructure + sLineBreak +
    GetChartsStructure + sLineBreak +
    GetTableStructure + sLineBreak +
    '</main>' + sLineBreak +
    '<script>' + sLineBreak +
    // Gerenciador de cores e utilidades
    TColorPaletteManager.GetColorPaletteScript + sLineBreak +
    // Funções de formatação e processamento
    THTMLChartScripts.GetFormatMoneyFunction + sLineBreak +
    THTMLChartScripts.GetDataProcessingFunction + sLineBreak +
    THTMLChartScripts.GetChartInitFunction + sLineBreak +
    THTMLChartScripts.GetChartUpdateFunction + sLineBreak +
    // Dados e inicialização
    THTMLDataset.GetMockData + sLineBreak +  // Já inclui 'const mockData = [...]'
    // Configuração e inicialização dos gráficos
    THTMLDataset.GetScripts(ConfigurarGraficos) + sLineBreak +
    '</script>' + sLineBreak +
    '</body>' + sLineBreak +
    '</html>';
end;




end.

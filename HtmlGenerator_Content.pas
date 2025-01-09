unit HtmlGenerator_Content;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorContent = class
  public
    class function GerarConteudo: string;
  private
    class function GerarKPIs: string;
    class function GerarGraficos: string;
    class function GerarTabela: string;
    class function GerarFiltros: string;
  end;

implementation

class function THtmlGeneratorContent.GerarConteudo: string;
var
  Content: TStringList;
begin
  Content := TStringList.Create;
  try
    Content.Add('        <header>');
    Content.Add('            <h1>Dashboard de Vendas</h1>');
    Content.Add('        </header>');
    Content.Add('');
    Content.Add(GerarFiltros);
    Content.Add('');
    Content.Add(GerarKPIs);
    Content.Add('');
    Content.Add(GerarGraficos);
    Content.Add('');
    Content.Add(GerarTabela);
    Content.Add('');
    Content.Add('        <button id="exportButton">Exportar Dados</button>');

    Result := Content.Text;
  finally
    Content.Free;
  end;
end;

class function THtmlGeneratorContent.GerarKPIs: string;
var
  Content: TStringList;
begin
  Content := TStringList.Create;
  try
    Content.Add('        <section class="kpis">');
    Content.Add('            <article class="kpi-card" title="Total de Vendas realizadas no período selecionado.">');
    Content.Add('                <h2>Total de Vendas</h2>');
    Content.Add('                <p id="totalSales">R$ 0,00</p>');
    Content.Add('                <div class="tooltip">Total de Vendas realizadas no período selecionado.</div>');
    Content.Add('            </article>');
    Content.Add('            <article class="kpi-card" title="Ticket médio das vendas no período selecionado.">');
    Content.Add('                <h2>Ticket Médio</h2>');
    Content.Add('                <p id="averageTicket">R$ 0,00</p>');
    Content.Add('                <div class="tooltip">Ticket médio das vendas no período selecionado.</div>');
    Content.Add('            </article>');
    Content.Add('            <article class="kpi-card" title="Número total de pedidos realizados no período selecionado.">');
    Content.Add('                <h2>Total de Pedidos</h2>');
    Content.Add('                <p id="totalOrders">0</p>');
    Content.Add('                <div class="tooltip">Número total de pedidos realizados no período selecionado.</div>');
    Content.Add('            </article>');
    Content.Add('        </section>');

    Result := Content.Text;
  finally
    Content.Free;
  end;
end;

class function THtmlGeneratorContent.GerarGraficos: string;
var
  Content: TStringList;
begin
  Content := TStringList.Create;
  try
    Content.Add('        <section class="charts">');
    Content.Add('            <div class="chart-container" id="salesByRegionContainer">');
    Content.Add('                <canvas id="salesByRegionChart"></canvas>');
    Content.Add('                <div class="tooltip">Vendas por Região</div>');
    Content.Add('            </div>');
    Content.Add('            <div class="chart-container" id="salesByStoreContainer">');
    Content.Add('                <canvas id="salesByStoreChart"></canvas>');
    Content.Add('                <div class="tooltip">Vendas por Loja</div>');
    Content.Add('            </div>');
    Content.Add('            <div class="chart-container" id="salesByGroupContainer">');
    Content.Add('                <canvas id="salesByGroupChart"></canvas>');
    Content.Add('                <div class="tooltip">Vendas por Grupo</div>');
    Content.Add('            </div>');
    Content.Add('            <div class="chart-container" id="salesBySubgroupContainer">');
    Content.Add('                <canvas id="salesBySubgroupChart"></canvas>');
    Content.Add('                <div class="tooltip">Vendas por Subgrupo</div>');
    Content.Add('            </div>');
    Content.Add('            <div class="chart-container" id="salesByBrandContainer">');
    Content.Add('                <canvas id="salesByBrandChart"></canvas>');
    Content.Add('                <div class="tooltip">Vendas por Marca</div>');
    Content.Add('            </div>');
    Content.Add('            <div class="chart-container" id="salesBySellerContainer">');
    Content.Add('                <canvas id="salesBySellerChart"></canvas>');
    Content.Add('                <div class="tooltip">Vendas por Vendedor</div>');
    Content.Add('            </div>');
    Content.Add('        </section>');

    Result := Content.Text;
  finally
    Content.Free;
  end;
end;

class function THtmlGeneratorContent.GerarTabela: string;
var
  Content: TStringList;
begin
  Content := TStringList.Create;
  try
    Content.Add('        <section>');
    Content.Add('            <table>');
    Content.Add('                <thead>');
    Content.Add('                    <tr>');
    Content.Add('                        <th>ID Pedido</th>');
    Content.Add('                        <th>Produto</th>');
    Content.Add('                        <th>Fornecedor</th>');
    Content.Add('                        <th>Quantidade</th>');
    Content.Add('                        <th>Preço de Venda</th>');
    Content.Add('                        <th>Subtotal</th>');
    Content.Add('                    </tr>');
    Content.Add('                </thead>');
    Content.Add('                <tbody id="tableContent">');
    Content.Add('                    <!-- Dados da tabela serão inseridos aqui -->');
    Content.Add('                </tbody>');
    Content.Add('            </table>');
    Content.Add('        </section>');
    Content.Add('');
    Content.Add('        <section class="pagination" id="pagination">');
    Content.Add('            <!-- Botões de paginação serão adicionados aqui -->');
    Content.Add('        </section>');

    Result := Content.Text;
  finally
    Content.Free;
  end;
end;

class function THtmlGeneratorContent.GerarFiltros: string;
var
  Content: TStringList;
begin
  Content := TStringList.Create;
  try
    Content.Add('        <nav class="filters" id="filtersContainer">');
    Content.Add('            <!-- Filtros aplicados serão exibidos aqui -->');
    Content.Add('        </nav>');

    Result := Content.Text;
  finally
    Content.Free;
  end;
end;

end.

unit HtmlGenerator_Content;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorContent = class
  public
    class function GerarConteudo: string;
  end;

implementation

class function THtmlGeneratorContent.GerarConteudo: string;
var
  HTML: TStringList;
begin
  HTML := TStringList.Create;
  try
    HTML.Add('        <header>');
    HTML.Add('            <h1>Dashboard de Vendas</h1>');
    HTML.Add('        </header>');
    HTML.Add('');
    HTML.Add('        <section class="filters">');
    HTML.Add('            <div class="filter-group">');
    HTML.Add('                <label for="filtroRegiao">Região:</label>');
    HTML.Add('                <select id="filtroRegiao" class="filter-select">');
    HTML.Add('                    <option value="">Todas</option>');
    HTML.Add('                </select>');
    HTML.Add('            </div>');
    HTML.Add('            <div class="filter-group">');
    HTML.Add('                <label for="filtroLoja">Loja:</label>');
    HTML.Add('                <select id="filtroLoja" class="filter-select">');
    HTML.Add('                    <option value="">Todas</option>');
    HTML.Add('                </select>');
    HTML.Add('            </div>');
    HTML.Add('            <div class="filter-group">');
    HTML.Add('                <label for="filtroGrupo">Grupo:</label>');
    HTML.Add('                <select id="filtroGrupo" class="filter-select">');
    HTML.Add('                    <option value="">Todos</option>');
    HTML.Add('                </select>');
    HTML.Add('            </div>');
    HTML.Add('            <div class="filter-group">');
    HTML.Add('                <label for="filtroVendedor">Vendedor:</label>');
    HTML.Add('                <select id="filtroVendedor" class="filter-select">');
    HTML.Add('                    <option value="">Todos</option>');
    HTML.Add('                </select>');
    HTML.Add('            </div>');
    HTML.Add('        </section>');
    HTML.Add('');
    HTML.Add('        <section class="kpis">');
    HTML.Add('            <article class="kpi-card">');
    HTML.Add('                <h2>Total de Vendas</h2>');
    HTML.Add('                <p id="totalVendas">R$ 0,00</p>');
    HTML.Add('            </article>');
    HTML.Add('            <article class="kpi-card">');
    HTML.Add('                <h2>Ticket Médio</h2>');
    HTML.Add('                <p id="ticketMedio">R$ 0,00</p>');
    HTML.Add('            </article>');
    HTML.Add('            <article class="kpi-card">');
    HTML.Add('                <h2>Total de Pedidos</h2>');
    HTML.Add('                <p id="totalPedidos">0</p>');
    HTML.Add('            </article>');
    HTML.Add('        </section>');
    HTML.Add('');
    HTML.Add('        <section class="charts">');
    HTML.Add('            <div class="chart-container">');
    HTML.Add('                <canvas id="vendasPorRegiao"></canvas>');
    HTML.Add('            </div>');
    HTML.Add('            <div class="chart-container">');
    HTML.Add('                <canvas id="vendasPorLoja"></canvas>');
    HTML.Add('            </div>');
    HTML.Add('            <div class="chart-container">');
    HTML.Add('                <canvas id="vendasPorGrupo"></canvas>');
    HTML.Add('            </div>');
    HTML.Add('            <div class="chart-container">');
    HTML.Add('                <canvas id="vendasPorSubgrupo"></canvas>');
    HTML.Add('            </div>');
    HTML.Add('            <div class="chart-container">');
    HTML.Add('                <canvas id="vendasPorMarca"></canvas>');
    HTML.Add('            </div>');
    HTML.Add('            <div class="chart-container">');
    HTML.Add('                <canvas id="vendasPorVendedor"></canvas>');
    HTML.Add('            </div>');
    HTML.Add('        </section>');
    HTML.Add('');
    HTML.Add('        <section class="table-container">');
    HTML.Add('            <table>');
    HTML.Add('                <thead>');
    HTML.Add('                    <tr>');
    HTML.Add('                        <th>Pedido</th>');
    HTML.Add('                        <th>Data</th>');
    HTML.Add('                        <th>Produto</th>');
    HTML.Add('                        <th>Loja</th>');
    HTML.Add('                        <th>Vendedor</th>');
    HTML.Add('                        <th>Quantidade</th>');
    HTML.Add('                        <th>Preço</th>');
    HTML.Add('                        <th>Subtotal</th>');
    HTML.Add('                    </tr>');
    HTML.Add('                </thead>');
    HTML.Add('                <tbody id="tabelaVendas">');
    HTML.Add('                </tbody>');
    HTML.Add('            </table>');
    HTML.Add('        </section>');
    HTML.Add('');
    HTML.Add('        <div class="pagination">');
    HTML.Add('            <button id="paginaAnterior" class="btn" disabled>Anterior</button>');
    HTML.Add('            <button id="proximaPagina" class="btn">Próxima</button>');
    HTML.Add('        </div>');
    HTML.Add('');
    HTML.Add('        <button id="exportButton" class="btn btn-primary">Exportar Dados</button>');

    Result := HTML.Text;
  finally
    HTML.Free;
  end;
end;

end.

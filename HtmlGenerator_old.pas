unit HtmlGenerator_old;

interface

uses
  System.Classes, System.SysUtils;

//type
//  THtmlGenerator = class
//  private
//    const
//      CHART_JS_URL = 'https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js';
//      asp_simp = Chr(39);
//
//
//    class function GerarDoctype: string;
//    class function GerarTitulo: string;
//    class function GerarDataSet: string;



//    class function GerarDoctype: string;
//    class function GerarMetaTags: string;
//    class function GerarEstilos: string;
//    class function GerarScriptChartJs: string;
//    class function GerarHeadCompleto: string;
//    class function GerarEstruturaMain: string;
//    class function GerarHeader: string;
//    class function GerarNavFiltros: string;
//    class function GerarSecaoKPIs: string;
//    class function GerarSecaoGraficos: string;
//    class function GerarSecaoTabela: string;
//    class function GerarSecaoPaginacao: string;
//    class function GerarBotaoExportar: string;
//    class function GerarScriptVariaveis: string;
//    class function GerarScriptConstantes: string;
//    class function GerarScriptFuncoes: string;
//    class function GerarScriptEventos: string;
//    class function GerarScriptInicializacao: string;

//  public
//    class function GerarHTML: string;
//  end;

implementation

//uses uPrincipal;

//class function THtmlGenerator.GerarDoctype: string;
//begin
//  Result :=
//
//'<!DOCTYPE html> ' + sLineBreak +
//'<html lang="pt-BR"> ' + sLineBreak +
//'<head> ' + sLineBreak +
//'    <meta charset="UTF-8"> ' + sLineBreak +
//'    <meta name="viewport" content="width=device-width, initial-scale=1.0"> ' + sLineBreak +
//'    <title>Dashboard de Vendas</title> ' + sLineBreak +
//'    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script> ' + sLineBreak +
//'    <style> ' + sLineBreak +
//'        body { ' + sLineBreak +
//'            font-family: Arial, sans-serif; ' + sLineBreak +
//'            margin: 0; ' + sLineBreak +
//'            padding: 20px; ' + sLineBreak +
//'            background-color: #f0f0f0; ' + sLineBreak +
//'            color: #333; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        main { ' + sLineBreak +
//'            max-width: 1200px; ' + sLineBreak +
//'            margin: 0 auto; ' + sLineBreak +
//'            background-color: white; ' + sLineBreak +
//'            padding: 20px; ' + sLineBreak +
//'            border-radius: 8px; ' + sLineBreak +
//'            box-shadow: 0 0 10px rgba(0,0,0,0.1); ' + sLineBreak +
//'        } ' + sLineBreak +
//'        h1 { ' + sLineBreak +
//'            color: #333; ' + sLineBreak +
//'            text-align: center; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .filters { ' + sLineBreak +
//'            display: flex; ' + sLineBreak +
//'            gap: 10px; ' + sLineBreak +
//'            margin-bottom: 20px; ' + sLineBreak +
//'            justify-content: center; ' + sLineBreak +
//'            flex-wrap: wrap; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .filter-item { ' + sLineBreak +
//'            background-color: #007bff; ' + sLineBreak +
//'            color: white; ' + sLineBreak +
//'            padding: 5px 10px; ' + sLineBreak +
//'            border-radius: 4px; ' + sLineBreak +
//'            margin: 5px; ' + sLineBreak +
//'            cursor: pointer; ' + sLineBreak +
//'            display: flex; ' + sLineBreak +
//'            align-items: center; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .filter-item span { ' + sLineBreak +
//'            margin-left: 5px; ' + sLineBreak +
//'            font-weight: bold; ' + sLineBreak +
//'            cursor: pointer; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .kpis { ' + sLineBreak +
//'            display: flex; ' + sLineBreak +
//'            justify-content: space-between; ' + sLineBreak +
//'            margin-bottom: 30px; ' + sLineBreak +
//'            flex-wrap: nowrap; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .kpi-card { ' + sLineBreak +
//'            background-color: #e9ecef; ' + sLineBreak +
//'            padding: 15px; ' + sLineBreak +
//'            border-radius: 8px; ' + sLineBreak +
//'            text-align: center; ' + sLineBreak +
//'            flex: 1; ' + sLineBreak +
//'            margin: 10px; ' + sLineBreak +
//'            min-width: 150px; ' + sLineBreak +
//'            position: relative; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .kpi-card h3, .kpi-card p { ' + sLineBreak +
//'            color: #333; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .kpi-card .tooltip { ' + sLineBreak +
//'            position: absolute; ' + sLineBreak +
//'            top: -10px; ' + sLineBreak +
//'            right: -10px; ' + sLineBreak +
//'            background-color: rgba(0, 0, 0, 0.7); ' + sLineBreak +
//'            color: white; ' + sLineBreak +
//'            padding: 5px; ' + sLineBreak +
//'            border-radius: 4px; ' + sLineBreak +
//'            display: none; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .kpi-card:hover .tooltip { ' + sLineBreak +
//'            display: block; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .charts { ' + sLineBreak +
//'            display: flex; ' + sLineBreak +
//'            gap: 20px; ' + sLineBreak +
//'            margin-bottom: 30px; ' + sLineBreak +
//'            flex-wrap: wrap; ' + sLineBreak +
//'            justify-content: space-around; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .chart-container { ' + sLineBreak +
//'            flex: 1 1 45%; ' + sLineBreak +
//'            min-width: 300px; ' + sLineBreak +
//'            max-width: 600px; ' + sLineBreak +
//'            height: 400px; ' + sLineBreak +
//'            background-color: white; ' + sLineBreak +
//'            padding: 15px; ' + sLineBreak +
//'            border-radius: 8px; ' + sLineBreak +
//'            box-shadow: 0 0 5px rgba(0,0,0,0.1); ' + sLineBreak +
//'            position: relative; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .chart-container .tooltip { ' + sLineBreak +
//'            position: absolute; ' + sLineBreak +
//'            top: -10px; ' + sLineBreak +
//'            right: -10px; ' + sLineBreak +
//'            background-color: rgba(0, 0, 0, 0.7); ' + sLineBreak +
//'            color: white; ' + sLineBreak +
//'            padding: 5px; ' + sLineBreak +
//'            border-radius: 4px; ' + sLineBreak +
//'            display: none; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .chart-container:hover .tooltip { ' + sLineBreak +
//'            display: block; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        table { ' + sLineBreak +
//'            width: 100%; ' + sLineBreak +
//'            border-collapse: separate; ' + sLineBreak +
//'            border-spacing: 0 10px; ' + sLineBreak +
//'            font-size: 14px; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        th, td { ' + sLineBreak +
//'            text-align: left; ' + sLineBreak +
//'            padding: 10px; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        th { ' + sLineBreak +
//'            background-color: #007bff; ' + sLineBreak +
//'            color: white; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        td { ' + sLineBreak +
//'            background-color: #f8f9fa; ' + sLineBreak +
//'            border-bottom: 1px solid #ddd; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        th:nth-child(1), td:nth-child(1) { width: 8%; } ' + sLineBreak +
//'        th:nth-child(2), td:nth-child(2) { width: 35%; } ' + sLineBreak +
//'        th:nth-child(3), td:nth-child(3) { width: 24%; } ' + sLineBreak +
//'        th:nth-child(4), td:nth-child(4) { width: 8%; } ' + sLineBreak +
//'        th:nth-child(5), td:nth-child(5) { width: 13%; } ' + sLineBreak +
//'        th:nth-child(6), td:nth-child(6) { width: 12%; } ' + sLineBreak +
//'        td:nth-child(4), td:nth-child(5), td:nth-child(6) { ' + sLineBreak +
//'            text-align: right; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        #exportButton { ' + sLineBreak +
//'            background-color: #007bff; ' + sLineBreak +
//'            color: white; ' + sLineBreak +
//'            padding: 10px 20px; ' + sLineBreak +
//'            border: none; ' + sLineBreak +
//'            border-radius: 4px; ' + sLineBreak +
//'            cursor: pointer; ' + sLineBreak +
//'            display: block; ' + sLineBreak +
//'            margin: 20px auto 0; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        #exportButton:hover { ' + sLineBreak +
//'            background-color: #0056b3; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .pagination { ' + sLineBreak +
//'            display: flex; ' + sLineBreak +
//'            justify-content: center; ' + sLineBreak +
//'            margin-top: 20px; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .pagination button { ' + sLineBreak +
//'            background-color: #007bff; ' + sLineBreak +
//'            color: white; ' + sLineBreak +
//'            padding: 5px 10px; ' + sLineBreak +
//'            border: none; ' + sLineBreak +
//'            border-radius: 4px; ' + sLineBreak +
//'            cursor: pointer; ' + sLineBreak +
//'            margin: 0 5px; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        .pagination button.disabled { ' + sLineBreak +
//'            background-color: #ddd; ' + sLineBreak +
//'            cursor: not-allowed; ' + sLineBreak +
//'        } ' + sLineBreak +
//'        @media (max-width: 768px) { ' + sLineBreak +
//'            .kpis { ' + sLineBreak +
//'                flex-wrap: wrap; ' + sLineBreak +
//'            } ' + sLineBreak +
//'            .kpi-card { ' + sLineBreak +
//'                flex: 1 1 100%; ' + sLineBreak +
//'                max-width: 100%; ' + sLineBreak +
//'            } ' + sLineBreak +
//'            .charts { ' + sLineBreak +
//'                flex-direction: column; ' + sLineBreak +
//'                align-items: center; ' + sLineBreak +
//'            } ' + sLineBreak +
//'        } ' + sLineBreak +
//'    </style> ' + sLineBreak +
//'</head> ' + sLineBreak;
//end;
//
//class function THtmlGenerator.GerarTitulo: string;
//begin
//  Result :=
//'        <header> ' + sLineBreak +
//'            <h1>Dashboard de Vendas</h1> ' + sLineBreak +
//'        </header> ' + sLineBreak;
//end;
//
//class function THtmlGenerator.GerarHTML: string;
//var
//  HTML: TStringList;
//begin
//  HTML := TStringList.Create;
//  try
//    HTML.Text := UTF8String(HTML.Text);
//    DefaultSystemCodePage := CP_UTF8;
//
//
//    HTML.Add('<!DOCTYPE html>');
//    HTML.Add('<html lang="pt-BR">');
//    HTML.Add('<head>');
//    HTML.Add('    <meta charset="UTF-8">');
//    HTML.Add('    <meta name="viewport" content="width=device-width, initial-scale=1.0">');
//    HTML.Add('    <title>Dashboard de Vendas</title>');
//    HTML.Add('    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>');
//    HTML.Add('    <style>');
//    HTML.Add('        body {');
//    HTML.Add('            font-family: Arial, sans-serif;');
//    HTML.Add('            margin: 0;');
//    HTML.Add('            padding: 20px;');
//    HTML.Add('            background-color: #f0f0f0;');
//    HTML.Add('            color: #333;');
//    HTML.Add('        }');
//    HTML.Add('        main {');
//    HTML.Add('            max-width: 1200px;');
//    HTML.Add('            margin: 0 auto;');
//    HTML.Add('            background-color: white;');
//    HTML.Add('            padding: 20px;');
//    HTML.Add('            border-radius: 8px;');
//    HTML.Add('            box-shadow: 0 0 10px rgba(0,0,0,0.1);');
//    HTML.Add('        }');
//    HTML.Add('        h1 {');
//    HTML.Add('            color: #333;');
//    HTML.Add('            text-align: center;');
//    HTML.Add('        }');
//    HTML.Add('        .filters {');
//    HTML.Add('            display: flex;');
//    HTML.Add('            gap: 10px;');
//    HTML.Add('            margin-bottom: 20px;');
//    HTML.Add('            justify-content: center;');
//    HTML.Add('            flex-wrap: wrap;');
//    HTML.Add('        }');
//    HTML.Add('        .filter-item {');
//    HTML.Add('            background-color: #007bff;');
//    HTML.Add('            color: white;');
//    HTML.Add('            padding: 5px 10px;');
//    HTML.Add('            border-radius: 4px;');
//    HTML.Add('            margin: 5px;');
//    HTML.Add('            cursor: pointer;');
//    HTML.Add('            display: flex;');
//    HTML.Add('            align-items: center;');
//    HTML.Add('        }');
//    HTML.Add('        .filter-item span {');
//    HTML.Add('            margin-left: 5px;');
//    HTML.Add('            font-weight: bold;');
//    HTML.Add('            cursor: pointer;');
//    HTML.Add('        }');
//    HTML.Add('        .kpis {');
//    HTML.Add('            display: flex;');
//    HTML.Add('            justify-content: space-between;');
//    HTML.Add('            margin-bottom: 30px;');
//    HTML.Add('            flex-wrap: nowrap;');
//    HTML.Add('        }');
//    HTML.Add('        .kpi-card {');
//    HTML.Add('            background-color: #e9ecef;');
//    HTML.Add('            padding: 15px;');
//    HTML.Add('            border-radius: 8px;');
//    HTML.Add('            text-align: center;');
//    HTML.Add('            flex: 1;');
//    HTML.Add('            margin: 10px;');
//    HTML.Add('            min-width: 150px;');
//    HTML.Add('            position: relative;');
//    HTML.Add('        }');
//    HTML.Add('        .kpi-card h3, .kpi-card p {');
//    HTML.Add('            color: #333;');
//    HTML.Add('        }');
//    HTML.Add('        .kpi-card .tooltip {');
//    HTML.Add('            position: absolute;');
//    HTML.Add('            top: -10px;');
//    HTML.Add('            right: -10px;');
//    HTML.Add('            background-color: rgba(0, 0, 0, 0.7);');
//    HTML.Add('            color: white;');
//    HTML.Add('            padding: 5px;');
//    HTML.Add('            border-radius: 4px;');
//    HTML.Add('            display: none;');
//    HTML.Add('        }');
//    HTML.Add('        .kpi-card:hover .tooltip {');
//    HTML.Add('            display: block;');
//    HTML.Add('        }');
//    HTML.Add('        .charts {');
//    HTML.Add('            display: flex;');
//    HTML.Add('            gap: 20px;');
//    HTML.Add('            margin-bottom: 30px;');
//    HTML.Add('            flex-wrap: wrap;');
//    HTML.Add('            justify-content: space-around;');
//    HTML.Add('        }');
//    HTML.Add('        .chart-container {');
//    HTML.Add('            flex: 1 1 45%;');
//    HTML.Add('            min-width: 300px;');
//    HTML.Add('            max-width: 600px;');
//    HTML.Add('            height: 400px;');
//    HTML.Add('            background-color: white;');
//    HTML.Add('            padding: 15px;');
//    HTML.Add('            border-radius: 8px;');
//    HTML.Add('            box-shadow: 0 0 5px rgba(0,0,0,0.1);');
//    HTML.Add('            position: relative;');
//    HTML.Add('        }');
//    HTML.Add('        .chart-container .tooltip {');
//    HTML.Add('            position: absolute;');
//    HTML.Add('            top: -10px;');
//    HTML.Add('            right: -10px;');
//    HTML.Add('            background-color: rgba(0, 0, 0, 0.7);');
//    HTML.Add('            color: white;');
//    HTML.Add('            padding: 5px;');
//    HTML.Add('            border-radius: 4px;');
//    HTML.Add('            display: none;');
//    HTML.Add('        }');
//    HTML.Add('        .chart-container:hover .tooltip {');
//    HTML.Add('            display: block;');
//    HTML.Add('        }');
//    HTML.Add('        table {');
//    HTML.Add('            width: 100%;');
//    HTML.Add('            border-collapse: separate;');
//    HTML.Add('            border-spacing: 0 10px;');
//    HTML.Add('            font-size: 14px;');
//    HTML.Add('        }');
//    HTML.Add('        th, td {');
//    HTML.Add('            text-align: left;');
//    HTML.Add('            padding: 10px;');
//    HTML.Add('        }');
//    HTML.Add('        th {');
//    HTML.Add('            background-color: #007bff;');
//    HTML.Add('            color: white;');
//    HTML.Add('        }');
//    HTML.Add('        td {');
//    HTML.Add('            background-color: #f8f9fa;');
//    HTML.Add('            border-bottom: 1px solid #ddd;');
//    HTML.Add('        }');
//    HTML.Add('        th:nth-child(1), td:nth-child(1) { width: 8%; }');
//    HTML.Add('        th:nth-child(2), td:nth-child(2) { width: 35%; }');
//    HTML.Add('        th:nth-child(3), td:nth-child(3) { width: 24%; }');
//    HTML.Add('        th:nth-child(4), td:nth-child(4) { width: 8%; }');
//    HTML.Add('        th:nth-child(5), td:nth-child(5) { width: 13%; }');
//    HTML.Add('        th:nth-child(6), td:nth-child(6) { width: 12%; }');
//    HTML.Add('        td:nth-child(4), td:nth-child(5), td:nth-child(6) {');
//    HTML.Add('            text-align: right;');
//    HTML.Add('        }');
//    HTML.Add('        #exportButton {');
//    HTML.Add('            background-color: #007bff;');
//    HTML.Add('            color: white;');
//    HTML.Add('            padding: 10px 20px;');
//    HTML.Add('            border: none;');
//    HTML.Add('            border-radius: 4px;');
//    HTML.Add('            cursor: pointer;');
//    HTML.Add('            display: block;');
//    HTML.Add('            margin: 20px auto 0;');
//    HTML.Add('        }');
//    HTML.Add('        #exportButton:hover {');
//    HTML.Add('            background-color: #0056b3;');
//    HTML.Add('        }');
//    HTML.Add('        .pagination {');
//    HTML.Add('            display: flex;');
//    HTML.Add('            justify-content: center;');
//    HTML.Add('            margin-top: 20px;');
//    HTML.Add('        }');
//    HTML.Add('        .pagination button {');
//    HTML.Add('            background-color: #007bff;');
//    HTML.Add('            color: white;');
//    HTML.Add('            padding: 5px 10px;');
//    HTML.Add('            border: none;');
//    HTML.Add('            border-radius: 4px;');
//    HTML.Add('            cursor: pointer;');
//    HTML.Add('            margin: 0 5px;');
//    HTML.Add('        }');
//    HTML.Add('        .pagination button.disabled {');
//    HTML.Add('            background-color: #ddd;');
//    HTML.Add('            cursor: not-allowed;');
//    HTML.Add('        }');
//    HTML.Add('        @media (max-width: 768px) {');
//    HTML.Add('            .kpis {');
//    HTML.Add('                flex-wrap: wrap;');
//    HTML.Add('            }');
//    HTML.Add('            .kpi-card {');
//    HTML.Add('                flex: 1 1 100%;');
//    HTML.Add('                max-width: 100%;');
//    HTML.Add('            }');
//    HTML.Add('            .charts {');
//    HTML.Add('                flex-direction: column;');
//    HTML.Add('                align-items: center;');
//    HTML.Add('            }');
//    HTML.Add('        }');
//    HTML.Add('    </style>');
//    HTML.Add('</head>');
//    HTML.Add('<body>');
//    HTML.Add('    <main role="main">');
//    HTML.Add('        <header>');
//    HTML.Add('            <h1>Dashboard de Vendas</h1>');
//    HTML.Add('        </header>');
//    HTML.Add('');
//    HTML.Add('        <nav class="filters" id="filtersContainer">');
//    HTML.Add('            <!-- Filtros aplicados serão exibidos aqui -->');
//    HTML.Add('        </nav>');
//    HTML.Add('');
//    HTML.Add('        <section class="kpis">');
//    HTML.Add('            <article class="kpi-card" title="Total de Vendas realizadas no período selecionado.">');
//    HTML.Add('                <h2>Total de Vendas</h2>');
//    HTML.Add('                <p id="totalSales">R$ 0,00</p>');
//    HTML.Add('                <div class="tooltip">Total de Vendas realizadas no período selecionado.</div>');
//    HTML.Add('            </article>');
//    HTML.Add('            <article class="kpi-card" title="Ticket médio das vendas no período selecionado.">');
//    HTML.Add('                <h2>Ticket Médio</h2>');
//    HTML.Add('                <p id="averageTicket">R$ 0,00</p>');
//    HTML.Add('                <div class="tooltip">Ticket médio das vendas no período selecionado.</div>');
//    HTML.Add('            </article>');
//    HTML.Add('            <article class="kpi-card" title="Número total de pedidos realizados no período selecionado.">');
//    HTML.Add('                <h2>Total de Pedidos</h2>');
//    HTML.Add('                <p id="totalOrders">0</p>');
//    HTML.Add('                <div class="tooltip">Número total de pedidos realizados no período selecionado.</div>');
//    HTML.Add('            </article>');
//    HTML.Add('        </section>');
//    HTML.Add('');
//    HTML.Add('        <section class="charts">');
//    HTML.Add('            <div class="chart-container" id="salesByRegionContainer">');
//    HTML.Add('                <canvas id="salesByRegionChart"></canvas>');
//    HTML.Add('                <div class="tooltip">Vendas por Região</div>');
//    HTML.Add('            </div>');
//    HTML.Add('            <div class="chart-container" id="salesByStoreContainer">');
//    HTML.Add('                <canvas id="salesByStoreChart"></canvas>');
//    HTML.Add('                <div class="tooltip">Vendas por Loja</div>');
//    HTML.Add('            </div>');
//    HTML.Add('            <div class="chart-container" id="salesByGroupContainer">');
//    HTML.Add('                <canvas id="salesByGroupChart"></canvas>');
//    HTML.Add('                <div class="tooltip">Vendas por Grupo</div>');
//    HTML.Add('            </div>');
//    HTML.Add('            <div class="chart-container" id="salesBySubgroupContainer">');
//    HTML.Add('                <canvas id="salesBySubgroupChart"></canvas>');
//    HTML.Add('                <div class="tooltip">Vendas por Subgrupo</div>');
//    HTML.Add('            </div>');
//    HTML.Add('            <div class="chart-container" id="salesByBrandContainer">');
//    HTML.Add('                <canvas id="salesByBrandChart"></canvas>');
//    HTML.Add('                <div class="tooltip">Vendas por Marca</div>');
//    HTML.Add('            </div>');
//    HTML.Add('            <div class="chart-container" id="salesBySellerContainer">');
//    HTML.Add('                <canvas id="salesBySellerChart"></canvas>');
//    HTML.Add('                <div class="tooltip">Vendas por Vendedor</div>');
//    HTML.Add('            </div>');
//    HTML.Add('        </section>');
//    HTML.Add('');
//    HTML.Add('        <section>');
//    HTML.Add('            <table>');
//    HTML.Add('                <thead>');
//    HTML.Add('                    <tr>');
//    HTML.Add('                        <th>ID Pedido</th>');
//    HTML.Add('                        <th>Produto</th>');
//    HTML.Add('                        <th>Fornecedor</th>');
//    HTML.Add('                        <th>Quantidade</th>');
//    HTML.Add('                        <th>Preço de Venda</th>');
//    HTML.Add('                        <th>Subtotal</th>');
//    HTML.Add('                    </tr>');
//    HTML.Add('                </thead>');
//    HTML.Add('                <tbody id="tableContent">');
//    HTML.Add('                    <!-- Dados da tabela serão inseridos aqui -->');
//    HTML.Add('                </tbody>');
//    HTML.Add('            </table>');
//    HTML.Add('        </section>');
//    HTML.Add('');
//    HTML.Add('        <section class="pagination" id="pagination">');
//    HTML.Add('            <!-- Botões de paginação serão adicionados aqui -->');
//    HTML.Add('        </section>');
//    HTML.Add('');
//    HTML.Add('        <button id="exportButton">Exportar Dados</button>');
//    HTML.Add('    </main>');
//    HTML.Add('');
//    HTML.Add('    <script>');
//    HTML.Add('        const iflog = true; // Variável global para controle de logs');
//    HTML.Add('');
//
//
//
//
//
//    HTML.Add('        const mockData = [');
//    HTML.Add('            { ID_SAIDA: 2692490,');
//    HTML.Add('              ID_PEDIDO: 5796655,');
//    HTML.Add('              ID_PRODUTO: 16572,');
//    HTML.Add('              PRODUTO: "LIQUIDIFICADOR WALITA DAILY VERMELHO",');
//    HTML.Add('              ID_LOJA: 16,');
//    HTML.Add('              ID_REGIAO: 28,');
//    HTML.Add('              REGIAO: "REGIONAL 03",');
//    HTML.Add('              LOJA: "C.M.16 - RUY BARBOSA",');
//    HTML.Add('              ID_VENDEDOR: 453,');
//    HTML.Add('              VENDEDOR: "16 GILMAR GONÇALVES DOS SANTOS",');
//    HTML.Add('              ID_GRUPO: 234,');
//    HTML.Add('              GRUPO: "PORTATEIS",');
//    HTML.Add('              ID_SUBGRUPO: 97,');
//    HTML.Add('              SUBGRUPO: "LIQUIDIFICADORES",');
//    HTML.Add('              ID_MARCA: 101,');
//    HTML.Add('              MARCA: "WALITA",');
//    HTML.Add('              QUANTIDADE: 1,');
//    HTML.Add('              PRECO_VENDA: 299,');
//    HTML.Add('              SUBTOTAL: 299 },');
//
//    HTML.Add('            { ID_SAIDA: 2692491,');
//    HTML.Add('              ID_PEDIDO: 5796656,');
//    HTML.Add('              ID_PRODUTO: 20285,');
//    HTML.Add('              PRODUTO: "LAVADORA SEMI AUTO COLORMAQ 20KG BRANCO",');
//    HTML.Add('              ID_LOJA: 26,');
//    HTML.Add('              ID_REGIAO: 30,');
//    HTML.Add('              REGIAO: "REGIONAL 04",');
//    HTML.Add('              LOJA: "C.M.26 - FEIRA DE SANTANA II",');
//    HTML.Add('              ID_VENDEDOR: 972,');
//    HTML.Add('              VENDEDOR: "26 ELISANGELA GOMES GABRIEL",');
//    HTML.Add('              ID_GRUPO: 228,');
//    HTML.Add('              GRUPO: "LINHA BRANCA",');
//    HTML.Add('              ID_SUBGRUPO: 62,');
//    HTML.Add('              SUBGRUPO: "LAVADORAS",');
//    HTML.Add('              ID_MARCA: 81,');
//    HTML.Add('              MARCA: "COLORMAQ",');
//    HTML.Add('              QUANTIDADE: 1,');
//    HTML.Add('              PRECO_VENDA: 799,');
//    HTML.Add('              SUBTOTAL: 799 },');
//
//    HTML.Add('            { ID_SAIDA: 2692504,');
//    HTML.Add('              ID_PEDIDO: 5796667,');
//    HTML.Add('              ID_PRODUTO: 21053,');
//    HTML.Add('              PRODUTO: "APARADOR DE PELOS MONDIAL BODY GROOM 06",');
//    HTML.Add('              ID_LOJA: 42,');
//    HTML.Add('              ID_REGIAO: 30,');
//    HTML.Add('              REGIAO: "REGIONAL 04",');
//    HTML.Add('              LOJA: "C.M.42 - CAMAÇARI",');
//    HTML.Add('              ID_VENDEDOR: 943,');
//    HTML.Add('              VENDEDOR: "42 ANDREY NASCIMENTO SILVA",');
//    HTML.Add('              ID_GRUPO: 234,');
//    HTML.Add('              GRUPO: "PORTATEIS",');
//    HTML.Add('              ID_SUBGRUPO: 129,');
//    HTML.Add('              SUBGRUPO: "APARADOR DE PELOS",');
//    HTML.Add('              ID_MARCA: 132,');
//    HTML.Add('              MARCA: "MONDIAL",');
//    HTML.Add('              QUANTIDADE: 1,');
//    HTML.Add('              PRECO_VENDA: 149,');
//    HTML.Add('              SUBTOTAL: 149 },');
//
//    HTML.Add('            { ID_SAIDA: 2692864,');
//    HTML.Add('              ID_PEDIDO: 5796986,');
//    HTML.Add('              ID_PRODUTO: 21972,');
//    HTML.Add('              PRODUTO: "LAVADORA SEMI AUTO COLORMAQ 15KG BRANCA",');
//    HTML.Add('              ID_LOJA: 10,');
//    HTML.Add('              ID_REGIAO: 27,');
//    HTML.Add('              REGIAO: "REGIONAL 02",');
//    HTML.Add('              LOJA: "C.M.10 - UTINGA",');
//    HTML.Add('              ID_VENDEDOR: 318,');
//    HTML.Add('              VENDEDOR: "10 DEISY DIAS DE SOUZA",');
//    HTML.Add('              ID_GRUPO: 228,');
//    HTML.Add('              GRUPO: "LINHA BRANCA",');
//    HTML.Add('              ID_SUBGRUPO: 62,');
//    HTML.Add('              SUBGRUPO: "LAVADORAS",');
//    HTML.Add('              ID_MARCA: 81,');
//    HTML.Add('              MARCA: "COLORMAQ",');
//    HTML.Add('              QUANTIDADE: 1,');
//    HTML.Add('              PRECO_VENDA: 699,');
//    HTML.Add('              SUBTOTAL: 699 }');
//
//    HTML.Add('        ];');
//    HTML.Add('');
//    HTML.Add('		const colorPalette = [');
//    HTML.Add('            ''rgba(255, 99, 132, 0.6)'',  // Red');
//    HTML.Add('            ''rgba(54, 162, 235, 0.6)'',  // Blue');
//    HTML.Add('            ''rgba(173, 216, 230, 0.8)'', // DarkLightBlue');
//    HTML.Add('            ''rgba(128, 0, 128, 0.8)'',   // DarkPurple');
//    HTML.Add('            ''rgba(75, 0, 130, 0.8)''     // DarkIndigo');
//    HTML.Add('        ];');
//    HTML.Add('');
//    HTML.Add('');
//    HTML.Add('        let filteredData = [...mockData];');
//    HTML.Add('        let appliedFilters = { regions: [], stores: [], groups: [], subgroups: [], brands: [], sellers: [] };');
//    HTML.Add('        let currentPage = 1;');
//    HTML.Add('        const itemsPerPage = 10;');
//    HTML.Add('');
//    HTML.Add('        const filtersContainer = document.getElementById("filtersContainer");');
//    HTML.Add('        const totalSalesElement = document.getElementById("totalSales");');
//    HTML.Add('        const averageTicketElement = document.getElementById("averageTicket");');
//    HTML.Add('        const totalOrdersElement = document.getElementById("totalOrders");');
//    HTML.Add('        const salesTable = document.getElementById("tableContent");');
//    HTML.Add('        const paginationContainer = document.getElementById("pagination");');
//    HTML.Add('        const salesByRegionContainer = document.getElementById("salesByRegionContainer");');
//    HTML.Add('        const salesByStoreContainer = document.getElementById("salesByStoreContainer");');
//    HTML.Add('        const salesByGroupContainer = document.getElementById("salesByGroupContainer");');
//    HTML.Add('        const salesBySubgroupContainer = document.getElementById("salesBySubgroupContainer");');
//    HTML.Add('        const salesByBrandContainer = document.getElementById("salesByBrandContainer");');
//    HTML.Add('        const salesBySellerContainer = document.getElementById("salesBySellerContainer");');
//    HTML.Add('        let salesByRegionChart, salesByStoreChart, salesByGroupChart, salesBySubgroupChart, salesByBrandChart, salesBySellerChart;');
//    HTML.Add('');
//    HTML.Add('        const regionColors = {};');
//    HTML.Add('        const storeColors = {};');
//    HTML.Add('        const groupColors = {};');
//    HTML.Add('        const subgroupColors = {};');
//    HTML.Add('        const brandColors = {};');
//    HTML.Add('        const sellerColors = {};');
//    HTML.Add('');
//    HTML.Add('        function log(message, data) {');
//    HTML.Add('            if (iflog) {');
//    HTML.Add('                console.log(message, data);');
//    HTML.Add('            }');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        function getColor(index) {');
//    HTML.Add('            return colorPalette[index % colorPalette.length];');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        function updateFiltersUI() {');
//    HTML.Add('            filtersContainer.innerHTML = '''';');
//    HTML.Add('            Object.keys(appliedFilters).forEach(filterType => {');
//    HTML.Add('                appliedFilters[filterType].forEach(filter => {');
//    HTML.Add('                    const filterLabel = getFilterLabel(filterType, filter);');
//    HTML.Add('                    const filterItem = document.createElement("div");');
//    HTML.Add('                    filterItem.className = "filter-item";');
//    HTML.Add('                    filterItem.textContent = filterLabel;');
//    HTML.Add('                    const removeIcon = document.createElement("span");');
//    HTML.Add('                    removeIcon.textContent = "x";');
//    HTML.Add('                    removeIcon.onclick = () => {');
//    HTML.Add('                        appliedFilters[filterType] = appliedFilters[filterType].filter(item => item !== filter);');
//    HTML.Add('                        updateDashboard();');
//    HTML.Add('                    };');
//    HTML.Add('                    filterItem.appendChild(removeIcon);');
//    HTML.Add('                    filtersContainer.appendChild(filterItem);');
//    HTML.Add('                });');
//    HTML.Add('            });');
//    HTML.Add('            log("Filters UI updated", appliedFilters);');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        function getFilterLabel(filterType, filter) {');
//    HTML.Add('            if (filterType === ''regions'') {');
//    HTML.Add('                return filteredData.find(item => item.ID_REGIAO === filter).REGIAO;');
//    HTML.Add('            } else if (filterType === ''stores'') {');
//    HTML.Add('                return filteredData.find(item => item.ID_LOJA === filter).LOJA;');
//    HTML.Add('            } else if (filterType === ''groups'') {');
//    HTML.Add('                return filteredData.find(item => item.ID_GRUPO === filter).GRUPO;');
//    HTML.Add('            } else if (filterType === ''subgroups'') {');
//    HTML.Add('                return filteredData.find(item => item.ID_SUBGRUPO === filter).SUBGRUPO;');
//    HTML.Add('            } else if (filterType === ''brands'') {');
//    HTML.Add('                return filteredData.find(item => item.ID_MARCA === filter).MARCA;');
//    HTML.Add('            } else if (filterType === ''sellers'') {');
//    HTML.Add('                return filteredData.find(item => item.ID_VENDEDOR === filter).VENDEDOR;');
//    HTML.Add('            }');
//    HTML.Add('            return '''';');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        function updateDashboard() {');
//    HTML.Add('            disableInteractions();');
//    HTML.Add('');
//    HTML.Add('            filteredData = mockData.filter(item =>');
//    HTML.Add('                (appliedFilters.regions.length === 0 || appliedFilters.regions.includes(item.ID_REGIAO)) &&');
//    HTML.Add('                (appliedFilters.stores.length === 0 || appliedFilters.stores.includes(item.ID_LOJA)) &&');
//    HTML.Add('                (appliedFilters.groups.length === 0 || appliedFilters.groups.includes(item.ID_GRUPO)) &&');
//    HTML.Add('                (appliedFilters.subgroups.length === 0 || appliedFilters.subgroups.includes(item.ID_SUBGRUPO)) &&');
//    HTML.Add('                (appliedFilters.brands.length === 0 || appliedFilters.brands.includes(item.ID_MARCA)) &&');
//    HTML.Add('                (appliedFilters.sellers.length === 0 || appliedFilters.sellers.includes(item.ID_VENDEDOR))');
//    HTML.Add('            );');
//    HTML.Add('');
//    HTML.Add('            filteredData.sort((a, b) => b.SUBTOTAL - a.SUBTOTAL);');
//    HTML.Add('');
//    HTML.Add('            updateKPIs();');
//    HTML.Add('            updateCharts();');
//    HTML.Add('            updateTable();');
//    HTML.Add('            updateFiltersUI();');
//    HTML.Add('            updatePagination();');
//    HTML.Add('');
//    HTML.Add('            enableInteractions();');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        function updateKPIs() {');
//    HTML.Add('            const totalSales = filteredData.reduce((sum, item) => sum + item.SUBTOTAL, 0);');
//    HTML.Add('            const averageTicket = totalSales / filteredData.length || 0;');
//    HTML.Add('');
//    HTML.Add('            totalSalesElement.textContent = totalSales.toLocaleString(''pt-BR'', { style: ''currency'', currency: ''BRL'' });');
//    HTML.Add('            averageTicketElement.textContent = averageTicket.toLocaleString(''pt-BR'', { style: ''currency'', currency: ''BRL'' });');
//    HTML.Add('            totalOrdersElement.textContent = filteredData.length;');
//    HTML.Add('');
//    HTML.Add('            log("KPIs updated", { totalSales, averageTicket, totalOrders: filteredData.length });');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        function assignColors(items, colorMap) {');
//    HTML.Add('            items.forEach((item, index) => {');
//    HTML.Add('                if (!colorMap[item]) {');
//    HTML.Add('                    colorMap[item] = getColor(Object.keys(colorMap).length);');
//    HTML.Add('                }');
//    HTML.Add('            });');
//    HTML.Add('            log("Colors assigned", colorMap);');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        function updateCharts() {');
//    HTML.Add('            // Vendas por Região');
//    HTML.Add('            const salesByRegion = filteredData.reduce((acc, item) => {');
//    HTML.Add('                if (!acc[item.ID_REGIAO]) {');
//    HTML.Add('                    acc[item.ID_REGIAO] = { label: item.REGIAO, id: item.ID_REGIAO, value: 0 };');
//    HTML.Add('                }');
//    HTML.Add('                acc[item.ID_REGIAO].value += item.SUBTOTAL;');
//    HTML.Add('                return acc;');
//    HTML.Add('            }, {});');
//    HTML.Add('');
//    HTML.Add('            const regionEntries = Object.values(salesByRegion).sort((a, b) => b.value - a.value);');
//    HTML.Add('            const regionLabels = regionEntries.map(entry => entry.label);');
//    HTML.Add('            const regionData = regionEntries.map(entry => entry.value);');
//    HTML.Add('');
//    HTML.Add('            assignColors(regionLabels, regionColors);');
//    HTML.Add('            const regionColorsArray = regionLabels.map(label => regionColors[label]);');
//    HTML.Add('');
//    HTML.Add('            if (salesByRegionChart) {');
//    HTML.Add('                salesByRegionChart.destroy();');
//    HTML.Add('            }');
//    HTML.Add('');
//    HTML.Add('            const ctxRegion = document.getElementById("salesByRegionChart").getContext("2d");');
//    HTML.Add('');
//    HTML.Add('            salesByRegionChart = new Chart(ctxRegion, {');
//    HTML.Add('                type: ''bar'',');
//    HTML.Add('                data: {');
//    HTML.Add('                    labels: regionLabels,');
//    HTML.Add('                    datasets: [{');
//    HTML.Add('                        label: ''Vendas por Região'',');
//    HTML.Add('                        data: regionData,');
//    HTML.Add('                        backgroundColor: regionColorsArray,');
//    HTML.Add('                    }]');
//    HTML.Add('                },');
//    HTML.Add('                options: {');
//    HTML.Add('                    responsive: true,');
//    HTML.Add('                    maintainAspectRatio: false,');
//    HTML.Add('                    scales: {');
//    HTML.Add('                        x: {');
//    HTML.Add('                            ticks: {');
//    HTML.Add('                                maxRotation: 45,');
//    HTML.Add('                                minRotation: 45,');
//    HTML.Add('                                autoSkip: true');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        y: {');
//    HTML.Add('                            beginAtZero: true');
//    HTML.Add('                        }');
//    HTML.Add('                    },');
//    HTML.Add('                    animation: {');
//    HTML.Add('                        duration: 1000,');
//    HTML.Add('                        easing: ''easeInOutQuad''');
//    HTML.Add('                    },');
//    HTML.Add('                    plugins: {');
//    HTML.Add('                        tooltip: {');
//    HTML.Add('                            callbacks: {');
//    HTML.Add('                                label: function(context) {');
//    HTML.Add('                                    let label = context.dataset.label || '''';');
//    HTML.Add('                                    if (label) {');
//    HTML.Add('                                        label += '': '';');
//    HTML.Add('                                    }');
//    HTML.Add('                                    label += new Intl.NumberFormat(''pt-BR'', { style: ''currency'', currency: ''BRL'' }).format(context.raw);');
//    HTML.Add('                                    return label;');
//    HTML.Add('                                }');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        title: {');
//    HTML.Add('                            display: true,');
//    HTML.Add('                            text: ''Vendas por Região'',');
//    HTML.Add('                            font: {');
//    HTML.Add('                                size: 18');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        legend: {');
//    HTML.Add('                            display: true,');
//    HTML.Add('                            position: ''bottom'',');
//    HTML.Add('                            labels: {');
//    HTML.Add('                                fontSize: 14,');
//    HTML.Add('                                boxWidth: 20');
//    HTML.Add('                            }');
//    HTML.Add('                        }');
//    HTML.Add('                    },');
//    HTML.Add('                    onClick: (e, elements) => {');
//    HTML.Add('                        if (elements.length > 0) {');
//    HTML.Add('                            const index = elements[0].index;');
//    HTML.Add('                            const region = regionEntries[index];');
//    HTML.Add('                            toggleFilter(''regions'', region.id);');
//    HTML.Add('                        }');
//    HTML.Add('                    }');
//    HTML.Add('                }');
//    HTML.Add('            });');
//    HTML.Add('');
//    HTML.Add('            // Vendas por Loja');
//    HTML.Add('            const salesByStore = filteredData.reduce((acc, item) => {');
//    HTML.Add('                if (!acc[item.ID_LOJA]) {');
//    HTML.Add('                    acc[item.ID_LOJA] = { label: item.LOJA, id: item.ID_LOJA, value: 0 };');
//    HTML.Add('                }');
//    HTML.Add('                acc[item.ID_LOJA].value += item.SUBTOTAL;');
//    HTML.Add('                return acc;');
//    HTML.Add('            }, {});');
//    HTML.Add('');
//    HTML.Add('            const storeEntries = Object.values(salesByStore).sort((a, b) => b.value - a.value);');
//    HTML.Add('            const storeLabels = storeEntries.map(entry => entry.label);');
//    HTML.Add('            const storeData = storeEntries.map(entry => entry.value);');
//    HTML.Add('');
//    HTML.Add('            assignColors(storeLabels, storeColors);');
//    HTML.Add('            const storeColorsArray = storeLabels.map(label => storeColors[label]);');
//    HTML.Add('');
//    HTML.Add('            if (salesByStoreChart) {');
//    HTML.Add('                salesByStoreChart.destroy();');
//    HTML.Add('            }');
//    HTML.Add('');
//    HTML.Add('            const ctxStore = document.getElementById("salesByStoreChart").getContext("2d");');
//    HTML.Add('');
//    HTML.Add('            salesByStoreChart = new Chart(ctxStore, {');
//    HTML.Add('                type: ''bar'',');
//    HTML.Add('                data: {');
//    HTML.Add('                    labels: storeLabels,');
//    HTML.Add('                    datasets: [{');
//    HTML.Add('                        label: ''Vendas por Loja'',');
//    HTML.Add('                        data: storeData,');
//    HTML.Add('                        backgroundColor: storeColorsArray,');
//    HTML.Add('                    }]');
//    HTML.Add('                },');
//    HTML.Add('                options: {');
//    HTML.Add('                    responsive: true,');
//    HTML.Add('                    maintainAspectRatio: false,');
//    HTML.Add('                    scales: {');
//    HTML.Add('                        x: {');
//    HTML.Add('                            ticks: {');
//    HTML.Add('                                maxRotation: 45,');
//    HTML.Add('                                minRotation: 45,');
//    HTML.Add('                                autoSkip: true');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        y: {');
//    HTML.Add('                            beginAtZero: true');
//    HTML.Add('                        }');
//    HTML.Add('                    },');
//    HTML.Add('                    animation: {');
//    HTML.Add('                        duration: 1000,');
//    HTML.Add('                        easing: ''easeInOutQuad''');
//    HTML.Add('                    },');
//    HTML.Add('                    plugins: {');
//    HTML.Add('                        tooltip: {');
//    HTML.Add('                            callbacks: {');
//    HTML.Add('                                label: function(context) {');
//    HTML.Add('                                    let label = context.dataset.label || '''';');
//    HTML.Add('                                    if (label) {');
//    HTML.Add('                                        label += '': '';');
//    HTML.Add('                                    }');
//    HTML.Add('                                    label += new Intl.NumberFormat(''pt-BR'', { style: ''currency'', currency: ''BRL'' }).format(context.raw);');
//    HTML.Add('                                    return label;');
//    HTML.Add('                                }');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        title: {');
//    HTML.Add('                            display: true,');
//    HTML.Add('                            text: ''Vendas por Loja'',');
//    HTML.Add('                            font: {');
//    HTML.Add('                                size: 18');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        legend: {');
//    HTML.Add('                            display: true,');
//    HTML.Add('                            position: ''bottom'',');
//    HTML.Add('                            labels: {');
//    HTML.Add('                                fontSize: 14,');
//    HTML.Add('                                boxWidth: 20');
//    HTML.Add('                            }');
//    HTML.Add('                        }');
//    HTML.Add('                    },');
//    HTML.Add('                    onClick: (e, elements) => {');
//    HTML.Add('                        if (elements.length > 0) {');
//    HTML.Add('                            const index = elements[0].index;');
//    HTML.Add('                            const store = storeEntries[index];');
//    HTML.Add('                            toggleFilter(''stores'', store.id);');
//    HTML.Add('                        }');
//    HTML.Add('                    }');
//    HTML.Add('                }');
//    HTML.Add('            });');
//    HTML.Add('');
//    HTML.Add('            // Vendas por Grupo');
//    HTML.Add('            const salesByGroup = filteredData.reduce((acc, item) => {');
//    HTML.Add('                if (!acc[item.ID_GRUPO]) {');
//    HTML.Add('                    acc[item.ID_GRUPO] = { label: item.GRUPO, id: item.ID_GRUPO, value: 0 };');
//    HTML.Add('                }');
//    HTML.Add('                acc[item.ID_GRUPO].value += item.SUBTOTAL;');
//    HTML.Add('                return acc;');
//    HTML.Add('            }, {});');
//    HTML.Add('');
//    HTML.Add('            const groupEntries = Object.values(salesByGroup).sort((a, b) => b.value - a.value);');
//    HTML.Add('            const groupLabels = groupEntries.map(entry => entry.label);');
//    HTML.Add('            const groupData = groupEntries.map(entry => entry.value);');
//    HTML.Add('');
//    HTML.Add('            assignColors(groupLabels, groupColors);');
//    HTML.Add('            const groupColorsArray = groupLabels.map(label => groupColors[label]);');
//    HTML.Add('');
//    HTML.Add('            if (salesByGroupChart) {');
//    HTML.Add('                salesByGroupChart.destroy();');
//    HTML.Add('            }');
//    HTML.Add('');
//    HTML.Add('            const ctxGroup = document.getElementById("salesByGroupChart").getContext("2d");');
//    HTML.Add('');
//    HTML.Add('            salesByGroupChart = new Chart(ctxGroup, {');
//    HTML.Add('                type: ''pie'',');
//    HTML.Add('                data: {');
//    HTML.Add('                    labels: groupLabels,');
//    HTML.Add('                    datasets: [{');
//    HTML.Add('                        data: groupData,');
//    HTML.Add('                        backgroundColor: groupColorsArray,');
//    HTML.Add('                    }]');
//    HTML.Add('                },');
//    HTML.Add('                options: {');
//    HTML.Add('                    responsive: true,');
//    HTML.Add('                    maintainAspectRatio: false,');
//    HTML.Add('                    animation: {');
//    HTML.Add('                        duration: 1000,');
//    HTML.Add('                        easing: ''easeInOutQuad''');
//    HTML.Add('                    },');
//    HTML.Add('                    plugins: {');
//    HTML.Add('                        tooltip: {');
//    HTML.Add('                            callbacks: {');
//    HTML.Add('                                label: function(context) {');
//    HTML.Add('                                    let label = context.label || '''';');
//    HTML.Add('                                    if (label) {');
//    HTML.Add('                                        label += '': '';');
//    HTML.Add('                                    }');
//    HTML.Add('                                    label += new Intl.NumberFormat(''pt-BR'', { style: ''currency'', currency: ''BRL'' }).format(context.raw);');
//    HTML.Add('                                    return label;');
//    HTML.Add('                                }');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        legend: {');
//    HTML.Add('                            display: true,');
//    HTML.Add('                            position: ''bottom'',');
//    HTML.Add('                            labels: {');
//    HTML.Add('                                fontSize: 14,');
//    HTML.Add('                                boxWidth: 20');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        title: {');
//    HTML.Add('                            display: true,');
//    HTML.Add('                            text: ''Vendas por Grupo'',');
//    HTML.Add('                            font: {');
//    HTML.Add('                                size: 18');
//    HTML.Add('                            }');
//    HTML.Add('                        }');
//    HTML.Add('                    },');
//    HTML.Add('                    onClick: (e, elements) => {');
//    HTML.Add('                        if (elements.length > 0) {');
//    HTML.Add('                            const index = elements[0].index;');
//    HTML.Add('                            const group = groupEntries[index];');
//    HTML.Add('                            toggleFilter(''groups'', group.id);');
//    HTML.Add('                        }');
//    HTML.Add('                    }');
//    HTML.Add('                }');
//    HTML.Add('            });');
//    HTML.Add('');
//    HTML.Add('            // Vendas por Subgrupo');
//    HTML.Add('            const salesBySubgroup = filteredData.reduce((acc, item) => {');
//    HTML.Add('                if (!acc[item.ID_SUBGRUPO]) {');
//    HTML.Add('                    acc[item.ID_SUBGRUPO] = { label: item.SUBGRUPO, id: item.ID_SUBGRUPO, value: 0 };');
//    HTML.Add('                }');
//    HTML.Add('                acc[item.ID_SUBGRUPO].value += item.SUBTOTAL;');
//    HTML.Add('                return acc;');
//    HTML.Add('            }, {});');
//    HTML.Add('');
//    HTML.Add('            const subgroupEntries = Object.values(salesBySubgroup).sort((a, b) => b.value - a.value);');
//    HTML.Add('            const subgroupLabels = subgroupEntries.map(entry => entry.label);');
//    HTML.Add('            const subgroupData = subgroupEntries.map(entry => entry.value);');
//    HTML.Add('');
//    HTML.Add('            assignColors(subgroupLabels, subgroupColors);');
//    HTML.Add('            const subgroupColorsArray = subgroupLabels.map(label => subgroupColors[label]);');
//    HTML.Add('');
//    HTML.Add('            if (salesBySubgroupChart) {');
//    HTML.Add('                salesBySubgroupChart.destroy();');
//    HTML.Add('            }');
//    HTML.Add('');
//    HTML.Add('            const ctxSubgroup = document.getElementById("salesBySubgroupChart").getContext("2d");');
//    HTML.Add('');
//    HTML.Add('            salesBySubgroupChart = new Chart(ctxSubgroup, {');
//    HTML.Add('                type: ''pie'',');
//    HTML.Add('                data: {');
//    HTML.Add('                    labels: subgroupLabels,');
//    HTML.Add('                    datasets: [{');
//    HTML.Add('                        data: subgroupData,');
//    HTML.Add('                        backgroundColor: subgroupColorsArray,');
//    HTML.Add('                    }]');
//    HTML.Add('                },');
//    HTML.Add('                options: {');
//    HTML.Add('                    responsive: true,');
//    HTML.Add('                    maintainAspectRatio: false,');
//    HTML.Add('                    animation: {');
//    HTML.Add('                        duration: 1000,');
//    HTML.Add('                        easing: ''easeInOutQuad''');
//    HTML.Add('                    },');
//    HTML.Add('                    plugins: {');
//    HTML.Add('                        tooltip: {');
//    HTML.Add('                            callbacks: {');
//    HTML.Add('                                label: function(context) {');
//    HTML.Add('                                    let label = context.label || '''';');
//    HTML.Add('                                    if (label) {');
//    HTML.Add('                                        label += '': '';');
//    HTML.Add('                                    }');
//    HTML.Add('                                    label += new Intl.NumberFormat(''pt-BR'', { style: ''currency'', currency: ''BRL'' }).format(context.raw);');
//    HTML.Add('                                    return label;');
//    HTML.Add('                                }');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        legend: {');
//    HTML.Add('                            display: true,');
//    HTML.Add('                            position: ''bottom'',');
//    HTML.Add('                            labels: {');
//    HTML.Add('                                fontSize: 14,');
//    HTML.Add('                                boxWidth: 20');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        title: {');
//    HTML.Add('                            display: true,');
//    HTML.Add('                            text: ''Vendas por Subgrupo'',');
//    HTML.Add('                            font: {');
//    HTML.Add('                                size: 18');
//    HTML.Add('                            }');
//    HTML.Add('                        }');
//    HTML.Add('                    },');
//    HTML.Add('                    onClick: (e, elements) => {');
//    HTML.Add('                        if (elements.length > 0) {');
//    HTML.Add('                            const index = elements[0].index;');
//    HTML.Add('                            const subgroup = subgroupEntries[index];');
//    HTML.Add('                            toggleFilter(''subgroups'', subgroup.id);');
//    HTML.Add('                        }');
//    HTML.Add('                    }');
//    HTML.Add('                }');
//    HTML.Add('            });');
//    HTML.Add('');
//    HTML.Add('            // Vendas por Marca');
//    HTML.Add('            const salesByBrand = filteredData.reduce((acc, item) => {');
//    HTML.Add('                if (!acc[item.ID_MARCA]) {');
//    HTML.Add('                    acc[item.ID_MARCA] = { label: item.MARCA, id: item.ID_MARCA, value: 0 };');
//    HTML.Add('                }');
//    HTML.Add('                acc[item.ID_MARCA].value += item.SUBTOTAL;');
//    HTML.Add('                return acc;');
//    HTML.Add('            }, {});');
//    HTML.Add('');
//    HTML.Add('            const brandEntries = Object.values(salesByBrand);');
//    HTML.Add('            const brandLabels = brandEntries.map(entry => entry.label);');
//    HTML.Add('            const brandData = brandEntries.map(entry => entry.value);');
//    HTML.Add('');
//    HTML.Add('            assignColors(brandLabels, brandColors);');
//    HTML.Add('            const brandColorsArray = brandLabels.map(label => brandColors[label]);');
//    HTML.Add('');
//    HTML.Add('            if (salesByBrandChart) {');
//    HTML.Add('                salesByBrandChart.destroy();');
//    HTML.Add('            }');
//    HTML.Add('');
//    HTML.Add('            const ctxBrand = document.getElementById("salesByBrandChart").getContext("2d");');
//    HTML.Add('');
//    HTML.Add('            salesByBrandChart = new Chart(ctxBrand, {');
//    HTML.Add('                type: ''pie'',');
//    HTML.Add('                data: {');
//    HTML.Add('                    labels: brandLabels,');
//    HTML.Add('                    datasets: [{');
//    HTML.Add('                        data: brandData,');
//    HTML.Add('                        backgroundColor: brandColorsArray,');
//    HTML.Add('                    }]');
//    HTML.Add('                },');
//    HTML.Add('                options: {');
//    HTML.Add('                    responsive: true,');
//    HTML.Add('                    maintainAspectRatio: false,');
//    HTML.Add('                    animation: {');
//    HTML.Add('                        duration: 1000,');
//    HTML.Add('                        easing: ''easeInOutQuad''');
//    HTML.Add('                    },');
//    HTML.Add('                    plugins: {');
//    HTML.Add('                        tooltip: {');
//    HTML.Add('                            callbacks: {');
//    HTML.Add('                                label: function(context) {');
//    HTML.Add('                                    let label = context.label || '''';');
//    HTML.Add('                                    if (label) {');
//    HTML.Add('                                        label += '': '';');
//    HTML.Add('                                    }');
//    HTML.Add('                                    label += new Intl.NumberFormat(''pt-BR'', { style: ''currency'', currency: ''BRL'' }).format(context.raw);');
//    HTML.Add('                                    return label;');
//    HTML.Add('                                }');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        legend: {');
//    HTML.Add('                            display: true,');
//    HTML.Add('                            position: ''bottom'',');
//    HTML.Add('                            labels: {');
//    HTML.Add('                                fontSize: 14,');
//    HTML.Add('                                boxWidth: 20');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        title: {');
//    HTML.Add('                            display: true,');
//    HTML.Add('                            text: ''Vendas por Marca'',');
//    HTML.Add('                            font: {');
//    HTML.Add('                                size: 18');
//    HTML.Add('                            }');
//    HTML.Add('                        }');
//    HTML.Add('                    },');
//    HTML.Add('                    onClick: (e, elements) => {');
//    HTML.Add('                        if (elements.length > 0) {');
//    HTML.Add('                            const index = elements[0].index;');
//    HTML.Add('                            const brand = brandEntries[index];');
//    HTML.Add('                            toggleFilter(''brands'', brand.id);');
//    HTML.Add('                        }');
//    HTML.Add('                    }');
//    HTML.Add('                }');
//    HTML.Add('            });');
//    HTML.Add('');
//    HTML.Add('            // Vendas por Vendedor');
//    HTML.Add('            const salesBySeller = filteredData.reduce((acc, item) => {');
//    HTML.Add('                if (!acc[item.ID_VENDEDOR]) {');
//    HTML.Add('                    acc[item.ID_VENDEDOR] = { label: item.VENDEDOR, id: item.ID_VENDEDOR, value: 0 };');
//    HTML.Add('                }');
//    HTML.Add('                acc[item.ID_VENDEDOR].value += item.SUBTOTAL;');
//    HTML.Add('                return acc;');
//    HTML.Add('            }, {});');
//    HTML.Add('');
//    HTML.Add('            const sellerEntries = Object.values(salesBySeller).sort((a, b) => b.value - a.value);');
//    HTML.Add('            const sellerLabels = sellerEntries.map(entry => entry.label);');
//    HTML.Add('            const sellerData = sellerEntries.map(entry => entry.value);');
//    HTML.Add('');
//    HTML.Add('            assignColors(sellerLabels, sellerColors);');
//    HTML.Add('            const sellerColorsArray = sellerLabels.map(label => sellerColors[label]);');
//    HTML.Add('');
//    HTML.Add('            if (salesBySellerChart) {');
//    HTML.Add('                salesBySellerChart.destroy();');
//    HTML.Add('            }');
//    HTML.Add('');
//    HTML.Add('            const ctxSeller = document.getElementById("salesBySellerChart").getContext("2d");');
//    HTML.Add('');
//    HTML.Add('            salesBySellerChart = new Chart(ctxSeller, {');
//    HTML.Add('                type: ''bar'',');
//    HTML.Add('                data: {');
//    HTML.Add('                    labels: sellerLabels,');
//    HTML.Add('                    datasets: [{');
//    HTML.Add('                        label: ''Vendas por Vendedor'',');
//    HTML.Add('                        data: sellerData,');
//    HTML.Add('                        backgroundColor: sellerColorsArray,');
//    HTML.Add('                    }]');
//    HTML.Add('                },');
//    HTML.Add('                options: {');
//    HTML.Add('                    responsive: true,');
//    HTML.Add('                    maintainAspectRatio: false,');
//    HTML.Add('                    scales: {');
//    HTML.Add('                        x: {');
//    HTML.Add('                            ticks: {');
//    HTML.Add('                                maxRotation: 45,');
//    HTML.Add('                                minRotation: 45,');
//    HTML.Add('                                autoSkip: true');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        y: {');
//    HTML.Add('                            beginAtZero: true');
//    HTML.Add('                        }');
//    HTML.Add('                    },');
//    HTML.Add('                    animation: {');
//    HTML.Add('                        duration: 1000,');
//    HTML.Add('                        easing: ''easeInOutQuad''');
//    HTML.Add('                    },');
//    HTML.Add('                    plugins: {');
//    HTML.Add('                        tooltip: {');
//    HTML.Add('                            callbacks: {');
//    HTML.Add('                                label: function(context) {');
//    HTML.Add('                                    let label = context.dataset.label || '''';');
//    HTML.Add('                                    if (label) {');
//    HTML.Add('                                        label += '': '';');
//    HTML.Add('                                    }');
//    HTML.Add('                                    label += new Intl.NumberFormat(''pt-BR'', { style: ''currency'', currency: ''BRL'' }).format(context.raw);');
//    HTML.Add('                                    return label;');
//    HTML.Add('                                }');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        title: {');
//    HTML.Add('                            display: true,');
//    HTML.Add('                            text: ''Vendas por Vendedor'',');
//    HTML.Add('                            font: {');
//    HTML.Add('                                size: 18');
//    HTML.Add('                            }');
//    HTML.Add('                        },');
//    HTML.Add('                        legend: {');
//    HTML.Add('                            display: true,');
//    HTML.Add('                            position: ''bottom'',');
//    HTML.Add('                            labels: {');
//    HTML.Add('                                fontSize: 14,');
//    HTML.Add('                                boxWidth: 20');
//    HTML.Add('                            }');
//    HTML.Add('                        }');
//    HTML.Add('                    },');
//    HTML.Add('                    onClick: (e, elements) => {');
//    HTML.Add('                        if (elements.length > 0) {');
//    HTML.Add('                            const index = elements[0].index;');
//    HTML.Add('                            const seller = sellerEntries[index];');
//    HTML.Add('                            toggleFilter(''sellers'', seller.id);');
//    HTML.Add('                        }');
//    HTML.Add('                    }');
//    HTML.Add('                }');
//    HTML.Add('            });');
//    HTML.Add('');
//    HTML.Add('            log("Charts updated", { salesByRegion, salesByStore, salesByGroup, salesBySubgroup, salesByBrand, salesBySeller });');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        function toggleFilter(type, id) {');
//    HTML.Add('            if (appliedFilters[type].includes(id)) {');
//    HTML.Add('                appliedFilters[type] = appliedFilters[type].filter(item => item !== id);');
//    HTML.Add('            } else {');
//    HTML.Add('                appliedFilters[type].push(id);');
//    HTML.Add('            }');
//    HTML.Add('            log("Filter toggled", { type, id, appliedFilters });');
//    HTML.Add('            updateDashboard();');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        function updateTable() {');
//    HTML.Add('            salesTable.innerHTML = '''';');
//    HTML.Add('');
//    HTML.Add('            const start = (currentPage - 1) * itemsPerPage;');
//    HTML.Add('            const end = start + itemsPerPage;');
//    HTML.Add('            const paginatedData = filteredData.slice(start, end);');
//    HTML.Add('');
//    HTML.Add('            paginatedData.forEach(item => {');
//    HTML.Add('                const row = document.createElement("tr");');
//    HTML.Add('                row.innerHTML = `');
//    HTML.Add('                    <td>${item.ID_PEDIDO}</td>');
//    HTML.Add('                    <td>${item.PRODUTO}</td>');
//    HTML.Add('                    <td>${item.MARCA}</td>');
//    HTML.Add('                    <td style="text-align: right;">${item.QUANTIDADE}</td>');
//    HTML.Add('                    <td style="text-align: right;">${item.PRECO_VENDA.toLocaleString(''pt-BR'', { style: ''currency'', currency: ''BRL'' })}</td>');
//    HTML.Add('                    <td style="text-align: right;">${item.SUBTOTAL.toLocaleString(''pt-BR'', { style: ''currency'', currency: ''BRL'' })}</td>');
//    HTML.Add('                `;');
//    HTML.Add('                salesTable.appendChild(row);');
//    HTML.Add('            });');
//    HTML.Add('');
//    HTML.Add('            log("Table updated", paginatedData);');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        function updatePagination() {');
//    HTML.Add('            paginationContainer.innerHTML = '''';');
//    HTML.Add('');
//    HTML.Add('            const totalPages = Math.ceil(filteredData.length / itemsPerPage);');
//    HTML.Add('            for (let i = 1; i <= totalPages; i++) {');
//    HTML.Add('                const button = document.createElement("button");');
//    HTML.Add('                button.textContent = i;');
//    HTML.Add('                if (i === currentPage) {');
//    HTML.Add('                    button.classList.add(''disabled'');');
//    HTML.Add('                }');
//    HTML.Add('                button.addEventListener(''click'', () => {');
//    HTML.Add('                    currentPage = i;');
//    HTML.Add('                    updateTable();');
//    HTML.Add('                    updatePagination();');
//    HTML.Add('                });');
//    HTML.Add('                paginationContainer.appendChild(button);');
//    HTML.Add('            }');
//    HTML.Add('');
//    HTML.Add('            log("Pagination updated", { currentPage, totalPages });');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        document.getElementById("exportButton").addEventListener("click", () => {');
//    HTML.Add('            const csvData = [];');
//    HTML.Add('            csvData.push(["ID Pedido", "Produto", "Marca", "Quantidade", "Preço de Venda", "Subtotal"]);');
//    HTML.Add('            filteredData.forEach(item => {');
//    HTML.Add('                csvData.push([');
//    HTML.Add('                    item.ID_PEDIDO,');
//    HTML.Add('                    item.PRODUTO,');
//    HTML.Add('                    item.MARCA,');
//    HTML.Add('                    item.QUANTIDADE,');
//    HTML.Add('                    item.PRECO_VENDA,');
//    HTML.Add('                    item.SUBTOTAL');
//    HTML.Add('                ]);');
//    HTML.Add('            });');
//    HTML.Add('            const csvContent = "data:text/csv;charset=utf-8,"');
//    HTML.Add('                + csvData.map(e => e.join(",")).join("\n");');
//    HTML.Add('            const encodedUri = encodeURI(csvContent);');
//    HTML.Add('            const link = document.createElement("a");');
//    HTML.Add('            link.setAttribute("href", encodedUri);');
//    HTML.Add('            link.setAttribute("download", "dados_vendas.csv");');
//    HTML.Add('            document.body.appendChild(link);');
//    HTML.Add('            link.click();');
//    HTML.Add('');
//    HTML.Add('            log("Data exported", csvData);');
//    HTML.Add('        });');
//    HTML.Add('');
//    HTML.Add('        async function fetchData() {');
//    HTML.Add('            try {');
//    HTML.Add('                const response = await fetch(''url_to_your_data_endpoint''); // Substitua pelo URL da sua API');
//    HTML.Add('                const data = await response.json();');
//    HTML.Add('                mockData = data; // Atualize os dados mock com os dados reais');
//    HTML.Add('                updateDashboard();');
//    HTML.Add('            } catch (error) {');
//    HTML.Add('                console.error(''Error fetching data:'', error);');
//    HTML.Add('            }');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        function disableInteractions() {');
//    HTML.Add('            document.querySelectorAll(''.chart-container'').forEach(container => {');
//    HTML.Add('                container.style.pointerEvents = ''none'';');
//    HTML.Add('            });');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        function enableInteractions() {');
//    HTML.Add('            document.querySelectorAll(''.chart-container'').forEach(container => {');
//    HTML.Add('                container.style.pointerEvents = ''auto'';');
//    HTML.Add('            });');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        // Inicializar gráficos vazios');
//    HTML.Add('        function initializeCharts() {');
//    HTML.Add('            salesByRegionChart = new Chart(document.getElementById("salesByRegionChart").getContext("2d"), {');
//    HTML.Add('                type: ''bar'',');
//    HTML.Add('                data: { labels: [], datasets: [{ label: ''Vendas por Região'', data: [], backgroundColor: [] }] },');
//    HTML.Add('                options: { responsive: true, maintainAspectRatio: false }');
//    HTML.Add('            });');
//    HTML.Add('            salesByStoreChart = new Chart(document.getElementById("salesByStoreChart").getContext("2d"), {');
//    HTML.Add('                type: ''bar'',');
//    HTML.Add('                data: { labels: [], datasets: [{ label: ''Vendas por Loja'', data: [], backgroundColor: [] }] },');
//    HTML.Add('                options: { responsive: true, maintainAspectRatio: false }');
//    HTML.Add('            });');
//    HTML.Add('            salesByGroupChart = new Chart(document.getElementById("salesByGroupChart").getContext("2d"), {');
//    HTML.Add('                type: ''pie'',');
//    HTML.Add('                data: { labels: [], datasets: [{ data: [], backgroundColor: [] }] },');
//    HTML.Add('                options: { responsive: true, maintainAspectRatio: false }');
//    HTML.Add('            });');
//    HTML.Add('            salesBySubgroupChart = new Chart(document.getElementById("salesBySubgroupChart").getContext("2d"), {');
//    HTML.Add('                type: ''pie'',');
//    HTML.Add('                data: { labels: [], datasets: [{ data: [], backgroundColor: [] }] },');
//    HTML.Add('                options: { responsive: true, maintainAspectRatio: false }');
//    HTML.Add('            });');
//    HTML.Add('            salesByBrandChart = new Chart(document.getElementById("salesByBrandChart").getContext("2d"), {');
//    HTML.Add('                type: ''pie'',');
//    HTML.Add('                data: { labels: [], datasets: [{ data: [], backgroundColor: [] }] },');
//    HTML.Add('                options: { responsive: true, maintainAspectRatio: false }');
//    HTML.Add('            });');
//    HTML.Add('            salesBySellerChart = new Chart(document.getElementById("salesBySellerChart").getContext("2d"), {');
//    HTML.Add('                type: ''bar'',');
//    HTML.Add('                data: { labels: [], datasets: [{ label: ''Vendas por Vendedor'', data: [], backgroundColor: [] }] },');
//    HTML.Add('                options: { responsive: true, maintainAspectRatio: false }');
//    HTML.Add('            });');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        // Carregar gráficos inicialmente vazios');
//    HTML.Add('        initializeCharts();');
//    HTML.Add('');
//    HTML.Add('        // Buscar dados e atualizar dashboard');
//    HTML.Add('        fetchData();');
//    HTML.Add('');
//    HTML.Add('        window.addEventListener("resize", () => {');
//    HTML.Add('            updateCharts();');
//    HTML.Add('            log("Window resized", { width: window.innerWidth, height: window.innerHeight });');
//    HTML.Add('        });');
//    HTML.Add('');
//    HTML.Add('        // Simular delay para exibir dados mock (exemplo)');
//    HTML.Add('        setTimeout(() => {');
//    HTML.Add('            updateDashboard();');
//    HTML.Add('        }, 1000);');
//    HTML.Add('    </script>');
//    HTML.Add('</body>');
//    HTML.Add('</html>');
//    HTML.Add('');
//
//    form1.memoLog.Text :=HTML.Text;
//Result := UTF8Encode(HTML.Text);
////    Result := HTML.Text;
//  finally
//    HTML.Free;
//  end;
//end;


//class function THtmlGenerator.GerarHTML: string;
//var
//  HTML: TStringList;
//begin
//  HTML := TStringList.Create;
//  try
////    HTML.Encoding := TEncoding.UTF8;
//
//    // Estrutura principal do HTML
//    HTML.Add(GerarDoctype);
//    HTML.Add('<html lang="pt-BR">');
//
//    // Head completo
//    HTML.Add('<head>');
//    HTML.Add('    <meta charset="UTF-8">');
//    HTML.Add('    <meta name="viewport" content="width=device-width, initial-scale=1.0">');
//    HTML.Add('    <title>Dashboard de Vendas</title>');
//    HTML.Add('    <script src="' + CHART_JS_URL + '"></script>');
//    HTML.Add(GerarEstilos);
//    HTML.Add('</head>');
//
//    // Body
//    HTML.Add('<body>');
//    HTML.Add('    <main role="main">');
//
//    // Conteúdo principal
//    HTML.Add('        ' + GerarHeader);
//    HTML.Add('        ' + GerarNavFiltros);
//    HTML.Add('        ' + GerarSecaoKPIs);
//    HTML.Add('        ' + GerarSecaoGraficos);
//    HTML.Add('        ' + GerarSecaoTabela);
//    HTML.Add('        ' + GerarSecaoPaginacao);
//    HTML.Add('        ' + GerarBotaoExportar);
//
//    HTML.Add('    </main>');
//
//    // Scripts unificados
//    HTML.Add('    <script>');
//    HTML.Add('        const iflog = true;');
//    HTML.Add('');
//    HTML.Add('        let filteredData = [...mockData];');
//    HTML.Add('        let appliedFilters = { regions: [], stores: [], groups: [], subgroups: [], brands: [], sellers: [] };');
//    HTML.Add('        let currentPage = 1;');
//    HTML.Add('        const itemsPerPage = 10;');
//    HTML.Add('    </script>');
//
//    // Constantes e dados mock
//    HTML.Add('    <script>');
//    HTML.Add(GerarScriptConstantes);
//    HTML.Add('    </script>');
//
//    // Funções principais
//    HTML.Add('    <script>');
//    HTML.Add(GerarScriptFuncoes);
//    HTML.Add('    </script>');
//
//    // Eventos
//    HTML.Add('    <script>');
//    HTML.Add(GerarScriptEventos);
//    HTML.Add('    </script>');
//
//    // Inicialização
//    HTML.Add('    <script>');
//    HTML.Add('        const filtersContainer = document.getElementById("filtersContainer");');
//    HTML.Add('        const totalSalesElement = document.getElementById("totalSales");');
//    HTML.Add('        const averageTicketElement = document.getElementById("averageTicket");');
//    HTML.Add('        const totalOrdersElement = document.getElementById("totalOrders");');
//    HTML.Add('        const salesTable = document.getElementById("tableContent");');
//    HTML.Add('        const paginationContainer = document.getElementById("pagination");');
//    HTML.Add('        const salesByRegionContainer = document.getElementById("salesByRegionContainer");');
//    HTML.Add('        const salesByStoreContainer = document.getElementById("salesByStoreContainer");');
//    HTML.Add('        const salesByGroupContainer = document.getElementById("salesByGroupContainer");');
//    HTML.Add('        const salesBySubgroupContainer = document.getElementById("salesBySubgroupContainer");');
//    HTML.Add('        const salesByBrandContainer = document.getElementById("salesByBrandContainer");');
//    HTML.Add('        const salesBySellerContainer = document.getElementById("salesBySellerContainer");');
//    HTML.Add('');
//    HTML.Add('        let salesByRegionChart, salesByStoreChart, salesByGroupChart,');
//    HTML.Add('            salesBySubgroupChart, salesByBrandChart, salesBySellerChart;');
//    HTML.Add('');
//    HTML.Add('        // Inicializar gráficos vazios');
//    HTML.Add('        function initializeCharts() {');
//    HTML.Add('            salesByRegionChart = new Chart(document.getElementById("salesByRegionChart").getContext("2d"), {');
//    HTML.Add('                type: "bar",');
//    HTML.Add('                data: { labels: [], datasets: [{ label: "Vendas por Região", data: [], backgroundColor: [] }] },');
//    HTML.Add('                options: { responsive: true, maintainAspectRatio: false }');
//    HTML.Add('            });');
//    HTML.Add('            salesByStoreChart = new Chart(document.getElementById("salesByStoreChart").getContext("2d"), {');
//    HTML.Add('                type: "bar",');
//    HTML.Add('                data: { labels: [], datasets: [{ label: "Vendas por Loja", data: [], backgroundColor: [] }] },');
//    HTML.Add('                options: { responsive: true, maintainAspectRatio: false }');
//    HTML.Add('            });');
//    HTML.Add('            salesByGroupChart = new Chart(document.getElementById("salesByGroupChart").getContext("2d"), {');
//    HTML.Add('                type: "pie",');
//    HTML.Add('                data: { labels: [], datasets: [{ data: [], backgroundColor: [] }] },');
//    HTML.Add('                options: { responsive: true, maintainAspectRatio: false }');
//    HTML.Add('            });');
//    HTML.Add('            salesBySubgroupChart = new Chart(document.getElementById("salesBySubgroupChart").getContext("2d"), {');
//    HTML.Add('                type: "pie",');
//    HTML.Add('                data: { labels: [], datasets: [{ data: [], backgroundColor: [] }] },');
//    HTML.Add('                options: { responsive: true, maintainAspectRatio: false }');
//    HTML.Add('            });');
//    HTML.Add('            salesByBrandChart = new Chart(document.getElementById("salesByBrandChart").getContext("2d"), {');
//    HTML.Add('                type: "pie",');
//    HTML.Add('                data: { labels: [], datasets: [{ data: [], backgroundColor: [] }] },');
//    HTML.Add('                options: { responsive: true, maintainAspectRatio: false }');
//    HTML.Add('            });');
//    HTML.Add('            salesBySellerChart = new Chart(document.getElementById("salesBySellerChart").getContext("2d"), {');
//    HTML.Add('                type: "bar",');
//    HTML.Add('                data: { labels: [], datasets: [{ label: "Vendas por Vendedor", data: [], backgroundColor: [] }] },');
//    HTML.Add('                options: { responsive: true, maintainAspectRatio: false }');
//    HTML.Add('            });');
//    HTML.Add('        }');
//    HTML.Add('');
//    HTML.Add('        // Carregar gráficos inicialmente vazios');
//    HTML.Add('        initializeCharts();');
//    HTML.Add('');
//    HTML.Add('        // Buscar dados e atualizar dashboard');
//    HTML.Add('        fetchData();');
//    HTML.Add('');
//    HTML.Add('        // Inicialização do Dashboard');
//    HTML.Add('        setTimeout(() => {');
//    HTML.Add('            updateDashboard();');
//    HTML.Add('        }, 1000);');
//    HTML.Add('    </script>');
//
//    HTML.Add('</body>');
//    HTML.Add('</html>');
//
//    Result := HTML.Text;
//  finally
//    HTML.Free;
//  end;
//end;
//class function THtmlGenerator.GerarDoctype: string;
//begin
//  Result := '<!DOCTYPE html>';
//end;
//
//class function THtmlGenerator.GerarMetaTags: string;
//begin
//  Result :=
//    '    <meta charset="UTF-8">' + sLineBreak +
//    '    <meta name="viewport" content="width=device-width, initial-scale=1.0">' + sLineBreak +
//    '    <title>Dashboard de Vendas</title>';
//end;
//
//class function THtmlGenerator.GerarScriptChartJs: string;
//begin
//  Result := Format('    <script src="%s"></script>', [CHART_JS_URL]);
//end;
//
//class function THtmlGenerator.GerarEstilos: string;
//begin
//  Result :=
//    '<style>' + sLineBreak +
//    'body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f0f0f0; color: #333; }' + sLineBreak +
//    'main { max-width: 1200px; margin: 0 auto; background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }' + sLineBreak +
//    'h1 { color: #333; text-align: center; }' + sLineBreak +
//    '.filters { display: flex; gap: 10px; margin-bottom: 20px; justify-content: center; flex-wrap: wrap; }' + sLineBreak +
//    '.kpis { display: flex; justify-content: space-between; margin-bottom: 30px; flex-wrap: nowrap; }' + sLineBreak +
//    '.kpi-card { background-color: #e9ecef; padding: 15px; border-radius: 8px; text-align: center; flex: 1; margin: 10px; min-width: 150px; position: relative; }' + sLineBreak +
//    '.kpi-card h3, .kpi-card p { color: #333; }' + sLineBreak +
//    '.charts { display: flex; gap: 20px; margin-bottom: 30px; flex-wrap: wrap; justify-content: space-around; }' + sLineBreak +
//    '.chart-container { flex: 1 1 45%; min-width: 300px; max-width: 600px; height: 400px; background-color: white; padding: 15px; border-radius: 8px; box-shadow: 0 0 5px rgba(0,0,0,0.1); position: relative; }' + sLineBreak +
//    '.filter-item { background-color: #007bff; color: white; padding: 5px 10px; border-radius: 4px; margin: 5px; cursor: pointer; display: flex; align-items: center; }' + sLineBreak +
//    '.filter-item span { margin-left: 5px; font-weight: bold; cursor: pointer; }' + sLineBreak +
//    'table { width: 100%; border-collapse: separate; border-spacing: 0 10px; font-size: 14px; }' + sLineBreak +
//    'th, td { text-align: left; padding: 10px; }' + sLineBreak +
//    'th { background-color: #007bff; color: white; }' + sLineBreak +
//    'td { background-color: #f8f9fa; border-bottom: 1px solid #ddd; }' + sLineBreak +
//    'th:nth-child(1), td:nth-child(1) { width: 8%; }' + sLineBreak +
//    'th:nth-child(2), td:nth-child(2) { width: 35%; }' + sLineBreak +
//    'th:nth-child(3), td:nth-child(3) { width: 24%; } ' + sLineBreak +
//    'th:nth-child(4), td:nth-child(4) { width: 8%; }' + sLineBreak +
//    'th:nth-child(5), td:nth-child(5) { width: 13%; }' + sLineBreak +
//    'th:nth-child(6), td:nth-child(6) { width: 12%; }' + sLineBreak +
//    'td:nth-child(4), td:nth-child(5), td:nth-child(6) { text-align: right; }' + sLineBreak +
//    '#exportButton { background-color: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; display: block; margin: 20px auto 0; }' + sLineBreak +
//    '#exportButton:hover { background-color: #0056b3; }' + sLineBreak +
//    '.pagination { display: flex; justify-content: center; margin-top: 20px; }' + sLineBreak +
//    '.pagination button { background-color: #007bff; color: white; padding: 5px 10px; border: none; border-radius: 4px; cursor: pointer; margin: 0 5px; }' + sLineBreak +
//    '.pagination button.disabled { background-color: #ddd; cursor: not-allowed; }' + sLineBreak +
//    '@media (max-width: 768px) {' + sLineBreak +
//    '  .kpis { flex-wrap: wrap; }' + sLineBreak +
//    '  .kpi-card { flex: 1 1 100%; max-width: 100%; }' + sLineBreak +
//    '  .charts { flex-direction: column; align-items: center; }' + sLineBreak +
//    '}' + sLineBreak +
//    '</style>';
//end;
//
//class function THtmlGenerator.GerarHeadCompleto: string;
//begin
//  Result :=
//    '<head>' + sLineBreak +
//    GerarMetaTags + sLineBreak +
//    GerarScriptChartJs + sLineBreak +
//    GerarEstilos + sLineBreak +
//    '</head>';
//end;
//
//class function THtmlGenerator.GerarEstruturaMain: string;
//begin
//  Result :=
//    '<main role="main">' + sLineBreak +
//    GerarHeader + sLineBreak +
//    GerarNavFiltros + sLineBreak +
//    GerarSecaoKPIs + sLineBreak +
//    GerarSecaoGraficos + sLineBreak +
//    GerarSecaoTabela + sLineBreak +
//    GerarSecaoPaginacao + sLineBreak +
//    GerarBotaoExportar + sLineBreak +
//    '</main>';
//end;
//
//class function THtmlGenerator.GerarHeader: string;
//begin
//  Result :=
//    '    <header>' + sLineBreak +
//    '        <h1>Dashboard de Vendas</h1>' + sLineBreak +
//    '    </header>';
//end;
//
//class function THtmlGenerator.GerarNavFiltros: string;
//begin
//  Result :=
//    '    <nav class="filters" id="filtersContainer">' + sLineBreak +
//    '        <!-- Filtros aplicados serão exibidos aqui -->' + sLineBreak +
//    '    </nav>';
//end;
//
//class function THtmlGenerator.GerarSecaoKPIs: string;
//begin
//  Result := '<section class="kpis">' + sLineBreak +
//            '<article class="kpi-card" title="Total de Vendas realizadas no período selecionado.">' + sLineBreak +
//            '<h2>Total de Vendas</h2>' + sLineBreak +
//            '<p id="totalSales">R$ 0,00</p>' + sLineBreak +
//            '<div class="tooltip">Total de Vendas realizadas no período selecionado.</div>' + sLineBreak +
//            '</article>' + sLineBreak +
//            '<article class="kpi-card" title="Ticket médio das vendas no período selecionado.">' + sLineBreak +
//            '<h2>Ticket Médio</h2>' + sLineBreak +
//            '<p id="averageTicket">R$ 0,00</p>' + sLineBreak +
//            '<div class="tooltip">Ticket médio das vendas no período selecionado.</div>' + sLineBreak +
//            '</article>' + sLineBreak +
//            '<article class="kpi-card" title="Número total de pedidos realizados no período selecionado.">' + sLineBreak +
//            '<h2>Total de Pedidos</h2>' + sLineBreak +
//            '<p id="totalOrders">0</p>' + sLineBreak +
//            '<div class="tooltip">Número total de pedidos realizados no período selecionado.</div>' + sLineBreak +
//            '</article>' + sLineBreak +
//            '</section>';
//end;
//
//class function THtmlGenerator.GerarSecaoGraficos: string;
//begin
//  Result := '<section class="charts">' + sLineBreak +
//            '<div class="chart-container" id="salesByRegionContainer">' + sLineBreak +
//            '<canvas id="salesByRegionChart"></canvas>' + sLineBreak +
//            '<div class="tooltip">Vendas por Região</div>' + sLineBreak +
//            '</div>' + sLineBreak +
//            '<div class="chart-container" id="salesByStoreContainer">' + sLineBreak +
//            '<canvas id="salesByStoreChart"></canvas>' + sLineBreak +
//            '<div class="tooltip">Vendas por Loja</div>' + sLineBreak +
//            '</div>' + sLineBreak +
//            '<div class="chart-container" id="salesByGroupContainer">' + sLineBreak +
//            '<canvas id="salesByGroupChart"></canvas>' + sLineBreak +
//            '<div class="tooltip">Vendas por Grupo</div>' + sLineBreak +
//            '</div>' + sLineBreak +
//            '<div class="chart-container" id="salesBySubgroupContainer">' + sLineBreak +
//            '<canvas id="salesBySubgroupChart"></canvas>' + sLineBreak +
//            '<div class="tooltip">Vendas por Subgrupo</div>' + sLineBreak +
//            '</div>' + sLineBreak +
//            '<div class="chart-container" id="salesByBrandContainer">' + sLineBreak +
//            '<canvas id="salesByBrandChart"></canvas>' + sLineBreak +
//            '<div class="tooltip">Vendas por Marca</div>' + sLineBreak +
//            '</div>' + sLineBreak +
//            '<div class="chart-container" id="salesBySellerContainer">' + sLineBreak +
//            '<canvas id="salesBySellerChart"></canvas>' + sLineBreak +
//            '<div class="tooltip">Vendas por Vendedor</div>' + sLineBreak +
//            '</div>' + sLineBreak +
//            '</section>';
//end;
//
//
//
//class function THtmlGenerator.GerarSecaoTabela: string;
//begin
//  Result := '<section>' + sLineBreak +
//            '<table>' + sLineBreak +
//            '<thead>' + sLineBreak +
//            '<tr>' + sLineBreak +
//            '<th>ID Pedido</th>' + sLineBreak +
//            '<th>Produto</th>' + sLineBreak +
//            '<th>Fornecedor</th>' + sLineBreak +
//            '<th>Quantidade</th>' + sLineBreak +
//            '<th>Preço de Venda</th>' + sLineBreak +
//            '<th>Subtotal</th>' + sLineBreak +
//            '</tr>' + sLineBreak +
//            '</thead>' + sLineBreak +
//            '<tbody id="tableContent">' + sLineBreak +
//            '<!-- Dados da tabela serão inseridos aqui -->' + sLineBreak +
//            '</tbody>' + sLineBreak +
//            '</table>' + sLineBreak +
//            '</section>';
//end;
//
//
//class function THtmlGenerator.GerarSecaoPaginacao: string;
//begin
//  Result :=
//    '    <section class="pagination" id="pagination">' + sLineBreak +
//    '        <!-- Botões de paginação serão adicionados aqui -->' + sLineBreak +
//    '    </section>';
//end;
//
//class function THtmlGenerator.GerarBotaoExportar: string;
//begin
//  Result := '    <button id="exportButton">Exportar Dados</button>';
//end;
//
//class function THtmlGenerator.GerarScriptVariaveis: string;
//begin
//  Result :=
//    '<script>' + sLineBreak +
//    '    const iflog = true;' + sLineBreak +
//    '' + sLineBreak +
//    '    let filteredData = [...mockData];' + sLineBreak +
//    '    let appliedFilters = { regions: [], stores: [], groups: [], subgroups: [], brands: [], sellers: [] };' + sLineBreak +
//    '    let currentPage = 1;' + sLineBreak +
//    '    const itemsPerPage = 10;' + sLineBreak +
//    '</script>';
//end;
//
//class function THtmlGenerator.GerarScriptConstantes: string;
//begin
//  Result :=
//    '<script>' + sLineBreak +
//    '    const chartOptions = {' + sLineBreak +
//    '        responsive: true,' + sLineBreak +
//    '        maintainAspectRatio: false,' + sLineBreak +
//    '        scales: {' + sLineBreak +
//    '            x: {' + sLineBreak +
//    '                ticks: {' + sLineBreak +
//    '                    maxRotation: 45,' + sLineBreak +
//    '                    minRotation: 45,' + sLineBreak +
//    '                    autoSkip: true' + sLineBreak +
//    '                }' + sLineBreak +
//    '            },' + sLineBreak +
//    '            y: {' + sLineBreak +
//    '                beginAtZero: true' + sLineBreak +
//    '            }' + sLineBreak +
//    '        },' + sLineBreak +
//    '        animation: {' + sLineBreak +
//    '            duration: 1000,' + sLineBreak +
//    '            easing: "easeInOutQuad"' + sLineBreak +
//    '        },' + sLineBreak +
//    '        plugins: {' + sLineBreak +
//    '            tooltip: {' + sLineBreak +
//    '                callbacks: {' + sLineBreak +
//    '                    label: function(context) {' + sLineBreak +
//    '                        let label = context.dataset.label || "";' + sLineBreak +
//    '                        if (label) {' + sLineBreak +
//    '                            label += ": ";' + sLineBreak +
//    '                        }' + sLineBreak +
//    '                        label += new Intl.NumberFormat("pt-BR", { style: "currency", currency: "BRL" }).format(context.raw);' + sLineBreak +
//    '                        return label;' + sLineBreak +
//    '                    }' + sLineBreak +
//    '                }' + sLineBreak +
//    '            },' + sLineBreak +
//    '            title: {' + sLineBreak +
//    '                display: true,' + sLineBreak +
//    '                font: {' + sLineBreak +
//    '                    size: 18' + sLineBreak +
//    '                }' + sLineBreak +
//    '            },' + sLineBreak +
//    '            legend: {' + sLineBreak +
//    '                display: true,' + sLineBreak +
//    '                position: "bottom",' + sLineBreak +
//    '                labels: {' + sLineBreak +
//    '                    fontSize: 14,' + sLineBreak +
//    '                    boxWidth: 20' + sLineBreak +
//    '                }' + sLineBreak +
//    '            }' + sLineBreak +
//    '        }' + sLineBreak +
//    '    };' + sLineBreak +
//    '' + sLineBreak +
//    '    const colorPalette = [' + sLineBreak +
//    '        "rgba(255, 99, 132, 0.6)",  // Red' + sLineBreak +
//    '        "rgba(54, 162, 235, 0.6)",  // Blue' + sLineBreak +
//    '        "rgba(173, 216, 230, 0.8)", // DarkLightBlue' + sLineBreak +
//    '        "rgba(128, 0, 128, 0.8)",   // DarkPurple' + sLineBreak +
//    '        "rgba(75, 0, 130, 0.8)"     // DarkIndigo' + sLineBreak +
//    '    ];' + sLineBreak +
//    '' + sLineBreak +
//    '    const regionColors = {};' + sLineBreak +
//    '    const storeColors = {};' + sLineBreak +
//    '    const groupColors = {};' + sLineBreak +
//    '    const subgroupColors = {};' + sLineBreak +
//    '    const brandColors = {};' + sLineBreak +
//    '    const sellerColors = {};' + sLineBreak +
//    '' + sLineBreak +
//    '    const mockData = [' + sLineBreak +
//    '        { ID_SAIDA: 2692490, ID_PEDIDO: 5796655, ID_PRODUTO: 16572, PRODUTO: "LIQUIDIFICADOR WALITA DAILY VERMELHO", ' +
//    'ID_LOJA: 16, ID_REGIAO: 28, REGIAO: "REGIONAL 03", LOJA: "C.M.16 - RUY BARBOSA", ID_VENDEDOR: 453, ' +
//    'VENDEDOR: "16 GILMAR GONÇALVES DOS SANTOS", ID_GRUPO: 234, GRUPO: "PORTATEIS", ID_SUBGRUPO: 97, ' +
//    'SUBGRUPO: "LIQUIDIFICADORES", ID_MARCA: 101, MARCA: "WALITA", QUANTIDADE: 1, PRECO_VENDA: 299, SUBTOTAL: 299 },' + sLineBreak +
//    '' + sLineBreak +
//    '        { ID_SAIDA: 2692491, ID_PEDIDO: 5796656, ID_PRODUTO: 20285, PRODUTO: "LAVADORA SEMI AUTO COLORMAQ 20KG BRANCO", ' +
//    'ID_LOJA: 26, ID_REGIAO: 30, REGIAO: "REGIONAL 04", LOJA: "C.M.26 - FEIRA DE SANTANA II", ID_VENDEDOR: 972, ' +
//    'VENDEDOR: "26 ELISANGELA GOMES GABRIEL", ID_GRUPO: 228, GRUPO: "LINHA BRANCA", ID_SUBGRUPO: 62, ' +
//    'SUBGRUPO: "LAVADORAS", ID_MARCA: 81, MARCA: "COLORMAQ", QUANTIDADE: 1, PRECO_VENDA: 799, SUBTOTAL: 799 },' + sLineBreak +
//    '' + sLineBreak +
//    '        { ID_SAIDA: 2692504, ID_PEDIDO: 5796667, ID_PRODUTO: 21053, PRODUTO: "APARADOR DE PELOS MONDIAL BODY GROOM 06", ' +
//    'ID_LOJA: 42, ID_REGIAO: 30, REGIAO: "REGIONAL 04", LOJA: "C.M.42 - CAMAÇARI", ID_VENDEDOR: 943, ' +
//    'VENDEDOR: "42 ANDREY NASCIMENTO SILVA", ID_GRUPO: 234, GRUPO: "PORTATEIS", ID_SUBGRUPO: 129, ' +
//    'SUBGRUPO: "APARADOR DE PELOS", ID_MARCA: 132, MARCA: "MONDIAL", QUANTIDADE: 1, PRECO_VENDA: 149, SUBTOTAL: 149 },' + sLineBreak +
//    '' + sLineBreak +
//    '        { ID_SAIDA: 2692864, ID_PEDIDO: 5796986, ID_PRODUTO: 21972, PRODUTO: "LAVADORA SEMI AUTO COLORMAQ 15KG BRANCA", ' +
//    'ID_LOJA: 10, ID_REGIAO: 27, REGIAO: "REGIONAL 02", LOJA: "C.M.10 - UTINGA", ID_VENDEDOR: 318, ' +
//    'VENDEDOR: "10 DEISY DIAS DE SOUZA", ID_GRUPO: 228, GRUPO: "LINHA BRANCA", ID_SUBGRUPO: 62, ' +
//    'SUBGRUPO: "LAVADORAS", ID_MARCA: 81, MARCA: "COLORMAQ", QUANTIDADE: 1, PRECO_VENDA: 699, SUBTOTAL: 699 }' + sLineBreak +
//    '    ];' + sLineBreak +
//    '</script>';
//end;
//
//class function THtmlGenerator.GerarScriptFuncoes: string;
//begin
//  Result := '<script>' + sLineBreak +
//            'function atualizarKPIs() {' + sLineBreak +
//            '  const totalVendas = mockData.reduce((sum, item) => sum + item.SUBTOTAL, 0);' + sLineBreak +
//            '  const ticketMedio = totalVendas / mockData.length || 0;' + sLineBreak +
//            '  const totalPedidos = mockData.length;' + sLineBreak +
//            '  document.getElementById("totalSales").textContent = totalVendas.toLocaleString("pt-BR", { style: "currency", currency: "BRL" });' + sLineBreak +
//            '  document.getElementById("averageTicket").textContent = ticketMedio.toLocaleString("pt-BR", { style: "currency", currency: "BRL" });' + sLineBreak +
//            '  document.getElementById("totalOrders").textContent = totalPedidos;' + sLineBreak +
//            '}' + sLineBreak +
//            'function preencherTabela() {' + sLineBreak +
//            '  const tabela = document.getElementById("tableContent");' + sLineBreak +
//            '  tabela.innerHTML = "";' + sLineBreak +
//            '  mockData.forEach(item => {' + sLineBreak +
//            '    const linha = `<tr>' +
//            '      <td>${item.ID_PEDIDO}</td>' +
//            '      <td>${item.PRODUTO}</td>' +
//            '      <td>${item.MARCA}</td>' +
//            '      <td style="text-align: right;">${item.QUANTIDADE}</td>' +
//            '      <td style="text-align: right;">${item.PRECO_VENDA.toLocaleString("pt-BR", { style: "currency", currency: "BRL" })}</td>' +
//            '      <td style="text-align: right;">${item.SUBTOTAL.toLocaleString("pt-BR", { style: "currency", currency: "BRL" })}</td>' +
//            '    </tr>`;' + sLineBreak +
//            '    tabela.innerHTML += linha;' + sLineBreak +
//            '  });' + sLineBreak +
//            '}' + sLineBreak +
//            'function atualizarGraficos() {' + sLineBreak +
//            '  const salesByRegion = mockData.reduce((acc, item) => {' + sLineBreak +
//            '    if (!acc[item.REGIAO]) {' + sLineBreak +
//            '      acc[item.REGIAO] = 0;' + sLineBreak +
//            '    }' + sLineBreak +
//            '    acc[item.REGIAO] += item.SUBTOTAL;' + sLineBreak +
//            '    return acc;' + sLineBreak +
//            '  }, {});' + sLineBreak +
//            '  const regionLabels = Object.keys(salesByRegion);' + sLineBreak +
//            '  const regionData = Object.values(salesByRegion);' + sLineBreak +
//            '  const ctx = document.getElementById("salesByRegionChart").getContext("2d");' + sLineBreak +
//            '  new Chart(ctx, {' + sLineBreak +
//            '    type: "bar",' + sLineBreak +
//            '    data: {' + sLineBreak +
//            '      labels: regionLabels,' + sLineBreak +
//            '      datasets: [{' + sLineBreak +
//            '        label: "Vendas por Região",' + sLineBreak +
//            '        data: regionData,' + sLineBreak +
//            '        backgroundColor: "rgba(75, 192, 192, 0.2)",' + sLineBreak +
//            '        borderColor: "rgba(75, 192, 192, 1)",' + sLineBreak +
//            '        borderWidth: 1' + sLineBreak +
//            '      }]' + sLineBreak +
//            '    },' + sLineBreak +
//            '    options: {' + sLineBreak +
//            '      scales: {' + sLineBreak +
//            '        y: {' + sLineBreak +
//            '          beginAtZero: true' + sLineBreak +
//            '        }' + sLineBreak +
//            '      }' + sLineBreak +
//            '    }' + sLineBreak +
//            '  });' + sLineBreak +
//            '}' + sLineBreak +
//            'function inicializarDashboard() {' + sLineBreak +
//            '  atualizarKPIs();' + sLineBreak +
//            '  preencherTabela();' + sLineBreak +
//            '  atualizarGraficos();' + sLineBreak +
//            '}' + sLineBreak +
//            'document.addEventListener("DOMContentLoaded", inicializarDashboard);' + sLineBreak +
//            '</script>';
//end;
//
//class function THtmlGenerator.GerarScriptEventos: string;
//begin
//  Result :=
//    '<script>' + sLineBreak +
//    '    document.getElementById("exportButton").addEventListener("click", () => {' + sLineBreak +
//    '        const csvData = [];' + sLineBreak +
//    '        csvData.push(["ID Pedido", "Produto", "Marca", "Quantidade", "Preço de Venda", "Subtotal"]);' + sLineBreak +
//    '        filteredData.forEach(item => {' + sLineBreak +
//    '            csvData.push([' + sLineBreak +
//    '                item.ID_PEDIDO,' + sLineBreak +
//    '                item.PRODUTO,' + sLineBreak +
//    '                item.MARCA,' + sLineBreak +
//    '                item.QUANTIDADE,' + sLineBreak +
//    '                item.PRECO_VENDA,' + sLineBreak +
//    '                item.SUBTOTAL' + sLineBreak +
//    '            ]);' + sLineBreak +
//    '        });' + sLineBreak +
//    '        const csvContent = "data:text/csv;charset=utf-8," + csvData.map(e => e.join(",")).join("\n");' + sLineBreak +
//    '        const encodedUri = encodeURI(csvContent);' + sLineBreak +
//    '        const link = document.createElement("a");' + sLineBreak +
//    '        link.setAttribute("href", encodedUri);' + sLineBreak +
//    '        link.setAttribute("download", "dados_vendas.csv");' + sLineBreak +
//    '        document.body.appendChild(link);' + sLineBreak +
//    '        link.click();' + sLineBreak +
//    '' + sLineBreak +
//    '        log("Data exported", csvData);' + sLineBreak +
//    '    });' + sLineBreak +
//    '' + sLineBreak +
//    '    window.addEventListener("resize", () => {' + sLineBreak +
//    '        updateCharts();' + sLineBreak +
//    '        log("Window resized", { width: window.innerWidth, height: window.innerHeight });' + sLineBreak +
//    '    });' + sLineBreak +
//    '</script>';
//end;
//
//class function THtmlGenerator.GerarScriptInicializacao: string;
//begin
//  Result :=
//    '<script>' + sLineBreak +
//    '    const filtersContainer = document.getElementById("filtersContainer");' + sLineBreak +
//    '    const totalSalesElement = document.getElementById("totalSales");' + sLineBreak +
//    '    const averageTicketElement = document.getElementById("averageTicket");' + sLineBreak +
//    '    const totalOrdersElement = document.getElementById("totalOrders");' + sLineBreak +
//    '' + sLineBreak +
//    '    let salesByRegionChart, salesByStoreChart, salesByGroupChart,' + sLineBreak +
//    '        salesBySubgroupChart, salesByBrandChart, salesBySellerChart;' + sLineBreak +
//    '' + sLineBreak +
//    '    function getColor(index) {' + sLineBreak +
//    '        return colorPalette[index % colorPalette.length];' + sLineBreak +
//    '    }' + sLineBreak +
//    '' + sLineBreak +
//    '    function updateDashboard() {' + sLineBreak +
//    '        disableInteractions();' + sLineBreak +
//    '        filteredData.sort((a, b) => b.SUBTOTAL - a.SUBTOTAL);' + sLineBreak +
//    '        updateKPIs();' + sLineBreak +
//    '        updateCharts();' + sLineBreak +
//    '        updateTable();' + sLineBreak +
//    '        updatePagination();' + sLineBreak +
//    '        enableInteractions();' + sLineBreak +
//    '    }' + sLineBreak +
//    '' + sLineBreak +
//    '    async function fetchData() {' + sLineBreak +
//    '        try {' + sLineBreak +
//    '            // const response = await fetch("url_to_your_data_endpoint");' + sLineBreak +
//    '            // const data = await response.json();' + sLineBreak +
//    '            // mockData = data;' + sLineBreak +
//    '            updateDashboard();' + sLineBreak +
//    '        } catch (error) {' + sLineBreak +
//    '            console.error("Error fetching data:", error);' + sLineBreak +
//    '        }' + sLineBreak +
//    '    }' + sLineBreak +
//    '' + sLineBreak +
//    '    // Inicialização do Dashboard' + sLineBreak +
//    '    setTimeout(() => {' + sLineBreak +
//    '        updateDashboard();' + sLineBreak +
//    '    }, 1000);' + sLineBreak +
//    '</script>';
//end;

end.



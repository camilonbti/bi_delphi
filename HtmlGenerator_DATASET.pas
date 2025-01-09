unit HtmlGenerator_DATASET;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorDataset = class
  public
    class function GerarDataset: string;
  private
    class function GerarDadosVendas: string;
  end;

implementation

class function THtmlGeneratorDataset.GerarDataset: string;
var
  Dataset: TStringList;
begin
  Dataset := TStringList.Create;
  try
    Dataset.Add('        // Dataset de vendas');
    Dataset.Add('        const mockData = ' + GerarDadosVendas + ';');
    Dataset.Add('');
    Dataset.Add('        // Funções auxiliares para manipulação dos dados');
    Dataset.Add('        const dataUtils = {');
    Dataset.Add('            calcularTotalVendas: function() {');
    Dataset.Add('                return mockData.reduce((total, item) => total + item.SUBTOTAL, 0);');
    Dataset.Add('            },');
    Dataset.Add('');
    Dataset.Add('            calcularTicketMedio: function() {');
    Dataset.Add('                const total = this.calcularTotalVendas();');
    Dataset.Add('                return total / mockData.length;');
    Dataset.Add('            },');
    Dataset.Add('');
    Dataset.Add('            calcularTotalPedidos: function() {');
    Dataset.Add('                const pedidosUnicos = new Set(mockData.map(item => item.ID_PEDIDO));');
    Dataset.Add('                return pedidosUnicos.size;');
    Dataset.Add('            },');
    Dataset.Add('');
    Dataset.Add('            agruparPorRegiao: function() {');
    Dataset.Add('                return this.agruparPor("REGIAO", "SUBTOTAL");');
    Dataset.Add('            },');
    Dataset.Add('');
    Dataset.Add('            agruparPorLoja: function() {');
    Dataset.Add('                return this.agruparPor("LOJA", "SUBTOTAL");');
    Dataset.Add('            },');
    Dataset.Add('');
    Dataset.Add('            agruparPorVendedor: function() {');
    Dataset.Add('                return this.agruparPor("VENDEDOR", "SUBTOTAL");');
    Dataset.Add('            },');
    Dataset.Add('');
    Dataset.Add('            agruparPorGrupo: function() {');
    Dataset.Add('                return this.agruparPor("GRUPO", "SUBTOTAL");');
    Dataset.Add('            },');
    Dataset.Add('');
    Dataset.Add('            agruparPorSubgrupo: function() {');
    Dataset.Add('                return this.agruparPor("SUBGRUPO", "SUBTOTAL");');
    Dataset.Add('            },');
    Dataset.Add('');
    Dataset.Add('            agruparPorMarca: function() {');
    Dataset.Add('                return this.agruparPor("MARCA", "SUBTOTAL");');
    Dataset.Add('            },');
    Dataset.Add('');
    Dataset.Add('            agruparPor: function(campo, valorCampo) {');
    Dataset.Add('                const agrupamento = mockData.reduce((acc, item) => {');
    Dataset.Add('                    const chave = item[campo];');
    Dataset.Add('                    if (!acc[chave]) {');
    Dataset.Add('                        acc[chave] = 0;');
    Dataset.Add('                    }');
    Dataset.Add('                    acc[chave] += item[valorCampo];');
    Dataset.Add('                    return acc;');
    Dataset.Add('                }, {});');
    Dataset.Add('');
    Dataset.Add('                return Object.entries(agrupamento).map(([chave, valor]) => ({');
    Dataset.Add('                    label: chave,');
    Dataset.Add('                    value: valor');
    Dataset.Add('                }));');
    Dataset.Add('            },');
    Dataset.Add('');
    Dataset.Add('            filtrarPorPeriodo: function(dataInicio, dataFim) {');
    Dataset.Add('                return mockData.filter(item => {');
    Dataset.Add('                    const data = new Date(item.DATA);');
    Dataset.Add('                    return data >= dataInicio && data <= dataFim;');
    Dataset.Add('                });');
    Dataset.Add('            }');
    Dataset.Add('        };');

    Result := Dataset.Text;
  finally
    Dataset.Free;
  end;
end;

class function THtmlGeneratorDataset.GerarDadosVendas: string;
var
  Dados: TStringList;
begin
  Dados := TStringList.Create;
  try
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
    Dados.Add(']');

    Result := Dados.Text;
  finally
    Dados.Free;
  end;
end;

end.

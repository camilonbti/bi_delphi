unit HTMLDataset;

interface

uses
  System.SysUtils, System.Classes, System.StrUtils;

type
  TChartConfig = record
    CampoAgrupamento: string;  // Campo para agrupar (ex: REGIAO, LOJA)
    CampoCaption: string;      // Campo para exibição (ex: REGIAO, LOJA)
    CampoValor: string;        // Campo para somar (ex: SUBTOTAL)
    Titulo: string;            // Título do gráfico
    ContainerID: string;       // ID do elemento canvas
    TipoGrafico: string;       // Tipo (bar, pie, line)
    Orientacao: string;        // Orientação (vertical/horizontal)
  end;

  THTMLDataset = class
  public
    class function GetMockData: string;
    class function GetScripts(const ChartConfigs: TArray<TChartConfig>): string;
    class function GetDataProcessingFunction: string;
  end;

implementation

class function THTMLDataset.GetDataProcessingFunction: string;
begin
  Result :=
    'function processarDados(data, groupField, captionField, valueField) {' + sLineBreak +
    '  const result = { labels: [], values: [] };' + sLineBreak +
    '  const groupedData = data.reduce((acc, curr) => {' + sLineBreak +
    '    const key = curr[groupField];' + sLineBreak +
    '    const label = curr[captionField];' + sLineBreak +
    '    if (!acc[key]) {' + sLineBreak +
    '      acc[key] = {' + sLineBreak +
    '        label: label,' + sLineBreak +
    '        value: 0' + sLineBreak +
    '      };' + sLineBreak +
    '    }' + sLineBreak +
    '    acc[key].value += curr[valueField];' + sLineBreak +
    '    return acc;' + sLineBreak +
    '  }, {});' + sLineBreak +
    '' + sLineBreak +
    '  Object.keys(groupedData).forEach(key => {' + sLineBreak +
    '    result.labels.push(groupedData[key].label);' + sLineBreak +
    '    result.values.push(groupedData[key].value);' + sLineBreak +
    '  });' + sLineBreak +
    '' + sLineBreak +
    '  return result;' + sLineBreak +
    '}';
end;

class function THTMLDataset.GetScripts(const ChartConfigs: TArray<TChartConfig>): string;
var
  I: Integer;
begin
  // Primeiro adiciona a função processarDados
  Result := GetDataProcessingFunction + sLineBreak + sLineBreak;

  // Depois adiciona o event listener com os gráficos
  Result := Result + 'document.addEventListener("DOMContentLoaded", function() {' + sLineBreak;

  for I := 0 to Length(ChartConfigs) - 1 do
  begin
    Result := Result +
      Format('  const data_%s = processarDados(mockData, "%s", "%s", "%s");', [
        ChartConfigs[I].ContainerID,
        ChartConfigs[I].CampoAgrupamento,
        ChartConfigs[I].CampoCaption,
        ChartConfigs[I].CampoValor
      ]) + sLineBreak +
      Format('  new Chart(document.getElementById("%s").getContext("2d"), {', [ChartConfigs[I].ContainerID]) + sLineBreak +
      Format('    type: "%s",', [ChartConfigs[I].TipoGrafico]) + sLineBreak +
      '    data: {' + sLineBreak +
      Format('      labels: data_%s.labels,', [ChartConfigs[I].ContainerID]) + sLineBreak +
      '      datasets: [{' + sLineBreak +
      Format('        data: data_%s.values,', [ChartConfigs[I].ContainerID]) + sLineBreak +
      '        backgroundColor: "rgba(78, 115, 223, 0.6)",' + sLineBreak +
      '        borderRadius: 4,' + sLineBreak +
      '        maxBarThickness: 50' + sLineBreak +
      '      }]' + sLineBreak +
      '    },' + sLineBreak +
      '    options: {' + sLineBreak +
      '      responsive: true,' + sLineBreak +
      '      maintainAspectRatio: false,' + sLineBreak +
      Format('      indexAxis: "%s",', [IfThen(ChartConfigs[I].Orientacao = 'horizontal', 'y', 'x')]) + sLineBreak +
      '      plugins: {' + sLineBreak +
      Format('        title: { display: true, text: "%s" },', [ChartConfigs[I].Titulo]) + sLineBreak +
      '        legend: { display: false },' + sLineBreak +
      '        tooltip: {' + sLineBreak +
      '          callbacks: {' + sLineBreak +
      '            label: function(context) {' + sLineBreak +
      '              return new Intl.NumberFormat("pt-BR", {' + sLineBreak +
      '                style: "currency",' + sLineBreak +
      '                currency: "BRL"' + sLineBreak +
      '              }).format(context.raw);' + sLineBreak +
      '            }' + sLineBreak +
      '          }' + sLineBreak +
      '        }' + sLineBreak +
      '      },' + sLineBreak +
      '      scales: {' + sLineBreak +
      '        x: { grid: { display: false } },' + sLineBreak +
      '        y: { grid: { display: false } }' + sLineBreak +
      '      }' + sLineBreak +
      '    }' + sLineBreak +
      '  });' + sLineBreak + sLineBreak;
  end;

  Result := Result + '});';
end;

class function THTMLDataset.GetMockData: string;
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

end.

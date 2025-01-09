unit HtmlGenerator_JS_Charts;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorJSCharts = class
  public
    class function GerarCharts: string; // Nome do método corrigido
  end;

implementation

class function THtmlGeneratorJSCharts.GerarCharts: string;
var
  Scripts: TStringList;
begin
  Scripts := TStringList.Create;
  try
    Scripts.Add('// Configuração dos gráficos');
    Scripts.Add('function setupCharts() {');
    Scripts.Add('    setupRegionChart();');
    Scripts.Add('    setupStoreChart();');
    Scripts.Add('    setupGroupChart();');
    Scripts.Add('}');
    Scripts.Add('');
    Scripts.Add('function setupRegionChart() {');
    Scripts.Add('    const ctx = document.getElementById("salesByRegion").getContext("2d");');
    Scripts.Add('    return new Chart(ctx, {');
    Scripts.Add('        type: "bar",');
    Scripts.Add('        data: {');
    Scripts.Add('            labels: [],');
    Scripts.Add('            datasets: [{');
    Scripts.Add('                label: "Vendas por Região",');
    Scripts.Add('                data: [],');
    Scripts.Add('                backgroundColor: []');
    Scripts.Add('            }]');
    Scripts.Add('        },');
    Scripts.Add('        options: {');
    Scripts.Add('            responsive: true,');
    Scripts.Add('            maintainAspectRatio: false');
    Scripts.Add('        }');
    Scripts.Add('    });');
    Scripts.Add('}');
    // Adicione aqui as funções para os outros gráficos

    Result := Scripts.Text;
  finally
    Scripts.Free;
  end;
end;

end.

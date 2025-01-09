unit HtmlGenerator_Base;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorBase = class
  public
    class function GerarCabecalho: string;
    class function GerarFechamento: string;
  end;

implementation

class function THtmlGeneratorBase.GerarCabecalho: string;
var
  HTML: TStringList;
begin
  HTML := TStringList.Create;
  try
    HTML.Add('<!DOCTYPE html>');
    HTML.Add('<html lang="pt-BR">');
    HTML.Add('<head>');
    HTML.Add('    <meta charset="UTF-8">');
    HTML.Add('    <meta name="viewport" content="width=device-width, initial-scale=1.0">');
    HTML.Add('    <title>Dashboard de Vendas</title>');
    HTML.Add('    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>');
    HTML.Add('    <script src="https://cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>');
    HTML.Add('    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>');
    HTML.Add('</head>');
    HTML.Add('<body>');
    HTML.Add('    <main role="main">');

    Result := HTML.Text;
  finally
    HTML.Free;
  end;
end;

class function THtmlGeneratorBase.GerarFechamento: string;
var
  HTML: TStringList;
begin
  HTML := TStringList.Create;
  try
    HTML.Add('    </main>');
    HTML.Add('    <script>');
    HTML.Add('        // Configurações do Chart.js');
    HTML.Add('        Chart.defaults.font.family = "Arial, sans-serif";');
    HTML.Add('        Chart.defaults.color = "#666";');
    HTML.Add('        Chart.defaults.plugins.tooltip.backgroundColor = "rgba(0, 0, 0, 0.8)";');
    HTML.Add('        Chart.defaults.plugins.legend.position = "bottom";');
    HTML.Add('');
    HTML.Add('        // Configuração do Numeral.js');
    HTML.Add('        numeral.locale("pt-br");');
    HTML.Add('        numeral.defaultFormat("0,0.00");');
    HTML.Add('');
    HTML.Add('        // Scripts serão injetados aqui');
    HTML.Add('    </script>');
    HTML.Add('</body>');
    HTML.Add('</html>');

    Result := HTML.Text;
  finally
    HTML.Free;
  end;
end;

end.

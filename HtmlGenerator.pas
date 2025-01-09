unit HtmlGenerator;

interface

uses
  System.Classes, System.SysUtils,
  HtmlGenerator_Base,
  HtmlGenerator_CSS,
  HtmlGenerator_Content,
  HtmlGenerator_JS_Core,
  HtmlGenerator_DATASET,
  HtmlGenerator_Cores;

type
  THtmlGenerator = class
  public
    class function GerarHTML: string;
  end;

implementation

class function THtmlGenerator.GerarHTML: string;
var
  HTML: TStringList;
begin
  HTML := TStringList.Create;
  try
    // Gera a estrutura base do HTML
    HTML.Add(THtmlGeneratorBase.GerarCabecalho);

    // Adiciona os estilos CSS
    HTML.Add(THtmlGeneratorCSS.GerarCSS);

    // Adiciona o conteúdo HTML
    HTML.Add(THtmlGeneratorContent.GerarConteudo);

    // Fecha a estrutura base até o script
    HTML.Add('    </main>');
    HTML.Add('    <script>');

    // Adiciona os dados mockados primeiro
    HTML.Add(THtmlGeneratorDataset.GerarDataset);

    // Adiciona a paleta de cores
    HTML.Add(THtmlGeneratorCores.GerarPaletaCores);

    // Adiciona o código JavaScript core
    HTML.Add(THtmlGeneratorJSCore.GerarJSCore);

    // Fecha os scripts e o HTML
    HTML.Add('    </script>');
    HTML.Add('</body>');
    HTML.Add('</html>');

    Result := HTML.Text;
  finally
    HTML.Free;
  end;
end;

end.

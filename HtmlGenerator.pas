unit HtmlGenerator;

interface

uses
  System.Classes, System.SysUtils, System.IOUtils,
  HtmlGenerator_Content,
  HtmlGenerator_Validator,
  HTML_CSS;

type
  THtmlGenerator = class
  private
    class var FContent: TStringList;
    class procedure Initialize;
    class procedure Finalize;
    class procedure ValidateContent;
    class procedure AddHeader;
    class procedure AddBody;

  public
    class function GerarHTML: string;
  end;

implementation

uses uPrincipal;

class procedure THtmlGenerator.Initialize;
begin
  FContent := TStringList.Create;
  FContent.LineBreak := #13#10;
  FContent.DefaultEncoding := TEncoding.UTF8;
end;

class procedure THtmlGenerator.Finalize;
begin
  FreeAndNil(FContent);
end;

class function THtmlGenerator.GerarHTML: string;
begin
  try
    Initialize;

    // Adiciona as partes do HTML
    AddHeader;
    AddBody;
    AddScripts;

    // Log do HTML antes da validação

    Form1.AddToLog(FContent.Text +#13+ 'HTML gerado antes da validação');

    // Valida o conteúdo
    ValidateContent;

    Result := FContent.Text;
  finally
    Finalize;
  end;
end;


class procedure THtmlGenerator.AddHeader;
begin
  with FContent do
  begin
    Add('<!DOCTYPE html>');
    Add('<html lang="pt-BR">');
    Add('<head>');
    Add('    <meta charset="UTF-8">');
    Add('    <meta name="viewport" content="width=device-width, initial-scale=1.0">');
    Add('    <title>Dashboard de Vendas</title>');
    Add('    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>');
    Add('    <style>');
    Add(THtmlCSS.GetCSS);
    Add('    </style>');
    Add('</head>');
  end;
end;

class procedure THtmlGenerator.AddBody;
begin
  with FContent do
  begin
    Add('<body>');
    Add('    <main role="main">');
    Add(THtmlGeneratorContent.GerarConteudo);
    Add('    </main>');
  end;
end;

class procedure THtmlGenerator.ValidateContent;
begin
  Form1.AddToLog(FContent.Text);

  if not THtmlGeneratorValidator.ValidateHTML(FContent.Text) then
  begin
    Form1.AddToLog(FContent.Text + #13 + 'Validação do HTML falhou');
    raise Exception.Create('HTML gerado é inválido');
  end;
end;

end.

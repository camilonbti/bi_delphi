unit Unit1;

interface

uses
  uHTMLBuilder, System.IOUtils,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls,
  SHDocVw, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    memoLog: TRichEdit;
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AddToLog(const Msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AddToLog(const Msg: string);
var
  LogMessage: string;
begin
  LogMessage := Format('[%s] %s', [FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now), Msg]);
  if memoLog <> nil then
    memoLog.Lines.Add(LogMessage);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  HTML: TStringList;
  HTMLFilePath: string;
begin
  Screen.Cursor := crHourGlass;
  try
    // Cria e configura o StringList
    HTML := TStringList.Create;
    try
      HTML.DefaultEncoding := TEncoding.UTF8;

      // Gera o HTML básico com os dados mock
      with THTMLBuilder.Create do
      try
        HTML.Text := GerarHTML;
        AddToLog('HTML gerado com sucesso');
        AddToLog(HTML.Text);


        // Salva no diretório da aplicação
        HTMLFilePath := ExtractFilePath(ParamStr(0)) + 'dashboard.html';
        HTML.SaveToFile(HTMLFilePath);
        AddToLog('Arquivo salvo: ' + HTMLFilePath);

        // Carrega no navegador
        WebBrowser1.Navigate('file:///' + StringReplace(HTMLFilePath, '\', '/', [rfReplaceAll]));
      finally
        Free;
      end;

    finally
      HTML.Free;
    end;

  except
    on E: Exception do
      AddToLog('Erro: ' + E.Message);
  end;

  Screen.Cursor := crDefault;
end;


end.

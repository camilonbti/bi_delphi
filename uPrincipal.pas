unit uPrincipal;

interface

uses
  System.JSON, System.Win.Registry, MSHTML, ActiveX, ComObj,  HtmlGenerator,
  HtmlGenerator_Constants,
  HtmlGenerator_Logger,
  HtmlGenerator_Validator,
  System.IOUtils,


  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw, Data.DBXFirebird,
  Data.FMTBcd, Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Datasnap.Win.TConnect,
  Vcl.ComCtrls;



type
  TForm1 = class(TForm)
    Button1: TButton;
    SQLConnection1: TSQLConnection;
    LocalConnection1: TLocalConnection;
    sqlDataSetVendas: TSQLDataSet;
    dspVendas: TDataSetProvider;
    cdsVendas: TClientDataSet;
    dsVendas: TDataSource;
    memoLog: TRichEdit;
    WebBrowser1: TWebBrowser;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure AbrirDataSet;
    function EscapeJSONValue(const Value: string): string;
    function DatasetToJSON(cds: TClientDataSet): TJSONArray;
    procedure AddToLog(const Msg: string);
    procedure DefineIEVersion;
    procedure InitializeLogger;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//uses HtmlGenerator, Winapi.ActiveX;

procedure TForm1.AddToLog(const Msg: string);
var
  LogMessage: string;
begin
  LogMessage := Format('[%s] %s', [FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now), Msg]);
  if memoLog <> nil then
    memoLog.Lines.Add(LogMessage);
end;

procedure TForm1.InitializeLogger;
begin
  TLogger.Initialize; // Inicializa o logger na pasta do executável
  TLogger.Enabled := True;
end;

procedure TForm1.DefineIEVersion;
const
  REG_KEY = 'Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION';
var
  Reg: TRegistry;
  AppName: String;
begin
  AppName := ExtractFileName(ParamStr(0));
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(REG_KEY, True) then
    begin
      Reg.WriteInteger(AppName, 11000); // Define para IE11
    end;
  finally
    Reg.Free;
  end;
end;

procedure TForm1.AbrirDataSet;
begin
    cdsVendas.Close;
    cdsVendas.CommandText :=
      '  SELECT FIRST (20) '                               + sLineBreak +
      '    VN.ID_PEDIDO, '                                 + sLineBreak +
      '    VN.DATA, '                                      + sLineBreak +
      '    VN.ID_PRODUTO, '                                + sLineBreak +
      '    PR.REFERENCIA, '                                + sLineBreak +
      '    PR.DESCRICAO AS PRODUTO, '                      + sLineBreak +
      '    VN.ID_LOJA, '                                   + sLineBreak +
      '    LJ.NOME_FANTASIA AS LOJA, '                     + sLineBreak +
      '    RJ.REGIAO, '                                    + sLineBreak +
      '    VN.PRECO_VENDA, '                               + sLineBreak +
      '    VN.QUANTIDADE, '                                + sLineBreak +
      '    (VN.PRECO_VENDA * VN.QUANTIDADE) AS SUBTOTAL, ' + sLineBreak +
      '    VN.ID_VENDEDOR, '                               + sLineBreak +
      '    VD.NOME AS VENDEDOR, '                          + sLineBreak +
      '    VN.MES, '                                       + sLineBreak +
      '    VN.ANO, '                                       + sLineBreak +
      '    VN.TABELA_PRECO, '                              + sLineBreak +
      '    VN.ID_CLIENTE, '                                + sLineBreak +
      '    CL.CLIENTE, '                                   + sLineBreak +
      '    PR.ID_GRUPO, '                                  + sLineBreak +
      '    GR.GRUPO, '                                     + sLineBreak +
      '    PR.ID_SUBGRUPO, '                               + sLineBreak +
      '    SG.DESCRICAO AS SUBGRUPO, '                     + sLineBreak +
      '    PR.ID_MARCA, '                                  + sLineBreak +
      '    MC.MARCA, '                                     + sLineBreak +
      '    PR.ID_FORNECEDOR, '                             + sLineBreak +
      '    FN.NOME_FANTA AS FORNECEDOR '                   + sLineBreak +
      '  FROM '                                            + sLineBreak +
      '    VENDAS VN '                                     + sLineBreak +
      '  LEFT JOIN  PRODUTOS    PR ON ( VN.ID_PRODUTO    = PR.ID_PRODUTO ) '    + sLineBreak +
      '  LEFT JOIN  GRUPO       GR ON ( PR.ID_GRUPO      = GR.ID_GRUPO ) '      + sLineBreak +
      '  LEFT JOIN  SUBGRUPO    SG ON ( PR.ID_SUBGRUPO   = SG.ID_SUBGRUPO ) '   + sLineBreak +
      '  LEFT JOIN  MARCAS      MC ON ( PR.ID_MARCA      = MC.ID_MARCA ) '      + sLineBreak +
      '  LEFT JOIN  FORNECEDOR  FN ON ( PR.ID_FORNECEDOR = FN.ID_FORNECEDOR ) ' + sLineBreak +
      '  LEFT JOIN  LOJA        LJ ON ( VN.ID_LOJA       = LJ.ID_LOJA ) '       + sLineBreak +
      '  LEFT JOIN  REGIAO      RJ ON ( LJ.ID_REGIAO     = RJ.ID_REGIAO ) '     + sLineBreak +
      '  LEFT JOIN  VENDEDOR    VD ON ( VN.ID_VENDEDOR   = VD.ID_VENDEDOR ) '   + sLineBreak +
      '  LEFT JOIN  CLIENTE     CL ON ( VN.ID_CLIENTE    = CL.CGC_CPF ) '       + sLineBreak +
      '  WHERE  1 = 1 ' + sLineBreak +
      '  AND    VN.DATA BETWEEN '+ QuotedStr('05.12.2024') + ' AND ' + QuotedStr('05.12.2024');

    cdsVendas.Open;
    AddToLog('Dataset carregado com sucesso');
end;

function TForm1.EscapeJSONValue(const Value: string): string;
begin
  Result := Value;
  Result := StringReplace(Result, '\', '\\', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '\"', [rfReplaceAll]);
  Result := StringReplace(Result, #9, '\t', [rfReplaceAll]);
  Result := StringReplace(Result, #13#10, '\n', [rfReplaceAll]);
  Result := StringReplace(Result, #10, '\n', [rfReplaceAll]);
  Result := StringReplace(Result, #13, '\n', [rfReplaceAll]);
  Result := StringReplace(Result, #$2028, '\u2028', [rfReplaceAll]); // Separador de linha
  Result := StringReplace(Result, #$2029, '\u2029', [rfReplaceAll]); // Separador de parágrafo
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InitializeLogger;
  DefineIEVersion;
end;

function TForm1.DatasetToJSON(cds: TClientDataSet): TJSONArray;
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  Field: TField;
begin
  JSONArray := TJSONArray.Create;
  try
    // Validações iniciais do dataset
    if not(cds.Active) or (cds.IsEmpty) then
    begin
      AddToLog('DataSet vazio ou não está ativo.');
      Exit(nil);
    end;

    // Prepara o JSON a partir do dataset
    cds.First;
    while not cds.Eof do
    begin
      JSONObject := TJSONObject.Create;
      try
        // Adiciona cada campo como um par no JSON
        for Field in cds.Fields do
          JSONObject.AddPair(Field.FieldName, EscapeJSONValue(Field.AsString));
        JSONArray.AddElement(JSONObject);
      except
        JSONObject.Free;
        raise;
      end;
      cds.Next;
    end;

    // Retorna o JSONArray criado
    Result := JSONArray;
    AddToLog('TJSONArray gerado com sucesso.');
  except
    JSONArray.Free; // Libera memória em caso de erro
    raise;
  end;
end;

//procedure TForm1.Button1Click(Sender: TObject);
//var
//  HTMLContent: TStringList;
//begin
//  AddToLog('Iniciando geração do HTML');
//
//  HTMLContent := TStringList.Create;
//  try
//    // Gera o HTML
//    HTMLContent.Text := THtmlGenerator.GerarHTML; // Recebe a string retornada
//    AddToLog(Format('HTML gerado com sucesso: %d linhas', [HTMLContent.Count]));
//
//    // Salva temporariamente o HTML
//    HTMLContent.SaveToFile('dashboard_temp.html');
//    AddToLog('HTML salvo temporariamente');
//
//    // Navega para o arquivo
//    WebBrowser1.Navigate(ExtractFilePath(ParamStr(0)) + 'dashboard_temp.html');
//    AddToLog('Iniciada navegação para o arquivo HTML');
//
//    // Aguarda carregar
//    while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
//    begin
//      Application.ProcessMessages;
//      Sleep(50);
//    end;
//
//    AddToLog('Dashboard carregado com sucesso');
//
//  except
//    on E: Exception do
//    begin
//      AddToLog('Erro: ' + E.Message);
//      ShowMessage('Erro ao carregar dashboard: ' + E.Message);
//    end;
//  end;
//
//  // Libera recursos
//  HTMLContent.Free;
//  AddToLog('Processo finalizado');
//end;

//procedure TForm1.Button1Click(Sender: TObject);
//var
//  HTMLContent: TStringList;
//begin
//  AddToLog('Iniciando geração do HTML');
//
//  HTMLContent := TStringList.Create;
//  try
//    // Gera o HTML
//    HTMLContent.Text := THtmlGenerator.GerarHTML;
//    AddToLog(Format('HTML gerado com sucesso: %d linhas', [HTMLContent.Count]));
//
//    // Salva temporariamente o HTML com codificação UTF-8
//    HTMLContent.SaveToFile('dashboard_temp2.html', TEncoding.UTF8);
//    AddToLog('HTML salvo temporariamente em UTF-8');
//
//    // Navega para o arquivo
//    WebBrowser1.Navigate(ExtractFilePath(ParamStr(0)) + 'dashboard_temp2.html');
//    AddToLog('Iniciada navegação para o arquivo HTML');
//
//    // Aguarda carregar
//    while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
//    begin
//      Application.ProcessMessages;
//      Sleep(50);
//    end;
//
//    AddToLog('Dashboard carregado com sucesso');
//  except
//    on E: Exception do
//    begin
//      AddToLog('Erro: ' + E.Message);
//      ShowMessage('Erro ao carregar dashboard: ' + E.Message);
//    end;
//  end;
//
//  // Libera recursos
//  HTMLContent.Free;
//  AddToLog('Processo finalizado');
//end;


procedure TForm1.Button1Click(Sender: TObject);
var
  HTMLContent: TStringList;
  HTMLFilePath: string;
  StartTime: Cardinal;
begin
  TLogger.Log(llInfo, LOG_INIT);
  Screen.Cursor := crHourGlass;
  try
    HTMLContent := TStringList.Create;
    try
      // Configura o encoding
      HTMLContent.DefaultEncoding := TEncoding.UTF8;

      // Gera o HTML
      HTMLContent.Text := THtmlGenerator.GerarHTML;

      // Log do HTML bruto antes da validação
      AddToLog('=== HTML Bruto Gerado ===');
      AddToLog(HTMLContent.Text);
      AddToLog('=== Fim do HTML Bruto ===');

      // Define o caminho usando System.IOUtils
      HTMLFilePath := TPath.Combine(
        ExtractFilePath(Application.ExeName),
        'dashboard_temp.html'
      );

      // Garante que o arquivo não está em uso
      if FileExists(HTMLFilePath) then
      begin
        try
          DeleteFile(HTMLFilePath);
        except
          on E: Exception do
          begin
            TLogger.Log(llError, 'Não foi possível excluir o arquivo temporário anterior');
            raise Exception.Create('Arquivo temporário em uso');
          end;
        end;
      end;

      // Salva com encoding UTF-8
      TFile.WriteAllText(HTMLFilePath, HTMLContent.Text, TEncoding.UTF8);
      TLogger.Log(llInfo, LOG_HTML_SAVED, [HTMLFilePath]);

      // Verifica WebBrowser
      if not Assigned(WebBrowser1) then
        raise Exception.Create(LOG_BROWSER_ERROR);

      // Navega para o arquivo usando URL com encoding correto
      WebBrowser1.Navigate(
        'file:///' + StringReplace(HTMLFilePath, '\', '/', [rfReplaceAll])
      );

      // Aguarda carregar com timeout
      StartTime := GetTickCount;
      while (WebBrowser1.ReadyState <> READYSTATE_COMPLETE) and
            (GetTickCount - StartTime < TIMEOUT_LOAD) do
      begin
        Application.ProcessMessages;
        Sleep(SLEEP_INTERVAL);
      end;

      if WebBrowser1.ReadyState <> READYSTATE_COMPLETE then
      begin
        TLogger.Log(llError, LOG_TIMEOUT);
        raise Exception.Create(LOG_TIMEOUT);
      end
      else
        TLogger.Log(llInfo, LOG_DASHBOARD_LOADED);

    finally
      HTMLContent.Free;
    end;

  except
    on E: Exception do
    begin
      TLogger.Log(llError, LOG_ERROR, [E.Message]);
      ShowMessage(Format(LOG_ERROR, [E.Message]));
    end;
  end;

  Screen.Cursor := crDefault;
end;





end.
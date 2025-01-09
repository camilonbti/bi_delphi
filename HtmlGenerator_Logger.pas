unit HtmlGenerator_Logger;

interface

uses
  System.Classes, System.SysUtils, System.IOUtils;

type
  TLogLevel = (llDebug, llInfo, llWarning, llError);

  TLogger = class
  private
    class var FLogFile: string;
    class var FEnabled: Boolean;
    class procedure WriteToFile(const Msg: string);
    class function GetLogFileName: string;
    class procedure LogHTML(const HTML: string);
  public
    class procedure Initialize;
    class procedure Log(Level: TLogLevel; const Msg: string); overload;
    class procedure Log(Level: TLogLevel; const Msg: string; const Args: array of const); overload;
    class procedure LogHTMLContent(const HTML: string; const ErrorMsg: string = '');
    class property Enabled: Boolean read FEnabled write FEnabled;
  end;

implementation

class function TLogger.GetLogFileName: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), 'dashboard.log');
end;

class procedure TLogger.Initialize;
begin
  FLogFile := GetLogFileName;
  FEnabled := True;

  if not TFile.Exists(FLogFile) then
  begin
    TFile.WriteAllText(FLogFile,
      '=== Log Iniciado em ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' ===' + sLineBreak);
  end;
end;

class procedure TLogger.Log(Level: TLogLevel; const Msg: string);
var
  LogMsg: string;
  LevelStr: string;
begin
  if not FEnabled then Exit;

  case Level of
    llDebug: LevelStr := 'DEBUG';
    llInfo: LevelStr := 'INFO';
    llWarning: LevelStr := 'WARN';
    llError: LevelStr := 'ERROR';
  end;

  LogMsg := Format('[%s] [%s] %s', [
    FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now),
    LevelStr,
    Msg
  ]);

  WriteToFile(LogMsg);
end;

class procedure TLogger.Log(Level: TLogLevel; const Msg: string; const Args: array of const);
begin
  Log(Level, Format(Msg, Args));
end;

class procedure TLogger.LogHTML(const HTML: string);
var
  Lines: TStringList;
  i: Integer;
begin
  Lines := TStringList.Create;
  try
    Lines.Text := HTML;
    WriteToFile('=== HTML Content Begin ===');
    for i := 0 to Lines.Count - 1 do
      WriteToFile(Format('Line %d: %s', [i + 1, Lines[i]]));
    WriteToFile('=== HTML Content End ===');
  finally
    Lines.Free;
  end;
end;

class procedure TLogger.LogHTMLContent(const HTML: string; const ErrorMsg: string = '');
begin
  if not FEnabled then Exit;

  WriteToFile('');
  WriteToFile('=== HTML Validation ' + FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now) + ' ===');

  if ErrorMsg <> '' then
  begin
    WriteToFile('Error: ' + ErrorMsg);
    WriteToFile('');
  end;

  LogHTML(HTML);
  WriteToFile('');
end;

class procedure TLogger.WriteToFile(const Msg: string);
begin
  try
    if TFile.Exists(FLogFile) then
      TFile.AppendAllText(FLogFile, Msg + sLineBreak)
    else
      TFile.WriteAllText(FLogFile, Msg + sLineBreak);
  except
    on E: Exception do
      WriteLn(Format('Erro ao gravar log: %s. Mensagem: %s', [E.Message, Msg]));
  end;
end;

end.

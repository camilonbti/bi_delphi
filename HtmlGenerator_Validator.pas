unit HtmlGenerator_Validator;

interface

uses
  System.Classes, System.SysUtils, System.RegularExpressions,
  HtmlGenerator_Logger;

type
  THtmlGeneratorValidator = class
  public
    class function ValidateHTML(const HTML: string): Boolean;
  private
    class function ValidateStructure(const HTML: string): Boolean;
    class function ValidateIDs(const HTML: string): Boolean;
    class function ValidateTags(const HTML: string): Boolean;
//    class function ValidateClosingTags(const HTML: string): Boolean;
  end;

implementation

uses uPrincipal;

class function THtmlGeneratorValidator.ValidateHTML(const HTML: string): Boolean;
begin
//  Result := ValidateStructure(HTML) and
//            ValidateIDs(HTML) and
//            ValidateTags(HTML) and
//            ValidateClosingTags(HTML);
end;

class function THtmlGeneratorValidator.ValidateStructure(const HTML: string): Boolean;
var
  Stack: TStringList;
  Regex: TRegEx;
  Matches: TMatchCollection;
  Match: TMatch;
  Tag: string;
begin
  Result := True;
  Stack := TStringList.Create;
  try
    // Encontra todas as tags HTML
    Regex := TRegEx.Create('</?([a-z][a-z0-9]*)[^>]*?(/?)>', [roIgnoreCase]);
    Matches := Regex.Matches(HTML);

    for Match in Matches do
    begin
      Tag := Match.Groups[1].Value.ToLower;

      // Ignora tags de auto-fechamento
      if Match.Groups[2].Value = '/' then
        Continue;

      if Match.Value.StartsWith('</') then
      begin
        // Tag de fechamento
        if (Stack.Count = 0) or (Stack[Stack.Count - 1] <> Tag) then
        begin
          TLogger.Log(llError, 'Tag de fechamento inválida: %s', [Tag]);
          Result := False;
          Break;
        end;
        Stack.Delete(Stack.Count - 1);
      end
      else
      begin
        // Tag de abertura
        Stack.Add(Tag);
      end;
    end;

    if Stack.Count > 0 then
    begin
      TLogger.Log(llError, 'Tags não fechadas: %s', [Stack.CommaText]);
      Result := False;
    end;

  finally
    Stack.Free;
  end;
end;

class function THtmlGeneratorValidator.ValidateIDs(const HTML: string): Boolean;
var
  IDs: TStringList;
  Regex: TRegEx;
  Matches: TMatchCollection;
  Match: TMatch;
begin
  Result := True;
  IDs := TStringList.Create;
  try
    IDs.Sorted := True;
    IDs.Duplicates := dupError;

    Regex := TRegEx.Create('id="([^"]*)"', [roIgnoreCase]);
    Matches := Regex.Matches(HTML);

    try
      for Match in Matches do
      begin
        try
          IDs.Add(Match.Groups[1].Value);
        except
          on E: Exception do
          begin
            Form1.AddToLog('ID duplicado encontrado: ' + Match.Groups[1].Value);
            Result := False;
            Break;
          end;
        end;
      end;
    except
      on E: Exception do
      begin
        Form1.AddToLog('Erro ao validar IDs: ' + E.Message);
        Result := False;
      end;
    end;

  finally
    IDs.Free;
  end;
end;

class function THtmlGeneratorValidator.ValidateTags(const HTML: string): Boolean;
const
  ValidTags: array[0..24] of string = (
    'html', 'head', 'body', 'meta', 'title', 'script', 'style',
    'link', 'div', 'span', 'p', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6',
    'ul', 'ol', 'li', 'table', 'tr', 'td', 'th', 'canvas'
  );
var
  Regex: TRegEx;
  Matches: TMatchCollection;
  Match: TMatch;
  Tag: string;
  i: Integer;
  IsValid: Boolean;
begin
  Result := True;

  Regex := TRegEx.Create('</?([a-z][a-z0-9]*)[^>]*>', [roIgnoreCase]);
  Matches := Regex.Matches(HTML);

  for Match in Matches do
  begin
    Tag := Match.Groups[1].Value.ToLower;
    IsValid := False;

    for i := Low(ValidTags) to High(ValidTags) do
    begin
      if Tag = ValidTags[i] then
      begin
        IsValid := True;
        Break;
      end;
    end;

    if not IsValid then
    begin
      Form1.AddToLog('Tag inválida encontrada: ' + Tag);
      Result := False;
      Break;
    end;
  end;
end;

end.

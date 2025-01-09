unit HtmlGenerator_JS_Core;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorJSCore = class
  public
    class function GerarJSCore: string;
  end;

implementation

class function THtmlGeneratorJSCore.GerarJSCore: string;
var
  Scripts: TStringList;
begin
  Scripts := TStringList.Create;
  try
    Scripts.Add('// Core functionality');
    Scripts.Add('document.addEventListener("DOMContentLoaded", function() {');
    Scripts.Add('    setupCharts();');
    Scripts.Add('    updateDashboard();');
    Scripts.Add('});');

    Result := Scripts.Text;
  finally
    Scripts.Free;
  end;
end;

end.

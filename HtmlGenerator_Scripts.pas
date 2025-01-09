unit HtmlGenerator_Scripts;

interface

uses
  System.Classes, System.SysUtils,
  HtmlGenerator_JS_Core,
  HtmlGenerator_JS_Utils,
  HtmlGenerator_JS_Charts,
  HtmlGenerator_Cores;

type
  THtmlGeneratorScripts = class
  public
    class function GerarScripts: string;
  end;

implementation

class function THtmlGeneratorScripts.GerarScripts: string;
var
  Scripts: TStringList;
begin
  Scripts := TStringList.Create;
  try
    Scripts.Add(THtmlGeneratorCores.GerarPaletaCores);
    Scripts.Add(THtmlGeneratorJSUtils.GerarJSUtils);
    Scripts.Add(THtmlGeneratorJSCore.GerarJSCore);
    Scripts.Add(THtmlGeneratorJSCharts.GerarCharts); // Corrigido o nome do método

    Result := Scripts.Text;
  finally
    Scripts.Free;
  end;
end;

end.

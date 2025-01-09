unit HtmlGenerator_Components;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorComponents = class
  public
    class function GerarKPI(const AId, ATitulo, AValor, ATooltip: string): string;
    class function GerarGrafico(const AId, ATitulo, ATipo: string): string;
    class function GerarFiltro(const AId, ATexto: string): string;
  end;

implementation

class function THtmlGeneratorComponents.GerarKPI(const AId, ATitulo, AValor, ATooltip: string): string;
begin
  Result := Format(
    '<article class="kpi-card" title="%s">' + sLineBreak +
    '    <h2>%s</h2>' + sLineBreak +
    '    <p id="%s">%s</p>' + sLineBreak +
    '    <div class="tooltip">%s</div>' + sLineBreak +
    '</article>',
    [ATooltip, ATitulo, AId, AValor, ATooltip]
  );
end;

class function THtmlGeneratorComponents.GerarGrafico(const AId, ATitulo, ATipo: string): string;
begin
  Result := Format(
    '<div class="chart-container" id="%sContainer">' + sLineBreak +
    '    <h3>%s</h3>' + sLineBreak +
    '    <div class="chart-wrapper">' + sLineBreak +
    '        <canvas id="%s"></canvas>' + sLineBreak +
    '    </div>' + sLineBreak +
    '</div>',
    [AId, ATitulo, AId]
  );
end;

class function THtmlGeneratorComponents.GerarFiltro(const AId, ATexto: string): string;
begin
  Result := Format(
    '<div class="filter" id="%s">' + sLineBreak +
    '    <span>%s</span>' + sLineBreak +
    '    <div class="filter-content"></div>' + sLineBreak +
    '</div>',
    [AId, ATexto]
  );
end;

end.

unit HtmlGenerator_Components;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorComponents = class
  public
    class function GerarKPI(const AId, ATitulo, AValor, ATooltip: string): string;
    class function GerarGrafico(const AId, ATitulo, ATipo: string): string;
    class function GerarFiltro(const AId, ATexto, ATipo: string; const AValores: TArray<string>): string;
    class function GerarTabela(const AId: string; const AColunas: TArray<string>): string;
    class function GerarPaginacao(const AId: string): string;
    class function GerarBotaoExportar: string;
  private
    class function GerarCabecalhoTabela(const AColunas: TArray<string>): string;
    class function GerarCorpoTabela(const AId: string): string;
  end;

implementation

class function THtmlGeneratorComponents.GerarKPI(const AId, ATitulo, AValor, ATooltip: string): string;
begin
  Result := Format(
    '            <div class="kpi-card" title="%s">' + sLineBreak +
    '                <h2>%s</h2>' + sLineBreak +
    '                <p id="%s">%s</p>' + sLineBreak +
    '                <div class="tooltip">%s</div>' + sLineBreak +
    '            </div>',
    [ATooltip, ATitulo, AId, AValor, ATooltip]
  );
end;

class function THtmlGeneratorComponents.GerarGrafico(const AId, ATitulo, ATipo: string): string;
begin
  Result := Format(
    '            <div class="chart-container">' + sLineBreak +
    '                <h3>%s</h3>' + sLineBreak +
    '                <canvas id="%s" data-type="%s"></canvas>' + sLineBreak +
    '                <div class="chart-legend"></div>' + sLineBreak +
    '            </div>',
    [ATitulo, AId, ATipo]
  );
end;

class function THtmlGeneratorComponents.GerarFiltro(const AId, ATexto, ATipo: string; const AValores: TArray<string>): string;
var
  Options: TStringList;
  Valor: string;
begin
  Options := TStringList.Create;
  try
    Options.Add('                <option value="">Todos</option>');

    for Valor in AValores do
    begin
      Options.Add(Format(
        '                <option value="%s">%s</option>',
        [Valor, Valor]
      ));
    end;

    Result := Format(
      '            <div class="filter-group">' + sLineBreak +
      '                <label for="%s">%s:</label>' + sLineBreak +
      '                <select id="%s" class="filter-select" data-type="%s">' + sLineBreak +
      '%s' + sLineBreak +
      '                </select>' + sLineBreak +
      '            </div>',
      [AId, ATexto, AId, ATipo, Options.Text]
    );
  finally
    Options.Free;
  end;
end;

class function THtmlGeneratorComponents.GerarTabela(const AId: string; const AColunas: TArray<string>): string;
begin
  Result := Format(
    '        <div class="table-container">' + sLineBreak +
    '            <table>' + sLineBreak +
    '%s' + sLineBreak +
    '%s' + sLineBreak +
    '            </table>' + sLineBreak +
    '        </div>',
    [GerarCabecalhoTabela(AColunas), GerarCorpoTabela(AId)]
  );
end;

class function THtmlGeneratorComponents.GerarCabecalhoTabela(const AColunas: TArray<string>): string;
var
  Headers: TStringList;
  Coluna: string;
begin
  Headers := TStringList.Create;
  try
    Headers.Add('            <thead>');
    Headers.Add('                <tr>');

    for Coluna in AColunas do
    begin
      Headers.Add(Format(
        '                    <th>%s</th>',
        [Coluna]
      ));
    end;

    Headers.Add('                </tr>');
    Headers.Add('            </thead>');

    Result := Headers.Text;
  finally
    Headers.Free;
  end;
end;

class function THtmlGeneratorComponents.GerarCorpoTabela(const AId: string): string;
begin
  Result := Format(
    '            <tbody id="%s">' + sLineBreak +
    '                <!-- Dados serão inseridos via JavaScript -->' + sLineBreak +
    '            </tbody>',
    [AId]
  );
end;

class function THtmlGeneratorComponents.GerarPaginacao(const AId: string): string;
begin
  Result := Format(
    '        <div class="pagination" id="%s">' + sLineBreak +
    '            <button id="paginaAnterior" class="btn" disabled>Anterior</button>' + sLineBreak +
    '            <button id="proximaPagina" class="btn">Próxima</button>' + sLineBreak +
    '        </div>',
    [AId]
  );
end;

class function THtmlGeneratorComponents.GerarBotaoExportar: string;
begin
  Result :=
    '        <button id="exportButton" class="btn btn-primary">' + sLineBreak +
    '            Exportar Dados' + sLineBreak +
    '        </button>';
end;

end.

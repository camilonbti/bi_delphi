unit HtmlGenerator_Mapping;

interface

type
  TFieldMapping = record
    FieldName: string;     // Nome do campo no dataset
    InternalName: string;  // Nome usado no JavaScript
    DisplayLabel: string;  // Label para exibição
    IsVisible: Boolean;    // Se o campo é visível na interface
    IsFilterable: Boolean; // Se permite filtro
    FilterType: string;    // Tipo de filtro (select, date, etc)
    DefaultValue: string;  // Valor padrão
    constructor Create(const AFieldName, AInternalName, ADisplayLabel: string;
      AIsVisible, AIsFilterable: Boolean; const AFilterType, ADefaultValue: string);
  end;

  TDashboardMapping = class
  public
    class function GetFieldMappings: TArray<TFieldMapping>;
  end;

implementation

{ TFieldMapping }

constructor TFieldMapping.Create(const AFieldName, AInternalName, ADisplayLabel: string;
  AIsVisible, AIsFilterable: Boolean; const AFilterType, ADefaultValue: string);
begin
  FieldName := AFieldName;
  InternalName := AInternalName;
  DisplayLabel := ADisplayLabel;
  IsVisible := AIsVisible;
  IsFilterable := AIsFilterable;
  FilterType := AFilterType;
  DefaultValue := ADefaultValue;
end;

{ TDashboardMapping }

class function TDashboardMapping.GetFieldMappings: TArray<TFieldMapping>;
begin
  SetLength(Result, 15);

  // Mapeamento dos campos principais
  Result[0] := TFieldMapping.Create(
    'ID_PEDIDO', 'id_pedido', 'Pedido', True, True, 'select', '0');

  Result[1] := TFieldMapping.Create(
    'PRODUTO', 'produto', 'Produto', True, True, 'select', 'Não informado');

  Result[2] := TFieldMapping.Create(
    'ID_LOJA', 'id_loja', 'Loja', True, True, 'select', '0');

  Result[3] := TFieldMapping.Create(
    'LOJA', 'loja', 'Nome da Loja', True, True, 'select', 'Não informado');

  Result[4] := TFieldMapping.Create(
    'ID_REGIAO', 'id_regiao', 'Região', True, True, 'select', '0');

  Result[5] := TFieldMapping.Create(
    'REGIAO', 'regiao', 'Nome da Região', True, True, 'select', 'Não informado');

  Result[6] := TFieldMapping.Create(
    'ID_VENDEDOR', 'id_vendedor', 'Vendedor', True, True, 'select', '0');

  Result[7] := TFieldMapping.Create(
    'VENDEDOR', 'vendedor', 'Nome do Vendedor', True, True, 'select', 'Não informado');

  Result[8] := TFieldMapping.Create(
    'ID_GRUPO', 'id_grupo', 'Grupo', True, True, 'select', '0');

  Result[9] := TFieldMapping.Create(
    'GRUPO', 'grupo', 'Nome do Grupo', True, True, 'select', 'Não informado');

  Result[10] := TFieldMapping.Create(
    'ID_SUBGRUPO', 'id_subgrupo', 'Subgrupo', True, True, 'select', '0');

  Result[11] := TFieldMapping.Create(
    'SUBGRUPO', 'subgrupo', 'Nome do Subgrupo', True, True, 'select', 'Não informado');

  Result[12] := TFieldMapping.Create(
    'ID_MARCA', 'id_marca', 'Marca', True, True, 'select', '0');

  Result[13] := TFieldMapping.Create(
    'MARCA', 'marca', 'Nome da Marca', True, True, 'select', 'Não informado');

  Result[14] := TFieldMapping.Create(
    'QUANTIDADE', 'quantidade', 'Quantidade', True, False, '', '0');
end;

end.

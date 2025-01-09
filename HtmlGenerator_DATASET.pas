unit HtmlGenerator_DATASET;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorDataset = class
  public
    class function GerarDataset: string;
  end;

implementation

class function THtmlGeneratorDataset.GerarDataset: string;
var
  Dataset: TStringList;
begin
  Dataset := TStringList.Create;
  try
    Dataset.Add('        const mockData = [');
    Dataset.Add('            { ID_SAIDA: 2692490,');
    Dataset.Add('              ID_PEDIDO: 5796655,');
    Dataset.Add('              ID_PRODUTO: 16572,');
    Dataset.Add('              PRODUTO: "LIQUIDIFICADOR WALITA DAILY VERMELHO",');
    Dataset.Add('              ID_LOJA: 16,');
    Dataset.Add('              ID_REGIAO: 28,');
    Dataset.Add('              REGIAO: "REGIONAL 03",');
    Dataset.Add('              LOJA: "C.M.16 - RUY BARBOSA",');
    Dataset.Add('              ID_VENDEDOR: 453,');
    Dataset.Add('              VENDEDOR: "16 GILMAR GONÇALVES DOS SANTOS",');
    Dataset.Add('              ID_GRUPO: 234,');
    Dataset.Add('              GRUPO: "PORTATEIS",');
    Dataset.Add('              ID_SUBGRUPO: 97,');
    Dataset.Add('              SUBGRUPO: "LIQUIDIFICADORES",');
    Dataset.Add('              ID_MARCA: 101,');
    Dataset.Add('              MARCA: "WALITA",');
    Dataset.Add('              QUANTIDADE: 1,');
    Dataset.Add('              PRECO_VENDA: 299,');
    Dataset.Add('              SUBTOTAL: 299 },');

    Dataset.Add('            { ID_SAIDA: 2692491,');
    Dataset.Add('              ID_PEDIDO: 5796656,');
    Dataset.Add('              ID_PRODUTO: 20285,');
    Dataset.Add('              PRODUTO: "LAVADORA SEMI AUTO COLORMAQ 20KG BRANCO",');
    Dataset.Add('              ID_LOJA: 26,');
    Dataset.Add('              ID_REGIAO: 30,');
    Dataset.Add('              REGIAO: "REGIONAL 04",');
    Dataset.Add('              LOJA: "C.M.26 - FEIRA DE SANTANA II",');
    Dataset.Add('              ID_VENDEDOR: 972,');
    Dataset.Add('              VENDEDOR: "26 ELISANGELA GOMES GABRIEL",');
    Dataset.Add('              ID_GRUPO: 228,');
    Dataset.Add('              GRUPO: "LINHA BRANCA",');
    Dataset.Add('              ID_SUBGRUPO: 62,');
    Dataset.Add('              SUBGRUPO: "LAVADORAS",');
    Dataset.Add('              ID_MARCA: 81,');
    Dataset.Add('              MARCA: "COLORMAQ",');
    Dataset.Add('              QUANTIDADE: 1,');
    Dataset.Add('              PRECO_VENDA: 799,');
    Dataset.Add('              SUBTOTAL: 799 },');

    Dataset.Add('            { ID_SAIDA: 2692504,');
    Dataset.Add('              ID_PEDIDO: 5796667,');
    Dataset.Add('              ID_PRODUTO: 21053,');
    Dataset.Add('              PRODUTO: "APARADOR DE PELOS MONDIAL BODY GROOM 06",');
    Dataset.Add('              ID_LOJA: 42,');
    Dataset.Add('              ID_REGIAO: 30,');
    Dataset.Add('              REGIAO: "REGIONAL 04",');
    Dataset.Add('              LOJA: "C.M.42 - CAMAÇARI",');
    Dataset.Add('              ID_VENDEDOR: 943,');
    Dataset.Add('              VENDEDOR: "42 ANDREY NASCIMENTO SILVA",');
    Dataset.Add('              ID_GRUPO: 234,');
    Dataset.Add('              GRUPO: "PORTATEIS",');
    Dataset.Add('              ID_SUBGRUPO: 129,');
    Dataset.Add('              SUBGRUPO: "APARADOR DE PELOS",');
    Dataset.Add('              ID_MARCA: 132,');
    Dataset.Add('              MARCA: "MONDIAL",');
    Dataset.Add('              QUANTIDADE: 1,');
    Dataset.Add('              PRECO_VENDA: 149,');
    Dataset.Add('              SUBTOTAL: 149 },');

    Dataset.Add('            { ID_SAIDA: 2692864,');
    Dataset.Add('              ID_PEDIDO: 5796986,');
    Dataset.Add('              ID_PRODUTO: 21972,');
    Dataset.Add('              PRODUTO: "LAVADORA SEMI AUTO COLORMAQ 15KG BRANCA",');
    Dataset.Add('              ID_LOJA: 10,');
    Dataset.Add('              ID_REGIAO: 27,');
    Dataset.Add('              REGIAO: "REGIONAL 02",');
    Dataset.Add('              LOJA: "C.M.10 - UTINGA",');
    Dataset.Add('              ID_VENDEDOR: 318,');
    Dataset.Add('              VENDEDOR: "10 DEISY DIAS DE SOUZA",');
    Dataset.Add('              ID_GRUPO: 228,');
    Dataset.Add('              GRUPO: "LINHA BRANCA",');
    Dataset.Add('              ID_SUBGRUPO: 62,');
    Dataset.Add('              SUBGRUPO: "LAVADORAS",');
    Dataset.Add('              ID_MARCA: 81,');
    Dataset.Add('              MARCA: "COLORMAQ",');
    Dataset.Add('              QUANTIDADE: 1,');
    Dataset.Add('              PRECO_VENDA: 699,');
    Dataset.Add('              SUBTOTAL: 699 }');
    Dataset.Add('        ];');
    Dataset.Add('');

    Result := Dataset.Text;
  finally
    Dataset.Free;
  end;
end;

end.

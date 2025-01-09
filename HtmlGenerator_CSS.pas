unit HtmlGenerator_CSS;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorCSS = class
  private
    class function GerarEstiloPadrao: string;
    class function GerarEstiloLayout: string;
    class function GerarEstiloKPI: string;
    class function GerarEstiloGraficos: string;
    class function GerarEstiloTabela: string;
    class function GerarEstiloBotoes: string;
    class function GerarEstiloPaginacao: string;
    class function GerarEstiloResponsivo: string;
  public
    class function GerarCSS: string;
  end;

implementation

class function THtmlGeneratorCSS.GerarCSS: string;
var
  CSS: TStringList;
begin
  CSS := TStringList.Create;
  try
    CSS.Text := UTF8String(CSS.Text);
    DefaultSystemCodePage := CP_UTF8;

    CSS.Add('    <style>');
    CSS.Add(GerarEstiloPadrao);
    CSS.Add(GerarEstiloLayout);
    CSS.Add(GerarEstiloKPI);
    CSS.Add(GerarEstiloGraficos);
    CSS.Add(GerarEstiloTabela);
    CSS.Add(GerarEstiloBotoes);
    CSS.Add(GerarEstiloPaginacao);
    CSS.Add(GerarEstiloResponsivo);
    CSS.Add('    </style>');

    Result := CSS.Text;
  finally
    CSS.Free;
  end;
end;

class function THtmlGeneratorCSS.GerarEstiloPadrao: string;
var
  CSS: TStringList;
begin
  CSS := TStringList.Create;
  try
    CSS.Add('        body {');
    CSS.Add('            font-family: Arial, sans-serif;');
    CSS.Add('            margin: 0;');
    CSS.Add('            padding: 20px;');
    CSS.Add('            background-color: #f0f0f0;');
    CSS.Add('            color: #333;');
    CSS.Add('        }');
    CSS.Add('        main {');
    CSS.Add('            max-width: 1200px;');
    CSS.Add('            margin: 0 auto;');
    CSS.Add('            background-color: white;');
    CSS.Add('            padding: 20px;');
    CSS.Add('            border-radius: 8px;');
    CSS.Add('            box-shadow: 0 0 10px rgba(0,0,0,0.1);');
    CSS.Add('        }');
    CSS.Add('        h1 {');
    CSS.Add('            color: #333;');
    CSS.Add('            text-align: center;');
    CSS.Add('        }');

    Result := CSS.Text;
  finally
    CSS.Free;
  end;
end;

class function THtmlGeneratorCSS.GerarEstiloLayout: string;
var
  CSS: TStringList;
begin
  CSS := TStringList.Create;
  try
    CSS.Add('        .filters {');
    CSS.Add('            display: flex;');
    CSS.Add('            gap: 10px;');
    CSS.Add('            margin-bottom: 20px;');
    CSS.Add('            justify-content: center;');
    CSS.Add('            flex-wrap: wrap;');
    CSS.Add('        }');
    CSS.Add('        .filter-item {');
    CSS.Add('            background-color: #007bff;');
    CSS.Add('            color: white;');
    CSS.Add('            padding: 5px 10px;');
    CSS.Add('            border-radius: 4px;');
    CSS.Add('            margin: 5px;');
    CSS.Add('            cursor: pointer;');
    CSS.Add('            display: flex;');
    CSS.Add('            align-items: center;');
    CSS.Add('        }');
    CSS.Add('        .filter-item span {');
    CSS.Add('            margin-left: 5px;');
    CSS.Add('            font-weight: bold;');
    CSS.Add('            cursor: pointer;');
    CSS.Add('        }');

    Result := CSS.Text;
  finally
    CSS.Free;
  end;
end;

class function THtmlGeneratorCSS.GerarEstiloKPI: string;
var
  CSS: TStringList;
begin
  CSS := TStringList.Create;
  try
    CSS.Add('        .kpis {');
    CSS.Add('            display: flex;');
    CSS.Add('            justify-content: space-between;');
    CSS.Add('            margin-bottom: 30px;');
    CSS.Add('            flex-wrap: nowrap;');
    CSS.Add('        }');
    CSS.Add('        .kpi-card {');
    CSS.Add('            background-color: #e9ecef;');
    CSS.Add('            padding: 15px;');
    CSS.Add('            border-radius: 8px;');
    CSS.Add('            text-align: center;');
    CSS.Add('            flex: 1;');
    CSS.Add('            margin: 10px;');
    CSS.Add('            min-width: 150px;');
    CSS.Add('            position: relative;');
    CSS.Add('        }');
    CSS.Add('        .kpi-card h3, .kpi-card p {');
    CSS.Add('            color: #333;');
    CSS.Add('        }');
    CSS.Add('        .kpi-card .tooltip {');
    CSS.Add('            position: absolute;');
    CSS.Add('            top: -10px;');
    CSS.Add('            right: -10px;');
    CSS.Add('            background-color: rgba(0, 0, 0, 0.7);');
    CSS.Add('            color: white;');
    CSS.Add('            padding: 5px;');
    CSS.Add('            border-radius: 4px;');
    CSS.Add('            display: none;');
    CSS.Add('        }');
    CSS.Add('        .kpi-card:hover .tooltip {');
    CSS.Add('            display: block;');
    CSS.Add('        }');

    Result := CSS.Text;
  finally
    CSS.Free;
  end;
end;

class function THtmlGeneratorCSS.GerarEstiloGraficos: string;
var
  CSS: TStringList;
begin
  CSS := TStringList.Create;
  try
    CSS.Add('        .charts {');
    CSS.Add('            display: flex;');
    CSS.Add('            gap: 20px;');
    CSS.Add('            margin-bottom: 30px;');
    CSS.Add('            flex-wrap: wrap;');
    CSS.Add('            justify-content: space-around;');
    CSS.Add('        }');
    CSS.Add('        .chart-container {');
    CSS.Add('            flex: 1 1 45%;');
    CSS.Add('            min-width: 300px;');
    CSS.Add('            max-width: 600px;');
    CSS.Add('            height: 400px;');
    CSS.Add('            background-color: white;');
    CSS.Add('            padding: 15px;');
    CSS.Add('            border-radius: 8px;');
    CSS.Add('            box-shadow: 0 0 5px rgba(0,0,0,0.1);');
    CSS.Add('            position: relative;');
    CSS.Add('        }');
    CSS.Add('        .chart-container .tooltip {');
    CSS.Add('            position: absolute;');
    CSS.Add('            top: -10px;');
    CSS.Add('            right: -10px;');
    CSS.Add('            background-color: rgba(0, 0, 0, 0.7);');
    CSS.Add('            color: white;');
    CSS.Add('            padding: 5px;');
    CSS.Add('            border-radius: 4px;');
    CSS.Add('            display: none;');
    CSS.Add('        }');
    CSS.Add('        .chart-container:hover .tooltip {');
    CSS.Add('            display: block;');
    CSS.Add('        }');

    Result := CSS.Text;
  finally
    CSS.Free;
  end;
end;

class function THtmlGeneratorCSS.GerarEstiloTabela: string;
var
  CSS: TStringList;
begin
  CSS := TStringList.Create;
  try
    CSS.Add('        table {');
    CSS.Add('            width: 100%;');
    CSS.Add('            border-collapse: separate;');
    CSS.Add('            border-spacing: 0 10px;');
    CSS.Add('            font-size: 14px;');
    CSS.Add('        }');
    CSS.Add('        th, td {');
    CSS.Add('            text-align: left;');
    CSS.Add('            padding: 10px;');
    CSS.Add('        }');
    CSS.Add('        th {');
    CSS.Add('            background-color: #007bff;');
    CSS.Add('            color: white;');
    CSS.Add('        }');
    CSS.Add('        td {');
    CSS.Add('            background-color: #f8f9fa;');
    CSS.Add('            border-bottom: 1px solid #ddd;');
    CSS.Add('        }');
    CSS.Add('        th:nth-child(1), td:nth-child(1) { width: 8%; }');
    CSS.Add('        th:nth-child(2), td:nth-child(2) { width: 35%; }');
    CSS.Add('        th:nth-child(3), td:nth-child(3) { width: 24%; }');
    CSS.Add('        th:nth-child(4), td:nth-child(4) { width: 8%; }');
    CSS.Add('        th:nth-child(5), td:nth-child(5) { width: 13%; }');
    CSS.Add('        th:nth-child(6), td:nth-child(6) { width: 12%; }');
    CSS.Add('        td:nth-child(4), td:nth-child(5), td:nth-child(6) {');
    CSS.Add('            text-align: right;');
    CSS.Add('        }');

    Result := CSS.Text;
  finally
    CSS.Free;
  end;
end;

class function THtmlGeneratorCSS.GerarEstiloBotoes: string;
var
  CSS: TStringList;
begin
  CSS := TStringList.Create;
  try
    CSS.Add('        #exportButton {');
    CSS.Add('            background-color: #007bff;');
    CSS.Add('            color: white;');
    CSS.Add('            padding: 10px 20px;');
    CSS.Add('            border: none;');
    CSS.Add('            border-radius: 4px;');
    CSS.Add('            cursor: pointer;');
    CSS.Add('            display: block;');
    CSS.Add('            margin: 20px auto 0;');
    CSS.Add('        }');
    CSS.Add('        #exportButton:hover {');
    CSS.Add('            background-color: #0056b3;');
    CSS.Add('        }');

    Result := CSS.Text;
  finally
    CSS.Free;
  end;
end;

class function THtmlGeneratorCSS.GerarEstiloPaginacao: string;
var
  CSS: TStringList;
begin
  CSS := TStringList.Create;
  try
    CSS.Add('        .pagination {');
    CSS.Add('            display: flex;');
    CSS.Add('            justify-content: center;');
    CSS.Add('            margin-top: 20px;');
    CSS.Add('        }');
    CSS.Add('        .pagination button {');
    CSS.Add('            background-color: #007bff;');
    CSS.Add('            color: white;');
    CSS.Add('            padding: 5px 10px;');
    CSS.Add('            border: none;');
    CSS.Add('            border-radius: 4px;');
    CSS.Add('            cursor: pointer;');
    CSS.Add('            margin: 0 5px;');
    CSS.Add('        }');
    CSS.Add('        .pagination button.disabled {');
    CSS.Add('            background-color: #ddd;');
    CSS.Add('            cursor: not-allowed;');
    CSS.Add('        }');

    Result := CSS.Text;
  finally
    CSS.Free;
  end;
end;

class function THtmlGeneratorCSS.GerarEstiloResponsivo: string;
var
  CSS: TStringList;
begin
  CSS := TStringList.Create;
  try
    CSS.Add('        @media (max-width: 768px) {');
    CSS.Add('            .kpis {');
    CSS.Add('                flex-wrap: wrap;');
    CSS.Add('            }');
    CSS.Add('            .kpi-card {');
    CSS.Add('                flex: 1 1 100%;');
    CSS.Add('                max-width: 100%;');
    CSS.Add('            }');
    CSS.Add('            .charts {');
    CSS.Add('                flex-direction: column;');
    CSS.Add('                align-items: center;');
    CSS.Add('            }');
    CSS.Add('        }');

    Result := CSS.Text;
  finally
    CSS.Free;
  end;
end;

end.

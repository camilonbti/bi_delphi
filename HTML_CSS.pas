unit HTML_CSS;

interface

uses
  System.Classes;

type
  THtmlCSS = class
  private
    class var FCSS: TStringList;

  public
    class constructor Create;
    class destructor Destroy;

    // Retorna o CSS concatenado
    class function GetCSS: string;
  end;

implementation
{ THtmlCSS }

class constructor THtmlCSS.Create;
begin
  FCSS := TStringList.Create;

  // charts.css
// Estilos para KPIs
FCSS.Add('.kpis {');
FCSS.Add('    display: flex;');
FCSS.Add('    justify-content: space-between;');
FCSS.Add('    margin-bottom: 20px;');
FCSS.Add('}');

FCSS.Add('.kpi-card {');
FCSS.Add('    flex: 1;');
FCSS.Add('    background-color: #fafafa;');
FCSS.Add('    margin: 0 10px;');
FCSS.Add('    padding: 15px;');
FCSS.Add('    text-align: center;');
FCSS.Add('    border-radius: 8px;');
FCSS.Add('    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);');
FCSS.Add('}');

FCSS.Add('.kpi-card h2 {');
FCSS.Add('    margin: 0 0 10px;');
FCSS.Add('    font-size: 18px;');
FCSS.Add('    color: #555;');
FCSS.Add('}');

FCSS.Add('.kpi-card p {');
FCSS.Add('    margin: 0;');
FCSS.Add('    font-size: 24px;');
FCSS.Add('    font-weight: bold;');
FCSS.Add('    color: #333;');
FCSS.Add('}');

FCSS.Add('.table-section {');
FCSS.Add('    margin-top: 20px;');
FCSS.Add('    background-color: white;');
FCSS.Add('    padding: 15px;');
FCSS.Add('    border-radius: 8px;');
FCSS.Add('    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);');
FCSS.Add('}');

FCSS.Add('.table-section h2 {');
FCSS.Add('    margin-bottom: 10px;');
FCSS.Add('    font-size: 20px;');
FCSS.Add('    color: #555;');
FCSS.Add('}');

FCSS.Add('.table {');
FCSS.Add('    width: 100%;');
FCSS.Add('    border-collapse: collapse;');
FCSS.Add('}');

FCSS.Add('.table th, .table td {');
FCSS.Add('    border: 1px solid #ddd;');
FCSS.Add('    padding: 8px;');
FCSS.Add('    text-align: left;');
FCSS.Add('}');

FCSS.Add('.table th {');
FCSS.Add('    background-color: #f4f4f4;');
FCSS.Add('    font-weight: bold;');
FCSS.Add('}');


FCSS.Add('.pagination {');
FCSS.Add('    display: flex;');
FCSS.Add('    justify-content: center;');
FCSS.Add('    gap: 10px;');
FCSS.Add('    margin-top: 20px;');
FCSS.Add('}');

FCSS.Add('.pagination-btn {');
FCSS.Add('    padding: 10px 15px;');
FCSS.Add('    background-color: #007BFF;');
FCSS.Add('    color: white;');
FCSS.Add('    border: none;');
FCSS.Add('    border-radius: 4px;');
FCSS.Add('    cursor: pointer;');
FCSS.Add('    font-size: 14px;');
FCSS.Add('}');

FCSS.Add('.pagination-btn:hover {');
FCSS.Add('    background-color: #0056b3;');
FCSS.Add('}');

FCSS.Add('.pagination-btn[disabled] {');
FCSS.Add('    background-color: #ddd;');
FCSS.Add('    color: #999;');
FCSS.Add('    cursor: not-allowed;');
FCSS.Add('}');



  FCSS.Add('/* charts.css */');
  FCSS.Add('.chart-card {');
  FCSS.Add('    background: white;');
  FCSS.Add('    border-radius: 0.5rem;');
  FCSS.Add('    box-shadow: 0 0.15rem 1.75rem rgba(58, 59, 69, 0.15);');
  FCSS.Add('    margin-bottom: 1.5rem;');
  FCSS.Add('    padding: 1rem;');
  FCSS.Add('}');
  FCSS.Add('.chart-card h5 {');
  FCSS.Add('    color: #4e73df;');
  FCSS.Add('    font-size: 0.875rem;');
  FCSS.Add('    font-weight: bold;');
  FCSS.Add('    text-transform: uppercase;');
  FCSS.Add('    margin-bottom: 0.75rem;');
  FCSS.Add('}');
  FCSS.Add('.chart-container {');
  FCSS.Add('    position: relative;');
  FCSS.Add('    width: 100%;');
  FCSS.Add('    height: 400px;');
  FCSS.Add('}');
  FCSS.Add('.chart-tooltip {');
  FCSS.Add('    position: absolute;');
  FCSS.Add('    background: rgba(0, 0, 0, 0.7);');
  FCSS.Add('    color: white;');
  FCSS.Add('    padding: 0.5rem;');
  FCSS.Add('    border-radius: 0.25rem;');
  FCSS.Add('    font-size: 0.875rem;');
  FCSS.Add('    pointer-events: none;');
  FCSS.Add('    opacity: 0;');
  FCSS.Add('    transform: translate(-50%, -100%);');
  FCSS.Add('    transition: opacity 0.2s ease-in-out;');
  FCSS.Add('}');
  FCSS.Add('.chart-tooltip.visible {');
  FCSS.Add('    opacity: 1;');
  FCSS.Add('}');
  FCSS.Add('.chart-legend {');
  FCSS.Add('    display: flex;');
  FCSS.Add('    justify-content: center;');
  FCSS.Add('    flex-wrap: wrap;');
  FCSS.Add('    gap: 0.5rem;');
  FCSS.Add('    margin-top: 1rem;');
  FCSS.Add('}');
  FCSS.Add('.chart-legend-item {');
  FCSS.Add('    display: flex;');
  FCSS.Add('    align-items: center;');
  FCSS.Add('    gap: 0.5rem;');
  FCSS.Add('    font-size: 0.875rem;');
  FCSS.Add('}');
  FCSS.Add('.chart-legend-item .color-box {');
  FCSS.Add('    width: 15px;');
  FCSS.Add('    height: 15px;');
  FCSS.Add('    border-radius: 50%;');
  FCSS.Add('}');
  FCSS.Add('.chart-footer {');
  FCSS.Add('    text-align: center;');
  FCSS.Add('    font-size: 0.875rem;');
  FCSS.Add('    color: #858796;');
  FCSS.Add('    margin-top: 1rem;');
  FCSS.Add('}');


  // Adicione outros arquivos CSS aqui como dashboard.css, filters.css, etc.
end;
class destructor THtmlCSS.Destroy;
begin
  FCSS.Free;
end;

class function THtmlCSS.GetCSS: string;
begin
  Result := FCSS.Text;
end;

end.


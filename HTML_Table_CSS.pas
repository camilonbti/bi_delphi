unit HTML_Table_CSS;

interface

uses
  System.SysUtils;

type
  THTMLTableCSS = class
  public
    class function GetTableCSS: string;
    class function GetTableHeaderCSS: string;
    class function GetTableContentCSS: string;
    class function GetTableResponsiveCSS: string;
    class function GetTableStatusCSS: string;
  end;

implementation

class function THTMLTableCSS.GetTableCSS: string;
begin
  Result :=
    '.table-section {' + sLineBreak +
    '    background: white;' + sLineBreak +
    '    border-radius: 0.5rem;' + sLineBreak +
    '    box-shadow: 0 0.15rem 1.75rem rgba(58, 59, 69, 0.15);' + sLineBreak +
    '    margin-bottom: 1.5rem;' + sLineBreak +
    '    overflow: hidden;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.table {' + sLineBreak +
    '    width: 100%;' + sLineBreak +
    '    margin-bottom: 0;' + sLineBreak +
    '    font-size: 0.875rem;' + sLineBreak +
    '}';
end;

class function THTMLTableCSS.GetTableHeaderCSS: string;
begin
  Result :=
    '.table-header {' + sLineBreak +
    '    padding: 1rem;' + sLineBreak +
    '    background-color: white;' + sLineBreak +
    '    border-bottom: 1px solid rgba(0,0,0,0.1);' + sLineBreak +
    '    display: flex;' + sLineBreak +
    '    justify-content: space-between;' + sLineBreak +
    '    align-items: center;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.table th {' + sLineBreak +
    '    background-color: var(--primary-color);' + sLineBreak +
    '    color: white;' + sLineBreak +
    '    font-weight: 500;' + sLineBreak +
    '    padding: 0.75rem;' + sLineBreak +
    '    white-space: nowrap;' + sLineBreak +
    '    border: none;' + sLineBreak +
    '    position: sticky;' + sLineBreak +
    '    top: 0;' + sLineBreak +
    '    z-index: 1;' + sLineBreak +
    '}';
end;

class function THTMLTableCSS.GetTableContentCSS: string;
begin
  Result :=
    '.table td {' + sLineBreak +
    '    padding: 1rem 0.75rem;' + sLineBreak +
    '    vertical-align: middle;' + sLineBreak +
    '    border-bottom: 1px solid rgba(0,0,0,0.05);' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.table tbody tr {' + sLineBreak +
    '    transition: all 0.2s;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.table tbody tr:hover {' + sLineBreak +
    '    background-color: rgba(78, 115, 223, 0.05);' + sLineBreak +
    '    transform: translateY(-1px);' + sLineBreak +
    '}';
end;

class function THTMLTableCSS.GetTableStatusCSS: string;
begin
  Result :=
    '.status-badge {' + sLineBreak +
    '    padding: 0.35rem 0.75rem;' + sLineBreak +
    '    border-radius: 50rem;' + sLineBreak +
    '    font-size: 0.75rem;' + sLineBreak +
    '    font-weight: 600;' + sLineBreak +
    '    text-transform: uppercase;' + sLineBreak +
    '    letter-spacing: 0.5px;' + sLineBreak +
    '    white-space: nowrap;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.status-concluido {' + sLineBreak +
    '    background-color: rgba(28, 200, 138, 0.1);' + sLineBreak +
    '    color: #1cc88a;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.status-pendente {' + sLineBreak +
    '    background-color: rgba(246, 194, 62, 0.1);' + sLineBreak +
    '    color: #f6c23e;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.status-cancelado {' + sLineBreak +
    '    background-color: rgba(231, 74, 59, 0.1);' + sLineBreak +
    '    color: #e74a3b;' + sLineBreak +
    '}';
end;

class function THTMLTableCSS.GetTableResponsiveCSS: string;
begin
  Result :=
    '@media (max-width: 768px) {' + sLineBreak +
    '    .table-container {' + sLineBreak +
    '        margin: 0 -1rem;' + sLineBreak +
    '    }' + sLineBreak +
    '    ' + sLineBreak +
    '    .description-cell {' + sLineBreak +
    '        max-width: 250px;' + sLineBreak +
    '    }' + sLineBreak +
    '}';
end;

end.

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
    class function GetTableStatusCSS: string; // Adicionado novamente
  end;

implementation

class function THTMLTableCSS.GetTableCSS: string;
begin
  Result :=
    ':root {' + sLineBreak +
    '  --primary-color: #4e73df;' + sLineBreak +
    '  --text-color: #333;' + sLineBreak +
    '  --border-color: rgba(0,0,0,0.05);' + sLineBreak +
    '  --success-color: #1cc88a;' + sLineBreak +
    '  --warning-color: #f6c23e;' + sLineBreak +
    '  --danger-color: #e74a3b;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.table-section {' + sLineBreak +
    '  background: white;' + sLineBreak +
    '  border-radius: 0.5rem;' + sLineBreak +
    '  box-shadow: 0 0.15rem 1.75rem rgba(58, 59, 69, 0.15);' + sLineBreak +
    '  margin-bottom: 1.5rem;' + sLineBreak +
    '  overflow: hidden;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.table {' + sLineBreak +
    '  width: 100%;' + sLineBreak +
    '  margin-bottom: 0;' + sLineBreak +
    '  font-size: 0.875rem;' + sLineBreak +
    '  border-collapse: collapse;' + sLineBreak +
    '}';
end;

class function THTMLTableCSS.GetTableHeaderCSS: string;
begin
  Result :=
    '.table-header {' + sLineBreak +
    '  padding: 1rem;' + sLineBreak +
    '  background-color: white;' + sLineBreak +
    '  border-bottom: 1px solid var(--border-color);' + sLineBreak +
    '  display: flex;' + sLineBreak +
    '  justify-content: space-between;' + sLineBreak +
    '  align-items: center;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.table th {' + sLineBreak +
    '  background-color: var(--primary-color);' + sLineBreak +
    '  color: white;' + sLineBreak +
    '  font-weight: 500;' + sLineBreak +
    '  padding: 0.75rem;' + sLineBreak +
    '  white-space: nowrap;' + sLineBreak +
    '  border: none;' + sLineBreak +
    '  position: sticky;' + sLineBreak +
    '  top: 0;' + sLineBreak +
    '  z-index: 1;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.table-header h5 {' + sLineBreak +
    '  margin: 0;' + sLineBreak +
    '  color: var(--text-color);' + sLineBreak +
    '  font-size: 1.1rem;' + sLineBreak +
    '}';
end;

class function THTMLTableCSS.GetTableContentCSS: string;
begin
  Result :=
    '.table td {' + sLineBreak +
    '  padding: 1rem 0.75rem;' + sLineBreak +
    '  vertical-align: middle;' + sLineBreak +
    '  border-bottom: 1px solid var(--border-color);' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.table tbody tr {' + sLineBreak +
    '  transition: all 0.2s;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.table tbody tr:hover {' + sLineBreak +
    '  background-color: rgba(78, 115, 223, 0.05);' + sLineBreak +
    '  transform: translateY(-1px);' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.table-container {' + sLineBreak +
    '  overflow-x: auto;' + sLineBreak +
    '  margin: 0;' + sLineBreak +
    '  padding: 0.5rem;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.money-cell {' + sLineBreak +
    '  text-align: right;' + sLineBreak +
    '  font-family: monospace;' + sLineBreak +
    '  white-space: nowrap;' + sLineBreak +
    '}';
end;

class function THTMLTableCSS.GetTableStatusCSS: string;
begin
  Result :=
    '.status-badge {' + sLineBreak +
    '  padding: 0.35rem 0.75rem;' + sLineBreak +
    '  border-radius: 50rem;' + sLineBreak +
    '  font-size: 0.75rem;' + sLineBreak +
    '  font-weight: 600;' + sLineBreak +
    '  text-transform: uppercase;' + sLineBreak +
    '  letter-spacing: 0.5px;' + sLineBreak +
    '  white-space: nowrap;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.status-concluido {' + sLineBreak +
    '  background-color: rgba(28, 200, 138, 0.1);' + sLineBreak +
    '  color: var(--success-color);' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.status-pendente {' + sLineBreak +
    '  background-color: rgba(246, 194, 62, 0.1);' + sLineBreak +
    '  color: var(--warning-color);' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    '.status-cancelado {' + sLineBreak +
    '  background-color: rgba(231, 74, 59, 0.1);' + sLineBreak +
    '  color: var(--danger-color);' + sLineBreak +
    '}';
end;

class function THTMLTableCSS.GetTableResponsiveCSS: string;
begin
  Result :=
    '@media (max-width: 768px) {' + sLineBreak +
    '  .table-container {' + sLineBreak +
    '    margin: 0 -1rem;' + sLineBreak +
    '  }' + sLineBreak +
    '' + sLineBreak +
    '  .table td {' + sLineBreak +
    '    padding: 0.75rem 0.5rem;' + sLineBreak +
    '  }' + sLineBreak +
    '' + sLineBreak +
    '  .table th {' + sLineBreak +
    '    padding: 0.75rem 0.5rem;' + sLineBreak +
    '  }' + sLineBreak +
    '}';
end;

end.

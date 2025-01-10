unit uHTMLTableManager;

interface

uses
  System.SysUtils, System.Classes;

type
  TTableColumn = record
    Field: string;
    Caption: string;
    Width: string;
    Align: string;
    Format: string;
  end;

  THTMLTableManager = class
  private
    class function GetTableStructure: string;
    class function GetTableScript: string;
    class function GetTableInitializationScript: string;
    class function GetDefaultColumns: TArray<TTableColumn>;
    class function GetColumnDefinitions: string;
    class function GetDataProcessingScript: string;
    class function GetPaginationScript: string;
    class function GetSortingScript: string;
    class function GetExportScript: string;
  public
    class function Generate: string;
  end;

implementation

class function THTMLTableManager.GetDefaultColumns: TArray<TTableColumn>;
begin
  SetLength(Result, 5);

  // Data
  Result[0].Field := 'DATA';
  Result[0].Caption := 'Data';
  Result[0].Width := '120px';
  Result[0].Align := 'left';
  Result[0].Format := 'date';

  // Loja
  Result[1].Field := 'ID_LOJA';
  Result[1].Caption := 'Loja';
  Result[1].Width := '200px';
  Result[1].Align := 'left';
  Result[1].Format := 'store';

  // Região
  Result[2].Field := 'ID_REGIAO';
  Result[2].Caption := 'Região';
  Result[2].Width := '150px';
  Result[2].Align := 'left';
  Result[2].Format := 'region';

  // Vendedor
  Result[3].Field := 'VENDEDOR';
  Result[3].Caption := 'Vendedor';
  Result[3].Width := '200px';
  Result[3].Align := 'left';
  Result[3].Format := 'text';

  // Subtotal
  Result[4].Field := 'SUBTOTAL';
  Result[4].Caption := 'Valor';
  Result[4].Width := '120px';
  Result[4].Align := 'right';
  Result[4].Format := 'money';
end;

class function THTMLTableManager.GetTableStructure: string;
begin
  Result :=
    '<section class="table-section">' + sLineBreak +
    '  <div class="table-header">' + sLineBreak +
    '    <h5>Lista de Vendas</h5>' + sLineBreak +
    '    <button id="exportBtn" class="btn btn-outline-primary btn-sm">' + sLineBreak +
    '      <i class="fas fa-download me-1"></i> Exportar' + sLineBreak +
    '    </button>' + sLineBreak +
    '  </div>' + sLineBreak +
    '  <div class="table-container">' + sLineBreak +
    '    <table class="table">' + sLineBreak +
    '      <thead>' + sLineBreak +
    '        <tr>' + sLineBreak +
    GetColumnDefinitions + sLineBreak +
    '        </tr>' + sLineBreak +
    '      </thead>' + sLineBreak +
    '      <tbody id="tableBody"></tbody>' + sLineBreak +
    '    </table>' + sLineBreak +
    '  </div>' + sLineBreak +
    '  <nav class="pagination" id="tablePagination"></nav>' + sLineBreak +
    '</section>';
end;

class function THTMLTableManager.GetColumnDefinitions: string;
var
  Columns: TArray<TTableColumn>;
  Column: TTableColumn;
  ColumnHTML: TStringBuilder;
begin
  Columns := GetDefaultColumns;
  ColumnHTML := TStringBuilder.Create;
  try
    for Column in Columns do
    begin
      ColumnHTML.AppendLine(Format(
        '          <th style="width: %s; text-align: %s;" data-field="%s" data-format="%s">%s</th>',
        [Column.Width, Column.Align, Column.Field, Column.Format, Column.Caption]
      ));
    end;
    Result := ColumnHTML.ToString;
  finally
    ColumnHTML.Free;
  end;
end;

class function THTMLTableManager.GetTableScript: string;
begin
  Result :=
    'class TableManager {' + sLineBreak +
    '  constructor() {' + sLineBreak +
    '    this.tableBody = document.getElementById("tableBody");' + sLineBreak +
    '    this.pagination = document.getElementById("tablePagination");' + sLineBreak +
    '    this.itemsPerPage = 10;' + sLineBreak +
    '    this.currentPage = 1;' + sLineBreak +
    '    this.sortField = null;' + sLineBreak +
    '    this.sortDirection = "asc";' + sLineBreak +
    '    this.initializeEvents();' + sLineBreak +
    '  }' + sLineBreak +
    '' + sLineBreak +
    GetDataProcessingScript + sLineBreak +
    GetPaginationScript + sLineBreak +
    GetSortingScript + sLineBreak +
    GetExportScript + sLineBreak +
    '}';
end;

class function THTMLTableManager.GetDataProcessingScript: string;
begin
  Result :=
    '  processData(data) {' + sLineBreak +
    '    return data.map(item => ({' + sLineBreak +
    '      data: new Date(item.DATA).toLocaleDateString(),' + sLineBreak +
    '      loja: `${item.ID_LOJA} - ${item.LOJA}`,' + sLineBreak +
    '      regiao: `${item.ID_REGIAO} - ${item.REGIAO}`,' + sLineBreak +
    '      vendedor: item.VENDEDOR,' + sLineBreak +
    '      subtotal: formatMoney(item.SUBTOTAL)' + sLineBreak +
    '    }));' + sLineBreak +
    '  }' + sLineBreak +
    '' + sLineBreak +
    '  renderTable(data) {' + sLineBreak +
    '    const processedData = this.processData(data);' + sLineBreak +
    '    const start = (this.currentPage - 1) * this.itemsPerPage;' + sLineBreak +
    '    const end = start + this.itemsPerPage;' + sLineBreak +
    '    const pageData = processedData.slice(start, end);' + sLineBreak +
    '' + sLineBreak +
    '    this.tableBody.innerHTML = pageData.map(item => `' + sLineBreak +
    '      <tr>' + sLineBreak +
    '        <td>${item.data}</td>' + sLineBreak +
    '        <td>${item.loja}</td>' + sLineBreak +
    '        <td>${item.regiao}</td>' + sLineBreak +
    '        <td>${item.vendedor}</td>' + sLineBreak +
    '        <td class="money-cell">${item.subtotal}</td>' + sLineBreak +
    '      </tr>' + sLineBreak +
    '    `).join("");' + sLineBreak +
    '' + sLineBreak +
    '    this.updatePagination(data.length);' + sLineBreak +
    '  }';
end;

class function THTMLTableManager.GetPaginationScript: string;
begin
  Result :=
    '  updatePagination(totalItems) {' + sLineBreak +
    '    const totalPages = Math.ceil(totalItems / this.itemsPerPage);' + sLineBreak +
    '    this.pagination.innerHTML = `' + sLineBreak +
    '      <button class="btn btn-sm btn-outline-primary" ${this.currentPage === 1 ? "disabled" : ""} ' + sLineBreak +
    '              onclick="tableManager.goToPage(${this.currentPage - 1})">' + sLineBreak +
    '        Anterior' + sLineBreak +
    '      </button>' + sLineBreak +
    '      <span class="mx-3">Página ${this.currentPage} de ${totalPages}</span>' + sLineBreak +
    '      <button class="btn btn-sm btn-outline-primary" ${this.currentPage === totalPages ? "disabled" : ""} ' + sLineBreak +
    '              onclick="tableManager.goToPage(${this.currentPage + 1})">' + sLineBreak +
    '        Próxima' + sLineBreak +
    '      </button>' + sLineBreak +
    '    `;' + sLineBreak +
    '  }' + sLineBreak +
    '' + sLineBreak +
    '  goToPage(page) {' + sLineBreak +
    '    this.currentPage = page;' + sLineBreak +
    '    this.renderTable(this.currentData);' + sLineBreak +
    '  }';
end;

class function THTMLTableManager.GetSortingScript: string;
begin
  Result :=
    '  initializeEvents() {' + sLineBreak +
    '    document.querySelectorAll("th[data-field]").forEach(th => {' + sLineBreak +
    '      th.addEventListener("click", () => this.sortBy(th.dataset.field));' + sLineBreak +
    '    });' + sLineBreak +
    '  }' + sLineBreak +
    '' + sLineBreak +
    '  sortBy(field) {' + sLineBreak +
    '    this.sortDirection = this.sortField === field && this.sortDirection === "asc" ? "desc" : "asc";' + sLineBreak +
    '    this.sortField = field;' + sLineBreak +
    '' + sLineBreak +
    '    this.currentData.sort((a, b) => {' + sLineBreak +
    '      const aValue = a[field];' + sLineBreak +
    '      const bValue = b[field];' + sLineBreak +
    '      return this.sortDirection === "asc" ? ' + sLineBreak +
    '        (aValue > bValue ? 1 : -1) : ' + sLineBreak +
    '        (aValue < bValue ? 1 : -1);' + sLineBreak +
    '    });' + sLineBreak +
    '' + sLineBreak +
    '    this.renderTable(this.currentData);' + sLineBreak +
    '  }';
end;

class function THTMLTableManager.GetExportScript: string;
begin
  Result :=
    '  exportToCSV() {' + sLineBreak +
    '    const processedData = this.processData(this.currentData);' + sLineBreak +
    '    const headers = ["Data", "Loja", "Região", "Vendedor", "Valor"];' + sLineBreak +
    '    const csvContent = [' + sLineBreak +
    '      headers.join(";"),' + sLineBreak +
    '      ...processedData.map(row => [' + sLineBreak +
    '        row.data,' + sLineBreak +
    '        row.loja,' + sLineBreak +
    '        row.regiao,' + sLineBreak +
    '        row.vendedor,' + sLineBreak +
    '        row.subtotal' + sLineBreak +
    '      ].join(";"))' + sLineBreak +
    '    ].join("\n");' + sLineBreak +
    '' + sLineBreak +
    '    const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });' + sLineBreak +
    '    const link = document.createElement("a");' + sLineBreak +
    '    link.href = URL.createObjectURL(blob);' + sLineBreak +
    '    link.download = "vendas.csv";' + sLineBreak +
    '    link.click();' + sLineBreak +
    '  }';
end;

class function THTMLTableManager.GetTableInitializationScript: string;
begin
  Result :=
    'document.addEventListener("DOMContentLoaded", () => {' + sLineBreak +
    '  window.tableManager = new TableManager();' + sLineBreak +
    '  document.getElementById("exportBtn").addEventListener("click", () => tableManager.exportToCSV());' + sLineBreak +
    '});';
end;

class function THTMLTableManager.Generate: string;
begin
  Result :=
    GetTableStructure + sLineBreak +
    '<script>' + sLineBreak +
    GetTableScript + sLineBreak +
    GetTableInitializationScript + sLineBreak +
    '</script>';
end;

end.

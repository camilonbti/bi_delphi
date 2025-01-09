unit uTemplateHTML;

interface

uses
  System.SysUtils, Data.DB;

const
  HTML_TEMPLATE =
    '<!DOCTYPE html>' + sLineBreak +
    '<html lang="pt-BR">' + sLineBreak +
    '<head>' + sLineBreak +
    '{%META%}' + sLineBreak +
    '{%CSS%}' + sLineBreak +
    '</head>' + sLineBreak +
    '<body>' + sLineBreak +
    '<div class="container">' + sLineBreak +
    '{%TABLE%}' + sLineBreak +
    '</div>' + sLineBreak +
    '</body>' + sLineBreak +
    '</html>';

implementation

end.

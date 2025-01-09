unit HtmlGenerator_JS_Utils;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorJSUtils = class
  public
    class function GerarJSUtils: string;
  end;

implementation

class function THtmlGeneratorJSUtils.GerarJSUtils: string;
begin
  Result :=
    'const utils = {' + sLineBreak +
    '    formatCurrency(value) {' + sLineBreak +
    '        return new Intl.NumberFormat("pt-BR", {' + sLineBreak +
    '            style: "currency",' + sLineBreak +
    '            currency: "BRL"' + sLineBreak +
    '        }).format(value);' + sLineBreak +
    '    },' + sLineBreak +
    '' + sLineBreak +
    '    formatNumber(value) {' + sLineBreak +
    '        return new Intl.NumberFormat("pt-BR").format(value);' + sLineBreak +
    '    },' + sLineBreak +
    '' + sLineBreak +
    '    formatPercent(value) {' + sLineBreak +
    '        return new Intl.NumberFormat("pt-BR", {' + sLineBreak +
    '            style: "percent",' + sLineBreak +
    '            minimumFractionDigits: 2,' + sLineBreak +
    '            maximumFractionDigits: 2' + sLineBreak +
    '        }).format(value);' + sLineBreak +
    '    },' + sLineBreak +
    '' + sLineBreak +
    '    debounce(func, wait) {' + sLineBreak +
    '        let timeout;' + sLineBreak +
    '        return function executedFunction(...args) {' + sLineBreak +
    '            const later = () => {' + sLineBreak +
    '                clearTimeout(timeout);' + sLineBreak +
    '                func(...args);' + sLineBreak +
    '            };' + sLineBreak +
    '            clearTimeout(timeout);' + sLineBreak +
    '            timeout = setTimeout(later, wait);' + sLineBreak +
    '        };' + sLineBreak +
    '    }' + sLineBreak +
    '};';
end;

end.

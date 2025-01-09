unit HtmlGenerator_CSS;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorCSS = class
  public
    class function GerarCSS: string;
  end;

implementation

class function THtmlGeneratorCSS.GerarCSS: string;
begin
  Result :=
    '<style>' + sLineBreak +
    '    body {' + sLineBreak +
    '        font-family: Arial, sans-serif;' + sLineBreak +
    '        margin: 0;' + sLineBreak +
    '        padding: 20px;' + sLineBreak +
    '        background-color: #f0f0f0;' + sLineBreak +
    '        color: #333;' + sLineBreak +
    '    }' + sLineBreak +
    '    main {' + sLineBreak +
    '        max-width: 1200px;' + sLineBreak +
    '        margin: 0 auto;' + sLineBreak +
    '        background-color: white;' + sLineBreak +
    '        padding: 20px;' + sLineBreak +
    '        border-radius: 8px;' + sLineBreak +
    '        box-shadow: 0 0 10px rgba(0,0,0,0.1);' + sLineBreak +
    '    }' + sLineBreak +
    '    h1 {' + sLineBreak +
    '        color: #333;' + sLineBreak +
    '        text-align: center;' + sLineBreak +
    '    }' + sLineBreak +
    '    .filters {' + sLineBreak +
    '        display: flex;' + sLineBreak +
    '        gap: 10px;' + sLineBreak +
    '        margin-bottom: 20px;' + sLineBreak +
    '        justify-content: center;' + sLineBreak +
    '        flex-wrap: wrap;' + sLineBreak +
    '    }' + sLineBreak +
    '    .filter-item {' + sLineBreak +
    '        background-color: #007bff;' + sLineBreak +
    '        color: white;' + sLineBreak +
    '        padding: 5px 10px;' + sLineBreak +
    '        border-radius: 4px;' + sLineBreak +
    '        margin: 5px;' + sLineBreak +
    '        cursor: pointer;' + sLineBreak +
    '        display: flex;' + sLineBreak +
    '        align-items: center;' + sLineBreak +
    '    }' + sLineBreak +
    '    .filter-item span {' + sLineBreak +
    '        margin-left: 5px;' + sLineBreak +
    '        font-weight: bold;' + sLineBreak +
    '        cursor: pointer;' + sLineBreak +
    '    }' + sLineBreak +
    '    .kpis {' + sLineBreak +
    '        display: flex;' + sLineBreak +
    '        justify-content: space-between;' + sLineBreak +
    '        margin-bottom: 30px;' + sLineBreak +
    '        flex-wrap: nowrap;' + sLineBreak +
    '    }' + sLineBreak +
    '    .kpi-card {' + sLineBreak +
    '        background-color: #e9ecef;' + sLineBreak +
    '        padding: 15px;' + sLineBreak +
    '        border-radius: 8px;' + sLineBreak +
    '        text-align: center;' + sLineBreak +
    '        flex: 1;' + sLineBreak +
    '        margin: 10px;' + sLineBreak +
    '        min-width: 150px;' + sLineBreak +
    '        position: relative;' + sLineBreak +
    '    }' + sLineBreak +
    '    .kpi-card h3, .kpi-card p {' + sLineBreak +
    '        color: #333;' + sLineBreak +
    '    }' + sLineBreak +
    '    .charts {' + sLineBreak +
    '        display: flex;' + sLineBreak +
    '        gap: 20px;' + sLineBreak +
    '        margin-bottom: 30px;' + sLineBreak +
    '        flex-wrap: wrap;' + sLineBreak +
    '        justify-content: space-around;' + sLineBreak +
    '    }' + sLineBreak +
    '    .chart-container {' + sLineBreak +
    '        flex: 1 1 45%;' + sLineBreak +
    '        min-width: 300px;' + sLineBreak +
    '        max-width: 600px;' + sLineBreak +
    '        height: 400px;' + sLineBreak +
    '        background-color: white;' + sLineBreak +
    '        padding: 15px;' + sLineBreak +
    '        border-radius: 8px;' + sLineBreak +
    '        box-shadow: 0 0 5px rgba(0,0,0,0.1);' + sLineBreak +
    '        position: relative;' + sLineBreak +
    '    }' + sLineBreak +
    '    table {' + sLineBreak +
    '        width: 100%;' + sLineBreak +
    '        border-collapse: separate;' + sLineBreak +
    '        border-spacing: 0 10px;' + sLineBreak +
    '        font-size: 14px;' + sLineBreak +
    '    }' + sLineBreak +
    '    th, td {' + sLineBreak +
    '        text-align: left;' + sLineBreak +
    '        padding: 10px;' + sLineBreak +
    '    }' + sLineBreak +
    '    th {' + sLineBreak +
    '        background-color: #007bff;' + sLineBreak +
    '        color: white;' + sLineBreak +
    '    }' + sLineBreak +
    '    td {' + sLineBreak +
    '        background-color: #f8f9fa;' + sLineBreak +
    '        border-bottom: 1px solid #ddd;' + sLineBreak +
    '    }' + sLineBreak +
    '    #exportButton {' + sLineBreak +
    '        background-color: #007bff;' + sLineBreak +
    '        color: white;' + sLineBreak +
    '        padding: 10px 20px;' + sLineBreak +
    '        border: none;' + sLineBreak +
    '        border-radius: 4px;' + sLineBreak +
    '        cursor: pointer;' + sLineBreak +
    '        display: block;' + sLineBreak +
    '        margin: 20px auto 0;' + sLineBreak +
    '    }' + sLineBreak +
    '    #exportButton:hover {' + sLineBreak +
    '        background-color: #0056b3;' + sLineBreak +
    '    }' + sLineBreak +
    '    .pagination {' + sLineBreak +
    '        display: flex;' + sLineBreak +
    '        justify-content: center;' + sLineBreak +
    '        margin-top: 20px;' + sLineBreak +
    '    }' + sLineBreak +
    '    .pagination button {' + sLineBreak +
    '        background-color: #007bff;' + sLineBreak +
    '        color: white;' + sLineBreak +
    '        padding: 5px 10px;' + sLineBreak +
    '        border: none;' + sLineBreak +
    '        border-radius: 4px;' + sLineBreak +
    '        cursor: pointer;' + sLineBreak +
    '        margin: 0 5px;' + sLineBreak +
    '    }' + sLineBreak +
    '    .pagination button.disabled {' + sLineBreak +
    '        background-color: #ddd;' + sLineBreak +
    '        cursor: not-allowed;' + sLineBreak +
    '    }' + sLineBreak +
    '    @media (max-width: 768px) {' + sLineBreak +
    '        .kpis {' + sLineBreak +
    '            flex-wrap: wrap;' + sLineBreak +
    '        }' + sLineBreak +
    '        .kpi-card {' + sLineBreak +
    '            flex: 1 1 100%;' + sLineBreak +
    '            max-width: 100%;' + sLineBreak +
    '        }' + sLineBreak +
    '        .charts {' + sLineBreak +
    '            flex-direction: column;' + sLineBreak +
    '            align-items: center;' + sLineBreak +
    '        }' + sLineBreak +
    '    }' + sLineBreak +
    '</style>';
end;

end.

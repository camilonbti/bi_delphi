unit HtmlGenerator_JS_Charts;

interface

uses
 System.Classes, System.SysUtils;

type
 TChartType = (ctBar, ctPie);

 TChartConfig = record
   ChartId: string;
   Title: string;
   ChartType: TChartType;
   FieldId: string;
   FieldLabel: string;
   FieldValue: string;
   FilterName: string;
 end;

 THtmlGeneratorJSCharts = class
 private
   class function GetChartTypeString(ChartType: TChartType): string;
 public
   class function GerarGrafico(const Config: TChartConfig): string;
 end;

implementation

class function THtmlGeneratorJSCharts.GetChartTypeString(ChartType: TChartType): string;
begin
 if ChartType = ctBar then
   Result := 'bar'
 else
   Result := 'pie';
end;

class function THtmlGeneratorJSCharts.GerarGrafico(const Config: TChartConfig): string;
var
 JS: TStringList;
begin
 JS := TStringList.Create;
 try
   JS.Add(Format('            const salesBy%s = filteredData.reduce((acc, item) => {', [Config.ChartId]));
   JS.Add('                if (!acc[item.' + Config.FieldId + ']) {');
   JS.Add('                    acc[item.' + Config.FieldId + '] = { label: item.' + Config.FieldLabel +
         ', id: item.' + Config.FieldId + ', value: 0 };');
   JS.Add('                }');
   JS.Add('                acc[item.' + Config.FieldId + '].value += item.' + Config.FieldValue + ';');
   JS.Add('                return acc;');
   JS.Add('            }, {});');
   JS.Add('');

   JS.Add(Format('            const %sEntries = Object.values(salesBy%s).sort((a, b) => b.value - a.value);',
       [LowerCase(Config.ChartId), Config.ChartId]));
   JS.Add(Format('            const %sLabels = %sEntries.map(entry => entry.label);',
       [LowerCase(Config.ChartId), LowerCase(Config.ChartId)]));
   JS.Add(Format('            const %sData = %sEntries.map(entry => entry.value);',
       [LowerCase(Config.ChartId), LowerCase(Config.ChartId)]));
   JS.Add('');

   JS.Add(Format('            assignColors(%sLabels, %sColors);',
       [LowerCase(Config.ChartId), LowerCase(Config.ChartId)]));
   JS.Add(Format('            const %sColorsArray = %sLabels.map(label => %sColors[label]);',
       [LowerCase(Config.ChartId), LowerCase(Config.ChartId), LowerCase(Config.ChartId)]));
   JS.Add('');

   JS.Add(Format('            if (salesBy%sChart) {', [Config.ChartId]));
   JS.Add(Format('                salesBy%sChart.destroy();', [Config.ChartId]));
   JS.Add('            }');
   JS.Add('');

   JS.Add(Format('            const ctx%s = document.getElementById("salesBy%sChart").getContext("2d");',
       [Config.ChartId, Config.ChartId]));
   JS.Add('');
   JS.Add(Format('            salesBy%sChart = new Chart(ctx%s, {', [Config.ChartId, Config.ChartId]));
   JS.Add(Format('                type: ''%s'',', [GetChartTypeString(Config.ChartType)]));
   JS.Add('                data: {');
   JS.Add(Format('                    labels: %sLabels,', [LowerCase(Config.ChartId)]));
   JS.Add('                    datasets: [{');
   if Config.ChartType = ctBar then
     JS.Add(Format('                        label: ''%s'',', [Config.Title]));
   JS.Add(Format('                        data: %sData,', [LowerCase(Config.ChartId)]));
   JS.Add(Format('                        backgroundColor: %sColorsArray,', [LowerCase(Config.ChartId)]));
   JS.Add('                    }]');
   JS.Add('                },');
   JS.Add('                options: {');
   JS.Add('                    responsive: true,');
   JS.Add('                    maintainAspectRatio: false,');

   if Config.ChartType = ctBar then begin
     JS.Add('                    scales: {');
     JS.Add('                        x: {');
     JS.Add('                            ticks: {');
     JS.Add('                                maxRotation: 45,');
     JS.Add('                                minRotation: 45,');
     JS.Add('                                autoSkip: true');
     JS.Add('                            }');
     JS.Add('                        },');
     JS.Add('                        y: {');
     JS.Add('                            beginAtZero: true');
     JS.Add('                        }');
     JS.Add('                    },');
   end;

   JS.Add('                    animation: {');
   JS.Add('                        duration: 1000,');
   JS.Add('                        easing: ''easeInOutQuad''');
   JS.Add('                    },');
   JS.Add('                    plugins: {');
   JS.Add('                        tooltip: {');
   JS.Add('                            callbacks: {');
   JS.Add('                                label: function(context) {');
   JS.Add('                                    let label = context.dataset.label || '''';');
   JS.Add('                                    if (label) {');
   JS.Add('                                        label += '': '';');
   JS.Add('                                    }');
   JS.Add('                                    label += new Intl.NumberFormat(''pt-BR'', { style: ''currency'', currency: ''BRL'' }).format(context.raw);');
   JS.Add('                                    return label;');
   JS.Add('                                }');
   JS.Add('                            }');
   JS.Add('                        },');
   JS.Add('                        title: {');
   JS.Add('                            display: true,');
   JS.Add(Format('                            text: ''%s'',', [Config.Title]));
   JS.Add('                            font: {');
   JS.Add('                                size: 18');
   JS.Add('                            }');
   JS.Add('                        },');
   JS.Add('                        legend: {');
   JS.Add('                            display: true,');
   JS.Add('                            position: ''bottom'',');
   JS.Add('                            labels: {');
   JS.Add('                                fontSize: 14,');
   JS.Add('                                boxWidth: 20');
   JS.Add('                            }');
   JS.Add('                        }');
   JS.Add('                    },');
   JS.Add('                    onClick: (e, elements) => {');
   JS.Add('                        if (elements.length > 0) {');
   JS.Add('                            const index = elements[0].index;');
   JS.Add(Format('                            const item = %sEntries[index];', [LowerCase(Config.ChartId)]));
   JS.Add(Format('                            toggleFilter(''%s'', item.id);', [Config.FilterName]));
   JS.Add('                        }');
   JS.Add('                    }');
   JS.Add('                }');
   JS.Add('            });');
   JS.Add('');

   Result := JS.Text;
 finally
   JS.Free;
 end;
end;

end.

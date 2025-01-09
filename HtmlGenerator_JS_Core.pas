unit HtmlGenerator_JS_Core;

interface

uses
  System.Classes, System.SysUtils;

type
  THtmlGeneratorJSCore = class
  public
    class function GerarJSCore: string;
  end;

implementation

class function THtmlGeneratorJSCore.GerarJSCore: string;
begin
  Result :=
    '        // Configurações globais' + sLineBreak +
    '        let charts = {};' + sLineBreak +
    '        const chartColors = [' + sLineBreak +
    '            "#FF9999", "#66B2FF", "#99FF99", "#FFCC99", "#FF99CC", "#99CCFF",' + sLineBreak +
    '            "#FFB366", "#99FF99", "#FF99FF", "#99FFCC"' + sLineBreak +
    '        ];' + sLineBreak +
    '' + sLineBreak +
    '        // Inicialização' + sLineBreak +
    '        document.addEventListener("DOMContentLoaded", () => {' + sLineBreak +
    '            initializeData();' + sLineBreak +
    '            initializeCharts();' + sLineBreak +
    '            initializeFilters();' + sLineBreak +
    '            updateDashboard();' + sLineBreak +
    '        });' + sLineBreak +
    '' + sLineBreak +
    '        function initializeData() {' + sLineBreak +
    '            window.dashboardData = {' + sLineBreak +
    '                rawData: mockData,' + sLineBreak +
    '                filteredData: [...mockData]' + sLineBreak +
    '            };' + sLineBreak +
    '        }' + sLineBreak +
    '' + sLineBreak +
    '        function initializeCharts() {' + sLineBreak +
    '            const chartConfigs = {' + sLineBreak +
    '                vendasPorRegiao: { type: "bar" },' + sLineBreak +
    '                vendasPorLoja: { type: "bar" },' + sLineBreak +
    '                vendasPorGrupo: { type: "pie" },' + sLineBreak +
    '                vendasPorSubgrupo: { type: "pie" },' + sLineBreak +
    '                vendasPorMarca: { type: "bar" },' + sLineBreak +
    '                vendasPorVendedor: { type: "bar" }' + sLineBreak +
    '            };' + sLineBreak +
    '' + sLineBreak +
    '            Object.entries(chartConfigs).forEach(([chartId, config]) => {' + sLineBreak +
    '                const ctx = document.getElementById(chartId).getContext("2d");' + sLineBreak +
    '                charts[chartId] = new Chart(ctx, {' + sLineBreak +
    '                    type: config.type,' + sLineBreak +
    '                    data: {' + sLineBreak +
    '                        labels: [],' + sLineBreak +
    '                        datasets: [{' + sLineBreak +
    '                            data: [],' + sLineBreak +
    '                            backgroundColor: chartColors' + sLineBreak +
    '                        }]' + sLineBreak +
    '                    },' + sLineBreak +
    '                    options: {' + sLineBreak +
    '                        responsive: true,' + sLineBreak +
    '                        maintainAspectRatio: false,' + sLineBreak +
    '                        plugins: {' + sLineBreak +
    '                            legend: {' + sLineBreak +
    '                                position: "bottom"' + sLineBreak +
    '                            }' + sLineBreak +
    '                        }' + sLineBreak +
    '                    }' + sLineBreak +
    '                });' + sLineBreak +
    '            });' + sLineBreak +
    '        }' + sLineBreak +
    '' + sLineBreak +
    '        function updateDashboard() {' + sLineBreak +
    '            updateKPIs();' + sLineBreak +
    '            updateCharts();' + sLineBreak +
    '        }' + sLineBreak +
    '' + sLineBreak +
    '        function updateKPIs() {' + sLineBreak +
    '            const data = window.dashboardData.filteredData;' + sLineBreak +
    '            const totalVendas = data.reduce((sum, item) => sum + item.SUBTOTAL, 0);' + sLineBreak +
    '            const totalPedidos = new Set(data.map(item => item.ID_PEDIDO)).size;' + sLineBreak +
    '            const ticketMedio = totalVendas / totalPedidos;' + sLineBreak +
    '' + sLineBreak +
    '            document.getElementById("totalVendas").textContent = ' + sLineBreak +
    '                new Intl.NumberFormat("pt-BR", { style: "currency", currency: "BRL" })' + sLineBreak +
    '                    .format(totalVendas);' + sLineBreak +
    '' + sLineBreak +
    '            document.getElementById("ticketMedio").textContent = ' + sLineBreak +
    '                new Intl.NumberFormat("pt-BR", { style: "currency", currency: "BRL" })' + sLineBreak +
    '                    .format(ticketMedio);' + sLineBreak +
    '' + sLineBreak +
    '            document.getElementById("totalPedidos").textContent = totalPedidos;' + sLineBreak +
    '        }' + sLineBreak +
    '' + sLineBreak +
    '        function updateCharts() {' + sLineBreak +
    '            const data = window.dashboardData.filteredData;' + sLineBreak +
    '' + sLineBreak +
    '            // Atualiza cada gráfico' + sLineBreak +
    '            Object.entries(charts).forEach(([chartId, chart]) => {' + sLineBreak +
    '                const field = chartId.replace("vendasPor", "").toUpperCase();' + sLineBreak +
    '                const aggregated = aggregateData(data, field);' + sLineBreak +
    '' + sLineBreak +
    '                chart.data.labels = aggregated.map(item => item.label);' + sLineBreak +
    '                chart.data.datasets[0].data = aggregated.map(item => item.value);' + sLineBreak +
    '                chart.update();' + sLineBreak +
    '            });' + sLineBreak +
    '        }' + sLineBreak +
    '' + sLineBreak +
    '        function aggregateData(data, field) {' + sLineBreak +
    '            const aggregated = data.reduce((acc, item) => {' + sLineBreak +
    '                const key = item[field];' + sLineBreak +
    '                if (!acc[key]) acc[key] = 0;' + sLineBreak +
    '                acc[key] += item.SUBTOTAL;' + sLineBreak +
    '                return acc;' + sLineBreak +
    '            }, {});' + sLineBreak +
    '' + sLineBreak +
    '            return Object.entries(aggregated)' + sLineBreak +
    '                .map(([label, value]) => ({ label, value }))' + sLineBreak +
    '                .sort((a, b) => b.value - a.value);' + sLineBreak +
    '        }' + sLineBreak +
    '' + sLineBreak +
    '        function initializeFilters() {' + sLineBreak +
    '            const filters = {' + sLineBreak +
    '                regiao: document.getElementById("filtroRegiao"),' + sLineBreak +
    '                loja: document.getElementById("filtroLoja"),' + sLineBreak +
    '                grupo: document.getElementById("filtroGrupo"),' + sLineBreak +
    '                vendedor: document.getElementById("filtroVendedor")' + sLineBreak +
    '            };' + sLineBreak +
    '' + sLineBreak +
    '            Object.entries(filters).forEach(([key, select]) => {' + sLineBreak +
    '                const field = key.toUpperCase();' + sLineBreak +
    '                const values = [...new Set(mockData.map(item => item[field]))];' + sLineBreak +
    '' + sLineBreak +
    '                values.sort().forEach(value => {' + sLineBreak +
    '                    const option = document.createElement("option");' + sLineBreak +
    '                    option.value = value;' + sLineBreak +
    '                    option.textContent = value;' + sLineBreak +
    '                    select.appendChild(option);' + sLineBreak +
    '                });' + sLineBreak +
    '' + sLineBreak +
    '                select.addEventListener("change", applyFilters);' + sLineBreak +
    '            });' + sLineBreak +
    '        }' + sLineBreak +
    '' + sLineBreak +
    '        function applyFilters() {' + sLineBreak +
    '            const filters = {' + sLineBreak +
    '                REGIAO: document.getElementById("filtroRegiao").value,' + sLineBreak +
    '                LOJA: document.getElementById("filtroLoja").value,' + sLineBreak +
    '                GRUPO: document.getElementById("filtroGrupo").value,' + sLineBreak +
    '                VENDEDOR: document.getElementById("filtroVendedor").value' + sLineBreak +
    '            };' + sLineBreak +
    '' + sLineBreak +
    '            window.dashboardData.filteredData = window.dashboardData.rawData.filter(item => {' + sLineBreak +
    '                return Object.entries(filters).every(([field, value]) => {' + sLineBreak +
    '                    return !value || item[field] === value;' + sLineBreak +
    '                });' + sLineBreak +
    '            });' + sLineBreak +
    '' + sLineBreak +
    '            updateDashboard();' + sLineBreak +
    '        }';
end;

end.

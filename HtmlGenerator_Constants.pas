unit HtmlGenerator_Constants;

interface

const
  // IDs dos elementos
  ID_TOTAL_VENDAS = 'totalVendas';
  ID_TICKET_MEDIO = 'ticketMedio';
  ID_TOTAL_ITENS = 'totalItens';
  ID_FILTERS_CONTAINER = 'filtersContainer';
  ID_TABLE_CONTENT = 'tableContent';
  ID_PAGINATION = 'pagination';
  ID_PREV_PAGE = 'prevPage';
  ID_NEXT_PAGE = 'nextPage';
  ID_EXPORT_BUTTON = 'exportButton';

  // Classes CSS
  CSS_KPI_CARD = 'kpi-card';
  CSS_CHART_CONTAINER = 'chart-container';
  CSS_FILTER_ITEM = 'filter-item';
  CSS_TABLE_SECTION = 'table-section';
  CSS_PAGINATION = 'pagination';
  CSS_DISABLED = 'disabled';

  // Mensagens de Log
  LOG_INIT = 'Iniciando geração do HTML';
  LOG_HTML_SAVED = 'HTML salvo em: %s';
  LOG_DASHBOARD_LOADED = 'Dashboard carregado com sucesso';
  LOG_ERROR = 'Erro: %s';
  LOG_BROWSER_ERROR = 'Componente WebBrowser não está disponível';
  LOG_TIMEOUT = 'Timeout ao carregar o dashboard';

  // Timeouts e Configurações
  TIMEOUT_LOAD = 10000; // 10 segundos
  SLEEP_INTERVAL = 50;  // 50ms entre checks

implementation

end.

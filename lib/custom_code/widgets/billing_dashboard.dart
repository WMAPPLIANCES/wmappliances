// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import 'dart:math' as math;

// Classe auxiliar para dados de barras
class BarData {
  final String x;
  final double y;

  BarData(this.x, this.y);
}

class BillingDashboard extends StatefulWidget {
  const BillingDashboard({
    Key? key,
    this.width,
    this.height,
    this.onWorkOrderTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Function(String)? onWorkOrderTap;

  @override
  _BillingDashboardState createState() => _BillingDashboardState();
}

class _BillingDashboardState extends State<BillingDashboard>
    with TickerProviderStateMixin {
  // Animation controllers
  late AnimationController _chartAnimationController;
  late AnimationController _cardAnimationController;
  late AnimationController _tableAnimationController;

  // State variables
  String? _selectedStatus;
  bool _showLowRiskOnly = false;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  bool _showOverdueOnly = false;
  int _selectedTabIndex = 0;
  String? _sortOrder =
      'Newest First'; // Variável para controlar a ordem de exibição

  // Pagination variables
  int _currentPage = 0;
  int _itemsPerPage = 50; // 50 registros por página
  bool _hasMoreData = true; // Indica se há mais dados para carregar
  bool _isLoadingMoreData = false; // Indica se está carregando mais dados

  // Data loading state
  bool _isLoading = true;
  String? _errorMessage;

  // Data sources
  List<dynamic> _workOrdersList = [];
  List<dynamic> _pendingActionsList = [];

  // Filtered lists
  late List<dynamic> filteredWorkOrders;
  late List<dynamic> filteredPendingActions;

  // Paged lists
  List<dynamic> _pagedWorkOrders = [];
  List<dynamic> _pagedPendingActions = [];

  // Summary metrics
  double totalBilled = 0;
  double totalPaid = 0;
  double totalOverdue = 0;
  int riskCount = 0;

  // Yearly metrics
  double totalBilledYear = 0;
  double totalPaidYear = 0;

  // Monthly metrics
  double totalBilledMonth = 0;
  double totalPaidMonth = 0;

  // Controller para detectar quando o usuário chega ao final da lista
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _chartAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _cardAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _tableAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    // Inicializar ScrollController e adicionar listener para detectar o final da lista
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    // Load data from Supabase
    _loadData();
  }

  // Load dashboard data from Supabase
  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _currentPage = 0; // Reiniciar para a primeira página
      _hasMoreData = true; // Assumir que há mais dados
      _workOrdersList = []; // Limpar dados existentes
      _pendingActionsList = []; // Limpar dados existentes
    });

    try {
      // Carregar apenas a primeira página (50 registros)
      await _loadPagedData();

      // Initialize filtered data and start animations
      _filterData();
      _calculateSummaryMetrics();
      _updatePagedData();

      // Start animations sequentially
      Future.delayed(Duration(milliseconds: 100), () {
        _cardAnimationController.forward();
      });

      Future.delayed(Duration(milliseconds: 300), () {
        _chartAnimationController.forward();
      });

      Future.delayed(Duration(milliseconds: 500), () {
        _tableAnimationController.forward();
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error loading data: $e';
      });
    }
  }

  // Novo método para carregar dados paginados do servidor
  Future<void> _loadPagedData() async {
    if (_isLoadingMoreData || !_hasMoreData) return;

    setState(() {
      _isLoadingMoreData = true;
    });

    try {
      // Calcular o deslocamento (offset) com base na página atual
      final int offset = _currentPage * _itemsPerPage;

      // Carregar work orders paginados
      final workOrdersResponse = await SupaFlow.client
          .from('v_billing_dashboard')
          .select()
          .order('created_at', ascending: _sortOrder == 'Oldest First')
          .range(offset, offset + _itemsPerPage - 1);

      // Carregar pending actions paginados
      final pendingActionsResponse = await SupaFlow.client
          .from('v_pending_actions')
          .select()
          .not('payment_status', 'in', '("Paid","Cancelled")')
          .order('billing_date', ascending: _sortOrder == 'Oldest First')
          .range(offset, offset + _itemsPerPage - 1);

      setState(() {
        // Se já temos dados (não é a primeira página), adicionar os novos
        if (_currentPage > 0) {
          _workOrdersList.addAll(workOrdersResponse);
          _pendingActionsList.addAll(pendingActionsResponse);
        } else {
          // Se é a primeira página, substituir os dados
          _workOrdersList = workOrdersResponse;
          _pendingActionsList = pendingActionsResponse;
        }

        // Verificar se há mais dados para carregar
        _hasMoreData = workOrdersResponse.length == _itemsPerPage;

        _isLoadingMoreData = false;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingMoreData = false;
        _isLoading = false;
        _errorMessage = 'Error loading data: $e';
      });
    }
  }

  @override
  void dispose() {
    _chartAnimationController.dispose();
    _cardAnimationController.dispose();
    _tableAnimationController.dispose();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // Filter data based on selected filters
  void _filterData() {
    filteredWorkOrders = _workOrdersList.where((workOrder) {
      // Filter by payment status
      if (_selectedStatus != null &&
          workOrder['payment_status'] != _selectedStatus) {
        return false;
      }

      // Filter by low rating risk
      if (_showLowRiskOnly && !(workOrder['low_rating_risk'] ?? false)) {
        return false;
      }

      // Filter by overdue status
      if (_showOverdueOnly && !(workOrder['is_overdue'] ?? false)) {
        return false;
      }

      return true;
    }).toList();

    // Aplicar ordenação (usando _sortOrder diretamente, sem depender do filtro)
    if (_sortOrder == 'Oldest First') {
      filteredWorkOrders.sort((a, b) {
        final dateA = a['created_at'] != null
            ? DateTime.parse(a['created_at'])
            : DateTime.now();
        final dateB = b['created_at'] != null
            ? DateTime.parse(b['created_at'])
            : DateTime.now();
        return dateA.compareTo(dateB); // Ordem crescente (mais antigo primeiro)
      });
    } else {
      // A ordenação padrão já é decrescente (mais recente primeiro)
      filteredWorkOrders.sort((a, b) {
        final dateA = a['created_at'] != null
            ? DateTime.parse(a['created_at'])
            : DateTime.now();
        final dateB = b['created_at'] != null
            ? DateTime.parse(b['created_at'])
            : DateTime.now();
        return dateB
            .compareTo(dateA); // Ordem decrescente (mais recente primeiro)
      });
    }

    // Filter pending actions
    filteredPendingActions = _pendingActionsList.where((action) {
      // Filter by low rating risk
      if (_showLowRiskOnly && !(action['low_rating_risk'] ?? false)) {
        return false;
      }

      return true;
    }).toList();

    // Reset pagination when filters change
    _currentPage = 0;

    // Update paged data
    _updatePagedData();
  }

  // Update paged data based on current page
  void _updatePagedData() {
    final startIndex = _currentPage * _itemsPerPage;

    // Get paged work orders
    _pagedWorkOrders = [];
    for (int i = startIndex;
        i < startIndex + _itemsPerPage && i < filteredWorkOrders.length;
        i++) {
      _pagedWorkOrders.add(filteredWorkOrders[i]);
    }

    // Get paged pending actions
    _pagedPendingActions = [];
    for (int i = startIndex;
        i < startIndex + _itemsPerPage && i < filteredPendingActions.length;
        i++) {
      _pagedPendingActions.add(filteredPendingActions[i]);
    }
  }

  // Go to next page
  void _nextPage() {
    final totalPages = (_selectedTabIndex == 0
        ? (filteredWorkOrders.length / _itemsPerPage).ceil()
        : (filteredPendingActions.length / _itemsPerPage).ceil());

    if (_currentPage < totalPages - 1 || _hasMoreData) {
      setState(() {
        _currentPage++;

        // Se estamos na última página dos dados já carregados e há mais dados
        if (_currentPage >= totalPages - 1 && _hasMoreData) {
          _loadPagedData(); // Carregar mais dados do servidor
        }

        _updatePagedData();
      });
    }
  }

  // Go to previous page
  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _updatePagedData();
      });
    }
  }

  // Calculate summary metrics
  void _calculateSummaryMetrics() {
    // Resetar os totais
    totalBilled = 0;
    totalPaid = 0;
    totalOverdue = 0;
    riskCount = 0;

    // Resetar totais do ano e do mês
    totalBilledYear = 0;
    totalPaidYear = 0;
    totalBilledMonth = 0;
    totalPaidMonth = 0;

    // Obter o ano e mês atual
    final now = DateTime.now();
    final currentYear = now.year;
    final currentMonth = now.month;

    for (final workOrder in _workOrdersList) {
      final amount = workOrder['total_billed_amount'] ?? 0;
      final billingDateStr = workOrder['billing_date'];
      DateTime? billingDate;

      // Tentar converter a data de faturamento
      if (billingDateStr != null) {
        try {
          billingDate = DateTime.parse(billingDateStr);
        } catch (e) {
          // Ignorar erros de parsing de data
        }
      }

      // Total para o dashboard (todos os dados, não só filtrados)
      if (workOrder['payment_status'] == 'Billed') {
        totalBilled += amount;
      }

      if (workOrder['payment_status'] == 'Paid') {
        totalPaid += amount;
      }

      if (workOrder['is_overdue'] == true) {
        totalOverdue += amount;
      }

      if (workOrder['low_rating_risk'] == true) {
        riskCount++;
      }

      // Calcular totais do ano
      if (billingDate != null && billingDate.year == currentYear) {
        if (workOrder['payment_status'] == 'Billed') {
          totalBilledYear += amount;
        }

        if (workOrder['payment_status'] == 'Paid') {
          totalPaidYear += amount;
        }

        // Calcular totais do mês atual
        if (billingDate.month == currentMonth) {
          if (workOrder['payment_status'] == 'Billed') {
            totalBilledMonth += amount;
          }

          if (workOrder['payment_status'] == 'Paid') {
            totalPaidMonth += amount;
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_errorMessage != null) {
      return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              SizedBox(height: 16),
              Text(
                _errorMessage!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.red,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _loadData,
                child: Text('Try Again'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  foregroundColor: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).titleSmall,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Header with title and filter controls
            _buildHeader(),
            SizedBox(height: 16),

            // KPI Cards Row
            _buildKpiCardsRow(),
            SizedBox(height: 24),

            // Tab Bar
            _buildTabBar(),
            SizedBox(height: 16),

            // Tab Content - expanded to fill remaining space
            Expanded(
              child: _selectedTabIndex == 0
                  ? _buildDashboardTab()
                  : _selectedTabIndex == 1
                      ? _buildPendingActionsTab()
                      : _buildAnalyticsTab(),
            ),

            // Pagination controls
            SizedBox(height: 8),
            _buildPaginationControls(),
          ],
        ),
      ),
    );
  }

  // Build pagination controls
  Widget _buildPaginationControls() {
    final totalItems = _selectedTabIndex == 0
        ? filteredWorkOrders.length
        : filteredPendingActions.length;
    final totalPages = (totalItems / _itemsPerPage).ceil();

    // Calcular índices dos itens na página atual
    final startItem = _currentPage * _itemsPerPage + 1;
    final endItem = math.min((_currentPage + 1) * _itemsPerPage, totalItems);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Tooltip(
            message: 'Primeira página',
            child: IconButton(
              icon: Icon(Icons.first_page),
              onPressed: _currentPage > 0
                  ? () {
                      setState(() {
                        _currentPage = 0;
                        _updatePagedData();
                      });
                    }
                  : null,
              color: _currentPage > 0
                  ? FlutterFlowTheme.of(context).primaryText
                  : FlutterFlowTheme.of(context).secondaryText.withOpacity(0.3),
            ),
          ),

          Tooltip(
            message: 'Página anterior',
            child: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: _currentPage > 0 ? _previousPage : null,
              color: _currentPage > 0
                  ? FlutterFlowTheme.of(context).primaryText
                  : FlutterFlowTheme.of(context).secondaryText.withOpacity(0.3),
            ),
          ),

          // Indicador da página atual
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Showing $startItem-$endItem of $totalItems',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                if (_isLoadingMoreData)
                  Row(
                    children: [
                      SizedBox(width: 8),
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                if (_hasMoreData && !_isLoadingMoreData)
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Text(
                        '(more available)',
                        style: FlutterFlowTheme.of(context).bodySmall.copyWith(
                              fontStyle: FontStyle.italic,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
              ],
            ),
          ),

          Tooltip(
            message: 'Próxima página',
            child: IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: (_currentPage < totalPages - 1 || _hasMoreData) &&
                      !_isLoadingMoreData
                  ? _nextPage
                  : null,
              color: (_currentPage < totalPages - 1 || _hasMoreData) &&
                      !_isLoadingMoreData
                  ? FlutterFlowTheme.of(context).primaryText
                  : FlutterFlowTheme.of(context).secondaryText.withOpacity(0.3),
            ),
          ),

          // Adicionar botão para ir para a última página
          if (_currentPage < totalPages - 2 && !_hasMoreData)
            Tooltip(
              message: 'Última página',
              child: IconButton(
                icon: Icon(Icons.last_page),
                onPressed: () {
                  setState(() {
                    _currentPage = totalPages - 1;
                    _updatePagedData();
                  });
                },
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
        ],
      ),
    );
  }

  // Build header with title and filters
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Title
        Text(
          'Billing Management',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
        ),

        // Action buttons row
        Row(
          children: [
            // Refresh button
            Tooltip(
              message: 'Atualizar dados',
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 8,
                borderWidth: 1,
                buttonSize: 40,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.refresh_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24,
                ),
                onPressed: () {
                  setState(() {
                    _loadData(); // Recarrega os dados quando o botão é pressionado
                  });
                },
              ),
            ),
            SizedBox(width: 8),

            // Filter button that shows a popover with filters
            Tooltip(
              message: 'Filtrar dados',
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 8,
                borderWidth: 1,
                buttonSize: 40,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.filter_list_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24,
                ),
                onPressed: () => _showFilterDialog(context),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Show filter dialog
  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? tempStatus = _selectedStatus;
        bool tempLowRiskOnly = _showLowRiskOnly;
        bool tempOverdueOnly = _showOverdueOnly;
        // String tempSearchTerm = _searchTerm; // Remover essa linha

        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('Filter Dashboard'),
            content: Container(
              width: 350,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Work Order Search
                    // Text(
                    //   'Work Order ID',
                    //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                    //         fontFamily: 'Outfit',
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    // ),
                    // SizedBox(height: 8),
                    // TextFormField(
                    //   initialValue: tempSearchTerm,
                    //   decoration: InputDecoration(
                    //     hintText: 'Buscar por número da ordem',
                    //     prefixIcon: Icon(Icons.search),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(8),
                    //       borderSide: BorderSide(
                    //         color: FlutterFlowTheme.of(context).alternate,
                    //         width: 2,
                    //       ),
                    //     ),
                    //     contentPadding: EdgeInsets.symmetric(
                    //       horizontal: 16,
                    //       vertical: 12,
                    //     ),
                    //   ),
                    //   onChanged: (value) {
                    //     setState(() {
                    //       tempSearchTerm = value;
                    //     });
                    //   },
                    // ),
                    // SizedBox(height: 16),

                    // Payment Status filter
                    Text(
                      'Payment Status',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    SizedBox(height: 8),
                    // Use a simple DropdownButton instead of FlutterFlowDropDown to avoid errors
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: tempStatus,
                            hint: Text('Select Status...'),
                            items: [
                              'Pending Billing',
                              'Billed',
                              'Paid',
                              'Overdue',
                              'On Hold',
                              'Cancelled'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                tempStatus = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Low risk filter
                    Row(
                      children: [
                        Switch(
                          value: tempLowRiskOnly,
                          onChanged: (val) => setState(() {
                            tempLowRiskOnly = val;
                          }),
                          activeColor: FlutterFlowTheme.of(context).primary,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Show Low Rating Risk Only',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Overdue filter
                    Row(
                      children: [
                        Switch(
                          value: tempOverdueOnly,
                          onChanged: (val) => setState(() {
                            tempOverdueOnly = val;
                          }),
                          activeColor: FlutterFlowTheme.of(context).error,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Show Overdue Only',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Ordem de exibição (Novo campo)
                    // Text(
                    //   'Order By',
                    //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                    //         fontFamily: 'Outfit',
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    // ),
                    // SizedBox(height: 8),
                    // Container(
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: FlutterFlowTheme.of(context).secondaryBackground,
                    //     borderRadius: BorderRadius.circular(8),
                    //     border: Border.all(
                    //       color: FlutterFlowTheme.of(context).alternate,
                    //       width: 2,
                    //     ),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 16),
                    //     child: DropdownButtonHideUnderline(
                    //       child: DropdownButton<String>(
                    //         isExpanded: true,
                    //         value: tempSortOrder,
                    //         hint: Text('Order By...'),
                    //         items: [
                    //           'Newest First',
                    //           'Oldest First',
                    //         ].map((String value) {
                    //           return DropdownMenuItem<String>(
                    //             value: value,
                    //             child: Text(value),
                    //           );
                    //         }).toList(),
                    //         onChanged: (newValue) {
                    //           setState(() {
                    //             tempSortOrder = newValue;
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                child: Text('Clear Filters'),
                onPressed: () {
                  Navigator.of(context).pop();
                  this.setState(() {
                    _selectedStatus = null;
                    _showLowRiskOnly = false;
                    _showOverdueOnly = false;
                    // _searchTerm = ''; // Remover essa linha
                    _sortOrder = 'Newest First'; // Manter esse valor padrão
                    _filterData();
                  });
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  this.setState(() {
                    _selectedStatus = tempStatus;
                    _showLowRiskOnly = tempLowRiskOnly;
                    _showOverdueOnly = tempOverdueOnly;
                    _filterData(); // Atualiza os dados filtrados
                    _currentPage = 0; // Garantir que começa na primeira página
                    _updatePagedData(); // Atualizar os dados paginados
                  });
                },
                child: Text('Apply Filters'),
              ),
            ],
          );
        });
      },
    );
  }

  // Build KPI Cards Row with animated entry
  Widget _buildKpiCardsRow() {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: _cardAnimationController,
        curve: Curves.easeInOut,
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 0.2),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _cardAnimationController,
          curve: Curves.easeOutCubic,
        )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildKpiCard(
                  'Total Billed',
                  '\$${NumberFormat('#,##0.00').format(totalBilled)}',
                  Icons.payment_rounded,
                  FlutterFlowTheme.of(context).primary,
                  delay: 0,
                ),
                _buildKpiCard(
                  'Total Received',
                  '\$${NumberFormat('#,##0.00').format(totalPaid)}',
                  Icons.check_circle_outline,
                  Colors.green,
                  delay: 100,
                ),
                _buildKpiCard(
                  'Overdue Amount',
                  '\$${NumberFormat('#,##0.00').format(totalOverdue)}',
                  Icons.warning_amber_rounded,
                  Colors.orange,
                  delay: 200,
                ),
                _buildKpiCard(
                  'At Risk',
                  riskCount.toString(),
                  Icons.error_outline,
                  Colors.red,
                  delay: 300,
                ),
              ],
            ),
            SizedBox(height: 16), // Espaço entre as linhas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildKpiCard(
                  'This Month Billed',
                  '\$${NumberFormat('#,##0.00').format(totalBilledMonth)}',
                  Icons.today,
                  FlutterFlowTheme.of(context).primary,
                  delay: 400,
                ),
                _buildKpiCard(
                  'This Month Received',
                  '\$${NumberFormat('#,##0.00').format(totalPaidMonth)}',
                  Icons.calendar_today,
                  Colors.green,
                  delay: 500,
                ),
                _buildKpiCard(
                  'Year Total Billed',
                  '\$${NumberFormat('#,##0.00').format(totalBilledYear)}',
                  Icons.calendar_month,
                  FlutterFlowTheme.of(context).tertiary,
                  delay: 600,
                ),
                _buildKpiCard(
                  'Year Total Received',
                  '\$${NumberFormat('#,##0.00').format(totalPaidYear)}',
                  Icons.calendar_view_month,
                  Colors.teal,
                  delay: 700,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Build individual KPI card
  Widget _buildKpiCard(String title, String value, IconData icon, Color color,
      {int delay = 0}) {
    return Expanded(
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Color(0x1A000000),
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 12,
                        ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    value,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
          .animate(delay: Duration(milliseconds: delay))
          .fade(duration: 300.ms)
          .scale(begin: Offset(0.9, 0.9), curve: Curves.easeOut),
    );
  }

  // Build custom tab bar
  Widget _buildTabBar() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTabButton(
              'Dashboard',
              Icons.dashboard_rounded,
              0,
            ),
          ),
          Expanded(
            child: _buildTabButton(
              'Pending Actions',
              Icons.assignment_rounded,
              1,
            ),
          ),
          Expanded(
            child: _buildTabButton(
              'Analytics',
              Icons.bar_chart_rounded,
              2,
            ),
          ),
        ],
      ),
    );
  }

  // Build individual tab button
  Widget _buildTabButton(String title, IconData icon, int index) {
    final isSelected = _selectedTabIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isSelected
              ? FlutterFlowTheme.of(context).primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryText,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Outfit',
                    color: isSelected
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).secondaryText,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  // Dashboard tab content
  Widget _buildDashboardTab() {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: _tableAnimationController,
        curve: Curves.easeInOut,
      ),
      child: Column(
        children: [
          // Chart
          _buildBillingChart(),
          SizedBox(height: 16),

          // Table
          Expanded(
            child: _buildWorkOrdersTable(),
          ),
        ],
      ),
    );
  }

  // Build billing chart
  Widget _buildBillingChart() {
    final billedData = _prepareChartData();

    // Lista de nomes de meses para o eixo X
    final monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    return Container(
      height: 200,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x14000000),
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Billing Summary (${DateTime.now().year})',
            style: FlutterFlowTheme.of(context).titleMedium,
          ),
          SizedBox(height: 16),
          Expanded(
            child: FadeTransition(
              opacity: CurvedAnimation(
                parent: _chartAnimationController,
                curve: Interval(0.3, 1.0, curve: Curves.easeInOut),
              ),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: billedData.isEmpty
                      ? 100
                      : billedData.map((e) => e.y).reduce(math.max) * 1.2,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value == 0) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text('\$0'),
                            );
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              '\$${NumberFormat.compact().format(value)}',
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() >= 0 &&
                              value.toInt() < billedData.length) {
                            // Extrair o mês do formato "MM/YYYY"
                            final month = int.tryParse(
                                billedData[value.toInt()].x.split('/')[0]);
                            final monthName =
                                month != null && month >= 1 && month <= 12
                                    ? monthNames[month - 1]
                                    : billedData[value.toInt()].x;

                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                monthName,
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            );
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(''),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    horizontalInterval: 20,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: FlutterFlowTheme.of(context).alternate,
                        strokeWidth: 1,
                        dashArray: [4, 4],
                      );
                    },
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: billedData.asMap().entries.map((entry) {
                    final i = entry.key;
                    final data = entry.value;
                    final barWidth = 20.0;

                    return BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: data.y * _chartAnimationController.value,
                          color: _getBarColor(data.status),
                          width: barWidth,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(4),
                          ),
                          backDrawRodData: BackgroundBarChartRodData(
                            show: true,
                            toY: billedData.map((e) => e.y).reduce(math.max) *
                                1.2,
                            color: FlutterFlowTheme.of(context)
                                .alternate
                                .withOpacity(0.2),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Prepare data for chart
  List<ChartDataPoint> _prepareChartData() {
    final Map<String, double> monthlyTotals = {};
    final Map<String, String> monthlyStatus = {};

    // Inicializar todos os meses do ano atual com zero
    final now = DateTime.now();
    final currentYear = now.year;

    for (int month = 1; month <= 12; month++) {
      final monthKey = '$month/$currentYear';
      monthlyTotals[monthKey] = 0;
      monthlyStatus[monthKey] = 'Paid'; // Status padrão se não houver dados
    }

    for (final workOrder in _workOrdersList) {
      if (workOrder['billing_date'] != null &&
          workOrder['total_billed_amount'] != null) {
        final billingDate = DateTime.parse(workOrder['billing_date']);

        // Apenas processar dados do ano atual
        if (billingDate.year == currentYear) {
          final month = '${billingDate.month}/$currentYear';

          monthlyTotals[month] =
              (monthlyTotals[month] ?? 0) + workOrder['total_billed_amount'];

          // Determine status for the month (prioritize Overdue > Billed > Paid)
          final status = workOrder['payment_status'];
          if (status == 'Overdue' ||
              (workOrder['is_overdue'] == true && status == 'Billed')) {
            monthlyStatus[month] = 'Overdue';
          } else if (status == 'Billed' &&
              (monthlyStatus[month] == null ||
                  monthlyStatus[month] == 'Paid')) {
            monthlyStatus[month] = 'Billed';
          } else if (status == 'Paid' && monthlyStatus[month] == null) {
            monthlyStatus[month] = 'Paid';
          }
        }
      }
    }

    // Convert to list and sort by date (month)
    final result = monthlyTotals.entries.map((entry) {
      return ChartDataPoint(
        entry.key,
        entry.value,
        monthlyStatus[entry.key] ?? 'Unknown',
      );
    }).toList();

    // Sort by month
    result.sort((a, b) {
      final partsA = a.x.split('/');
      final partsB = b.x.split('/');

      final yearA = int.parse(partsA[1]);
      final yearB = int.parse(partsB[1]);

      if (yearA != yearB) {
        return yearA.compareTo(yearB);
      }

      final monthA = int.parse(partsA[0]);
      final monthB = int.parse(partsB[0]);

      return monthA.compareTo(monthB);
    });

    return result;
  }

  // Get bar color based on status
  Color _getBarColor(String status) {
    switch (status) {
      case 'Paid':
        return Colors.green;
      case 'Billed':
        return FlutterFlowTheme.of(context).primary;
      case 'Overdue':
        return Colors.orange;
      default:
        return FlutterFlowTheme.of(context).secondaryText;
    }
  }

  // Build work orders table with pagination
  Widget _buildWorkOrdersTable() {
    if (_pagedWorkOrders.isEmpty) {
      return Center(
        child: Text(
          'No work orders found.',
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      );
    }

    return Column(
      children: [
        // Cabeçalho da tabela
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'Work Order',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  'Customer',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Amount',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Status',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Text(
                  'Actions',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),

        // Lista de ordens de serviço
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1,
              ),
            ),
            child: SingleChildScrollView(
              controller:
                  _scrollController, // Adicionar o ScrollController aqui
              child: Column(
                children: [
                  // Renderizar cada linha da tabela
                  for (final workOrder in _pagedWorkOrders)
                    _buildWorkOrderRow(workOrder),

                  // Indicador de carregamento no final da lista
                  if (_isLoadingMoreData)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),

                  // Botão para carregar mais dados manualmente
                  if (_hasMoreData && !_isLoadingMoreData)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.refresh),
                          label: Text('Carregar mais trabalhos'),
                          onPressed: _loadMoreData,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Build work order row
  Widget _buildWorkOrderRow(dynamic workOrder) {
    // Obter informações da ordem
    final workOrderId = workOrder['work_order_id'] ?? 'N/A';
    final customerName = workOrder['customer_name'] ?? 'Unknown';
    final amount = workOrder['total_billed_amount'] ?? 0.0;
    final paymentStatus = workOrder['payment_status'] ?? 'Unknown';
    final isOverdue = workOrder['is_overdue'] ?? false;
    final isRisk = workOrder['low_rating_risk'] ?? false;

    // Formatação do valor
    final formattedAmount = '\$${NumberFormat('#,##0.00').format(amount)}';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        border: Border(
          bottom: BorderSide(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              workOrderId,
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              customerName,
              style: FlutterFlowTheme.of(context).bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              formattedAmount,
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color:
                    _getStatusColor(paymentStatus, isOverdue).withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _getStatusColor(paymentStatus, isOverdue),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      paymentStatus,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Outfit',
                            color: _getStatusColor(paymentStatus, isOverdue),
                            fontWeight: FontWeight.w500,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (isRisk)
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 16,
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Tooltip(
                  message: 'See details',
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8,
                    borderWidth: 1,
                    buttonSize: 36,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.visibility_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 18,
                    ),
                    onPressed: () => _showWorkOrderDetails(workOrder),
                  ),
                ),
                SizedBox(width: 8),
                Tooltip(
                  message: 'Open Work Order',
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8,
                    borderWidth: 1,
                    buttonSize: 36,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.open_in_new_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 18,
                    ),
                    onPressed: () =>
                        _navigateToWorkOrder(workOrder['work_order_id']),
                  ),
                ),
                SizedBox(width: 8),
                if (paymentStatus == 'Pending Billing' && !isRisk)
                  Tooltip(
                    message: 'Authorize Billing',
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 8,
                      borderWidth: 1,
                      buttonSize: 36,
                      fillColor:
                          FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                      icon: Icon(
                        Icons.check_circle_outline,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 18,
                      ),
                      onPressed: () => _authorizeOrRegisterPayment(workOrder),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Get status color
  Color _getStatusColor(String status, bool isOverdue) {
    if (isOverdue) {
      return Colors.orange;
    }

    switch (status) {
      case 'Paid':
        return Colors.green;
      case 'Billed':
        return FlutterFlowTheme.of(context).primary;
      case 'Pending Billing':
        return FlutterFlowTheme.of(context).secondary;
      case 'On Hold':
        return Colors.grey;
      case 'Cancelled':
        return Colors.redAccent;
      case 'Overdue':
        return Colors.orange;
      default:
        return FlutterFlowTheme.of(context).secondaryText;
    }
  }

  // Show work order details dialog
  void _showWorkOrderDetails(dynamic workOrder) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Work Order Details'),
        content: Container(
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDetailRow('Work Order ID', workOrder['work_order_id']),
                _buildDetailRow('Customer', workOrder['customer_name']),
                _buildDetailRow('Service Type', workOrder['type_service']),
                _buildDetailRow('Status', workOrder['work_order_status']),
                _buildDetailRow('Billing Status', workOrder['payment_status']),
                _buildDetailRow(
                    'Amount',
                    workOrder['total_billed_amount'] != null
                        ? '\$${NumberFormat('#,##0.00').format(workOrder['total_billed_amount'])}'
                        : 'N/A'),
                if (workOrder['billing_date'] != null)
                  _buildDetailRow(
                      'Billing Date',
                      DateFormat('MM/dd/yyyy')
                          .format(DateTime.parse(workOrder['billing_date']))),
                if (workOrder['payment_received_date'] != null)
                  _buildDetailRow(
                      'Payment Date',
                      DateFormat('MM/dd/yyyy').format(
                          DateTime.parse(workOrder['payment_received_date']))),
                _buildDetailRow('Low Risk',
                    workOrder['low_rating_risk'] == true ? 'Yes' : 'No'),
                if (workOrder['is_overdue'] == true)
                  _buildDetailRow('Overdue', 'Yes', isHighlighted: true),
                if (workOrder['notes'] != null &&
                    workOrder['notes'].toString().isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notes:',
                          style: FlutterFlowTheme.of(context).titleSmall,
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            workOrder['notes'],
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _navigateToWorkOrder(workOrder['work_order_id']);
            },
            child: Text('Open Work Order'),
          ),
          if (workOrder['payment_status'] == 'Pending Billing' &&
              workOrder['low_rating_risk'] != true)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _authorizeOrRegisterPayment(workOrder);
              },
              child: Text('Authorize Billing'),
            ),
          if (workOrder['payment_status'] == 'Pending Billing' &&
              workOrder['low_rating_risk'] == true)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showRiskApprovalDialog(workOrder);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange,
              ),
              child: Text('Review & Authorize (Risk)'),
            ),
          if (workOrder['payment_status'] == 'Billed')
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _registerPayment(workOrder);
              },
              child: Text('Register'),
            ),
        ],
      ),
    );
  }

  // Método para navegar para a página WorkOrder
  void _navigateToWorkOrder(String workOrderId) {
    context.pushNamed(
      'workOrder',
      queryParameters: {
        'workOrderId': workOrderId,
      },
    );
  }

  // Dialog para aprovar ordens com risco
  void _showRiskApprovalDialog(dynamic workOrder) {
    final TextEditingController _notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Risk Assessment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: Colors.red),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'This work order has been flagged as potentially risky. Please confirm you want to proceed with billing.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            color: Colors.red,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Required: Add notes about risk assessment',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _notesController,
              decoration: InputDecoration(
                labelText: 'Risk Assessment Notes',
                hintText:
                    'Explain why this order is safe to bill despite the risk flag',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Notes are required for risk approval';
                }
                return null;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_notesController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Risk assessment notes are required'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              Navigator.pop(context);
              _authorizeRiskyBilling(workOrder, _notesController.text);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.orange,
            ),
            child: Text('Approve & Authorize'),
          ),
        ],
      ),
    );
  }

  // Método para autorizar faturamento de ordens com risco
  Future<void> _authorizeRiskyBilling(
      dynamic workOrder, String riskNotes) async {
    try {
      // Update the work order to authorize billing despite risk
      await SupaFlow.client.from('work_orders').update({
        'billing_authorized': true,
        'billing_date': DateTime.now().toIso8601String(),
        'payment_status': 'Billed',
        'notes':
            '${workOrder['notes'] ?? ''}${workOrder['notes'] != null && workOrder['notes'].toString().isNotEmpty ? '\n\n' : ''}RISK ASSESSMENT: $riskNotes\n\nBilling manually authorized on ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
      }).eq('work_order_id', workOrder['work_order_id']);

      // Refresh data
      setState(() {
        _filterData();
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Billing authorized with risk assessment'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  // Build detail row for work order details
  Widget _buildDetailRow(String label, dynamic value,
      {bool isHighlighted = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value?.toString() ?? 'N/A',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Outfit',
                    color: isHighlighted
                        ? Colors.red
                        : FlutterFlowTheme.of(context).primaryText,
                    fontWeight:
                        isHighlighted ? FontWeight.bold : FontWeight.normal,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  // Authorize billing
  Future<void> _authorizeOrRegisterPayment(dynamic workOrder) async {
    try {
      // Call Supabase to update the work order
      await SupaFlow.client.from('work_orders').update({
        'billing_authorized': true,
        'billing_date': DateTime.now().toIso8601String(),
        'payment_status': 'Billed',
      }).eq('work_order_id', workOrder['work_order_id']);

      // Refresh data
      setState(() {
        _filterData();
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Billing authorized successfully'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  // Register payment
  Future<void> _registerPayment(dynamic workOrder) async {
    final TextEditingController _notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Register Payment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Work Order: ${workOrder['work_order_id']}',
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
            SizedBox(height: 8),
            Text(
              'Amount: \$${NumberFormat('#,##0.00').format(workOrder['total_billed_amount'])}',
              style: FlutterFlowTheme.of(context).titleMedium,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _notesController,
              decoration: InputDecoration(
                labelText: 'Payment Notes (Optional)',
                hintText: 'Enter any notes related to this payment',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                // Update payment status in Supabase
                await SupaFlow.client.from('work_orders').update({
                  'payment_status': 'Paid',
                  'payment_received_date': DateTime.now().toIso8601String(),
                  'notes': _notesController.text.isNotEmpty
                      ? '${workOrder['notes'] ?? ''}${workOrder['notes'] != null && workOrder['notes'].toString().isNotEmpty ? '\n\n' : ''}Payment Notes: ${_notesController.text}'
                      : workOrder['notes'],
                }).eq('work_order_id', workOrder['work_order_id']);

                // Refresh data
                setState(() {
                  _filterData();
                });

                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Payment registered successfully'),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: $error'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }

  // Build pending actions tab
  Widget _buildPendingActionsTab() {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: _tableAnimationController,
        curve: Curves.easeInOut,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x14000000),
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.assignment_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Pending Actions',
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                  Spacer(),
                  Text(
                    '${filteredPendingActions.length} items',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                ],
              ),
            ),

            // Table header
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate.withOpacity(0.2),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Order ID',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Customer',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Action Needed',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Actions',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),

            // Pending actions list
            Expanded(
              child: ListView.builder(
                itemCount: filteredPendingActions.length,
                itemBuilder: (context, index) {
                  final action = filteredPendingActions[index];
                  return _buildPendingActionRow(action, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build pending action row
  Widget _buildPendingActionRow(dynamic action, int index) {
    final actionType = action['pending_action'];
    final isLowRisk = action['low_rating_risk'] ?? false;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        border: Border(
          bottom: BorderSide(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              action['work_order_id'] ?? 'N/A',
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              action['customer_name'] ?? 'N/A',
              style: FlutterFlowTheme.of(context).bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getActionColor(actionType, isLowRisk),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    actionType,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          color: _getActionColor(actionType, isLowRisk),
                          fontWeight: FontWeight.w500,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Tooltip(
                  message: 'View Details',
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8,
                    borderWidth: 1,
                    buttonSize: 36,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.visibility_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 18,
                    ),
                    onPressed: () => _showWorkOrderDetails(action),
                  ),
                ),
                SizedBox(width: 8),
                Tooltip(
                  message: 'Open Work Order',
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8,
                    borderWidth: 1,
                    buttonSize: 36,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.open_in_new_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 18,
                    ),
                    onPressed: () =>
                        _navigateToWorkOrder(action['work_order_id']),
                  ),
                ),
                SizedBox(width: 8),
                if (actionType == 'Needs Billing Authorization' && !isLowRisk)
                  Tooltip(
                    message: 'Autorizar faturamento',
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 8,
                      borderWidth: 1,
                      buttonSize: 36,
                      fillColor:
                          FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                      icon: Icon(
                        Icons.check_circle_outline,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 18,
                      ),
                      onPressed: () => _authorizeOrRegisterPayment(action),
                    ),
                  ),
                if (actionType == 'Needs Billing Authorization' && isLowRisk)
                  Tooltip(
                    message: 'Revisar ordem com risco',
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 8,
                      borderWidth: 1,
                      buttonSize: 36,
                      fillColor: Colors.orange.withOpacity(0.1),
                      icon: Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.orange,
                        size: 18,
                      ),
                      onPressed: () => _showRiskApprovalDialog(action),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Get action color
  Color _getActionColor(String actionType, bool isLowRisk) {
    if (isLowRisk) {
      return Colors.red;
    }

    switch (actionType) {
      case 'Needs Billing Authorization':
        return FlutterFlowTheme.of(context).primary;
      case 'Needs Review (Low Risk)':
        return Colors.red;
      case 'Payment Overdue':
        return Colors.orange;
      default:
        return FlutterFlowTheme.of(context).secondaryText;
    }
  }

  // Build analytics tab
  Widget _buildAnalyticsTab() {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: _tableAnimationController,
        curve: Curves.easeInOut,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x14000000),
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título da aba
                Row(
                  children: [
                    Icon(
                      Icons.analytics_outlined,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Performance Analytics',
                      style: FlutterFlowTheme.of(context).titleMedium,
                    ),
                    Spacer(),
                    Text(
                      'Data for ${DateTime.now().year}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 24),

                // Gráficos na primeira linha - dois lado a lado
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gráfico de barras - Número de ordens por mês
                    Expanded(
                      child: _buildOrdersPerMonthChart(),
                    ),
                    SizedBox(width: 16),
                    // Gráfico de pizza - Distribuição de status
                    Expanded(
                      child: _buildStatusDistributionChart(),
                    ),
                  ],
                ),
                SizedBox(height: 24),

                // Gráficos na segunda linha - dois lado a lado
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gráfico de barras - Trabalhos com risco por mês
                    Expanded(
                      child: _buildRiskWorkOrdersChart(),
                    ),
                    SizedBox(width: 16),
                    // Gráfico de linhas - Valor total faturado por mês
                    Expanded(
                      child: _buildMonthlyBillingLineChart(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Gráfico de barras - Número de ordens por mês
  Widget _buildOrdersPerMonthChart() {
    // Calcular número de ordens por mês
    final Map<String, int> ordersPerMonth = {};
    final List<String> monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    // Inicializar todos os meses com zero
    final currentYear = DateTime.now().year;
    for (int i = 0; i < 12; i++) {
      ordersPerMonth['${i + 1}/$currentYear'] = 0;
    }

    // Contar ordens por mês
    for (final workOrder in _workOrdersList) {
      if (workOrder['created_at'] != null) {
        try {
          final createdAt = DateTime.parse(workOrder['created_at']);
          if (createdAt.year == currentYear) {
            final monthKey = '${createdAt.month}/$currentYear';
            ordersPerMonth[monthKey] = (ordersPerMonth[monthKey] ?? 0) + 1;
          }
        } catch (e) {
          // Ignorar erros de parsing
        }
      }
    }

    // Converter para lista de dados de barras
    final List<BarData> barData = [];
    ordersPerMonth.forEach((key, value) {
      final month = int.parse(key.split('/')[0]);
      barData.add(BarData(monthNames[month - 1], value.toDouble()));
    });

    // Ordenar por mês
    barData.sort((a, b) {
      // Adicionando não-nulos para garantir que x existe
      final monthA = monthNames.indexOf(a.x!);
      final monthB = monthNames.indexOf(b.x!);
      return monthA.compareTo(monthB);
    });

    return Container(
      height: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Orders per Month',
            style: FlutterFlowTheme.of(context).titleSmall,
          ),
          SizedBox(height: 8),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: barData.isEmpty
                    ? 10
                    : (barData.map((e) => e.y!).reduce(math.max) * 1.2),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            value.toInt().toString(),
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        );
                      },
                      reservedSize: 30,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() >= 0 &&
                            value.toInt() < barData.length) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              barData[value.toInt()].x,
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          );
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(''),
                        );
                      },
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  drawHorizontalLine: true,
                  horizontalInterval: 2,
                  drawVerticalLine: false,
                ),
                barGroups: barData.asMap().entries.map((entry) {
                  final i = entry.key;
                  final data = entry.value;

                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: data.y,
                        color: FlutterFlowTheme.of(context).primary,
                        width: 16,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(4),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Gráfico de pizza - Distribuição de status
  Widget _buildStatusDistributionChart() {
    // Contagem por status
    int pendingCount = 0;
    int billedCount = 0;
    int paidCount = 0;
    int otherCount = 0;

    for (final workOrder in _workOrdersList) {
      final status = workOrder['payment_status'];
      if (status == 'Pending Billing') {
        pendingCount++;
      } else if (status == 'Billed') {
        billedCount++;
      } else if (status == 'Paid') {
        paidCount++;
      } else {
        otherCount++;
      }
    }

    final totalOrders = pendingCount + billedCount + paidCount + otherCount;

    // Criar seções do gráfico de pizza
    final List<PieChartSectionData> sections = [];

    if (pendingCount > 0) {
      sections.add(
        PieChartSectionData(
          color: FlutterFlowTheme.of(context).secondary,
          value: pendingCount.toDouble(),
          title: '${((pendingCount / totalOrders) * 100).toStringAsFixed(1)}%',
          radius: 100,
          titleStyle: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      );
    }

    if (billedCount > 0) {
      sections.add(
        PieChartSectionData(
          color: FlutterFlowTheme.of(context).primary,
          value: billedCount.toDouble(),
          title: '${((billedCount / totalOrders) * 100).toStringAsFixed(1)}%',
          radius: 100,
          titleStyle: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      );
    }

    if (paidCount > 0) {
      sections.add(
        PieChartSectionData(
          color: Colors.green,
          value: paidCount.toDouble(),
          title: '${((paidCount / totalOrders) * 100).toStringAsFixed(1)}%',
          radius: 100,
          titleStyle: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      );
    }

    if (otherCount > 0) {
      sections.add(
        PieChartSectionData(
          color: FlutterFlowTheme.of(context).secondaryText,
          value: otherCount.toDouble(),
          title: '${((otherCount / totalOrders) * 100).toStringAsFixed(1)}%',
          radius: 100,
          titleStyle: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      );
    }

    // Criar legendas
    final List<Widget> legends = [
      _buildLegendItem(
          'Pending', FlutterFlowTheme.of(context).secondary, pendingCount),
      _buildLegendItem(
          'Billed', FlutterFlowTheme.of(context).primary, billedCount),
      _buildLegendItem('Paid', Colors.green, paidCount),
      _buildLegendItem(
          'Other', FlutterFlowTheme.of(context).secondaryText, otherCount),
    ];

    return Container(
      height: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Status Distribution',
            style: FlutterFlowTheme.of(context).titleSmall,
          ),
          SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                      sections: sections,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: legends,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Construir item de legenda para o gráfico de pizza
  Widget _buildLegendItem(String label, Color color, int count) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              '$label: $count',
              style: FlutterFlowTheme.of(context).bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // Gráfico de barras - Trabalhos com risco por mês
  Widget _buildRiskWorkOrdersChart() {
    // Calcular número de ordens com risco por mês
    final Map<String, int> riskOrdersPerMonth = {};
    final List<String> monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    // Inicializar todos os meses com zero
    final currentYear = DateTime.now().year;
    for (int i = 0; i < 12; i++) {
      riskOrdersPerMonth['${i + 1}/$currentYear'] = 0;
    }

    // Contar ordens com risco por mês
    for (final workOrder in _workOrdersList) {
      if (workOrder['created_at'] != null &&
          workOrder['low_rating_risk'] == true) {
        try {
          final createdAt = DateTime.parse(workOrder['created_at']);
          if (createdAt.year == currentYear) {
            final monthKey = '${createdAt.month}/$currentYear';
            riskOrdersPerMonth[monthKey] =
                (riskOrdersPerMonth[monthKey] ?? 0) + 1;
          }
        } catch (e) {
          // Ignorar erros de parsing
        }
      }
    }

    // Converter para lista de dados de barras
    final List<BarData> barData = [];
    riskOrdersPerMonth.forEach((key, value) {
      final month = int.parse(key.split('/')[0]);
      barData.add(BarData(monthNames[month - 1], value.toDouble()));
    });

    // Ordenar por mês
    barData.sort((a, b) {
      // Adicionando não-nulos para garantir que x existe
      final monthA = monthNames.indexOf(a.x!);
      final monthB = monthNames.indexOf(b.x!);
      return monthA.compareTo(monthB);
    });

    return Container(
      height: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Risk Orders per Month',
            style: FlutterFlowTheme.of(context).titleSmall,
          ),
          SizedBox(height: 8),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: barData.isEmpty
                    ? 10
                    : (barData.map((e) => e.y!).reduce(math.max) * 1.2),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            value.toInt().toString(),
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        );
                      },
                      reservedSize: 30,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() >= 0 &&
                            value.toInt() < barData.length) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              barData[value.toInt()].x,
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          );
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(''),
                        );
                      },
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  drawHorizontalLine: true,
                  horizontalInterval: 2,
                  drawVerticalLine: false,
                ),
                barGroups: barData.asMap().entries.map((entry) {
                  final i = entry.key;
                  final data = entry.value;

                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: data.y,
                        color: Colors.red,
                        width: 16,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(4),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Gráfico de linhas - Valor total faturado por mês
  Widget _buildMonthlyBillingLineChart() {
    // Calcular valor total faturado por mês
    final Map<String, double> billingPerMonth = {};
    final List<String> monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    // Inicializar todos os meses com zero
    final currentYear = DateTime.now().year;
    for (int i = 0; i < 12; i++) {
      billingPerMonth['${i + 1}/$currentYear'] = 0;
    }

    // Somar valores por mês
    for (final workOrder in _workOrdersList) {
      if (workOrder['billing_date'] != null &&
          workOrder['total_billed_amount'] != null) {
        try {
          final billingDate = DateTime.parse(workOrder['billing_date']);
          if (billingDate.year == currentYear) {
            final monthKey = '${billingDate.month}/$currentYear';
            billingPerMonth[monthKey] = (billingPerMonth[monthKey] ?? 0) +
                (workOrder['total_billed_amount'] as num).toDouble();
          }
        } catch (e) {
          // Ignorar erros de parsing
        }
      }
    }

    // Converter para lista de pontos para o gráfico de linha
    final List<FlSpot> spots = [];
    final List<String> xLabels = [];

    // Usar todos os 12 meses em ordem
    for (int i = 0; i < 12; i++) {
      final monthKey = '${i + 1}/$currentYear';
      final value = billingPerMonth[monthKey] ?? 0;
      spots.add(FlSpot(i.toDouble(), value));
      xLabels.add(monthNames[i]);
    }

    // Calcular valor máximo para o eixo Y
    final maxY =
        spots.isEmpty ? 1000.0 : spots.map((e) => e.y).reduce(math.max) * 1.2;

    return Container(
      height: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Billing Amount',
            style: FlutterFlowTheme.of(context).titleSmall,
          ),
          SizedBox(height: 8),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: maxY / 5,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: FlutterFlowTheme.of(context).alternate,
                      strokeWidth: 1,
                      dashArray: [5, 5],
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index >= 0 && index < xLabels.length) {
                          if (index % 2 == 0) {
                            // Mostrar apenas meses alternados para evitar sobreposição
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                xLabels[index],
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            );
                          }
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(''),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            '\$${NumberFormat.compact().format(value)}',
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        );
                      },
                      reservedSize: 42,
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1,
                    ),
                    left: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1,
                    ),
                    right: BorderSide(color: Colors.transparent),
                    top: BorderSide(color: Colors.transparent),
                  ),
                ),
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: maxY,
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: Colors.teal,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.teal.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Método para reordenar dados com base na seleção
  void _reorderData() {
    if (_sortOrder == 'Oldest First') {
      _workOrdersList.sort((a, b) {
        final dateA = a['created_at'] != null
            ? DateTime.parse(a['created_at'])
            : DateTime.now();
        final dateB = b['created_at'] != null
            ? DateTime.parse(b['created_at'])
            : DateTime.now();
        return dateA.compareTo(dateB); // Ordem crescente (mais antigo primeiro)
      });

      _pendingActionsList.sort((a, b) {
        final dateA = a['created_at'] != null
            ? DateTime.parse(a['created_at'])
            : DateTime.now();
        final dateB = b['created_at'] != null
            ? DateTime.parse(b['created_at'])
            : DateTime.now();
        return dateA.compareTo(dateB);
      });
    } else {
      // Mais recente primeiro (padrão)
      _workOrdersList.sort((a, b) {
        final dateA = a['created_at'] != null
            ? DateTime.parse(a['created_at'])
            : DateTime.now();
        final dateB = b['created_at'] != null
            ? DateTime.parse(b['created_at'])
            : DateTime.now();
        return dateB.compareTo(dateA);
      });

      _pendingActionsList.sort((a, b) {
        final dateA = a['created_at'] != null
            ? DateTime.parse(a['created_at'])
            : DateTime.now();
        final dateB = b['created_at'] != null
            ? DateTime.parse(b['created_at'])
            : DateTime.now();
        return dateB.compareTo(dateA);
      });
    }

    // Aplicar filtros depois de reordenar
    _filterData();
  }

  // Adicionar método para detectar quando o usuário chega ao final da lista
  void _scrollListener() {
    // Se chegou a 80% do final da lista, carregar mais dados
    if (_scrollController.position.pixels >
            _scrollController.position.maxScrollExtent * 0.8 &&
        !_isLoadingMoreData &&
        _hasMoreData) {
      _loadMoreData();
    }
  }

  // Adicionar método para carregar mais dados quando o usuário rola até o final
  void _loadMoreData() {
    setState(() {
      _currentPage++;
    });
    _loadPagedData();
  }
}

// Chart data point class
class ChartDataPoint {
  final String x;
  final double y;
  final String status;

  ChartDataPoint(this.x, this.y, this.status);
}

// Main Invoices widget that loads data and renders the dashboard
class Invoices extends StatefulWidget {
  const Invoices({
    Key? key,
    this.width,
    this.height,
    required this.onWorkOrderTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Function(String) onWorkOrderTap;

  @override
  _InvoicesState createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  // Data loading state
  bool _isLoading = true;
  String? _errorMessage;
  String _sortOrder = 'Newest First'; // Variável para controlar a ordem

  // Data sources
  List<dynamic> _workOrdersList = [];
  List<dynamic> _pendingActionsList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Load dashboard data from Supabase
  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _workOrdersList = []; // Limpar dados existentes
      _pendingActionsList = []; // Limpar dados existentes
    });

    try {
      // Carregar apenas a primeira página (50 registros)
      final workOrdersResponse = await SupaFlow.client
          .from('v_billing_dashboard')
          .select()
          .order('created_at', ascending: _sortOrder == 'Oldest First')
          .range(0, 49); // Primeiros 50 registros

      // Load pending actions data
      final pendingActionsResponse = await SupaFlow.client
          .from('v_pending_actions')
          .select()
          .not('payment_status', 'in', '("Paid","Cancelled")')
          .order('billing_date', ascending: _sortOrder == 'Oldest First')
          .range(0, 49); // Primeiros 50 registros

      setState(() {
        _workOrdersList = workOrdersResponse;
        _pendingActionsList = pendingActionsResponse;
        _isLoading = false;

        // Aplicar ordenação aos dados carregados
        _reorderData();
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Erro ao carregar dados: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            SizedBox(height: 16),
            Text(
              _errorMessage!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.red,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loadData,
              child: Text('Tentar Novamente'),
              style: ElevatedButton.styleFrom(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                foregroundColor: Colors.white,
                textStyle: FlutterFlowTheme.of(context).titleSmall,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Adicionar controles de ordenação
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Order by: ',
                  style: FlutterFlowTheme.of(context).bodyMedium),
              SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _sortOrder,
                    items: [
                      'Newest First',
                      'Oldest First',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      if (newValue != _sortOrder) {
                        setState(() {
                          _sortOrder = newValue!;
                          _reorderData();
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _loadData,
            child: BillingDashboard(
              onWorkOrderTap: widget.onWorkOrderTap,
            ),
          ),
        ),
      ],
    );
  }

  // Método para reordenar dados com base na seleção
  void _reorderData() {
    if (_sortOrder == 'Oldest First') {
      _workOrdersList.sort((a, b) {
        final dateA = a['created_at'] != null
            ? DateTime.parse(a['created_at'])
            : DateTime.now();
        final dateB = b['created_at'] != null
            ? DateTime.parse(b['created_at'])
            : DateTime.now();
        return dateA.compareTo(dateB); // Ordem crescente (mais antigo primeiro)
      });

      _pendingActionsList.sort((a, b) {
        final dateA = a['created_at'] != null
            ? DateTime.parse(a['created_at'])
            : DateTime.now();
        final dateB = b['created_at'] != null
            ? DateTime.parse(b['created_at'])
            : DateTime.now();
        return dateA.compareTo(dateB);
      });
    } else {
      // Mais recente primeiro (padrão)
      _workOrdersList.sort((a, b) {
        final dateA = a['created_at'] != null
            ? DateTime.parse(a['created_at'])
            : DateTime.now();
        final dateB = b['created_at'] != null
            ? DateTime.parse(b['created_at'])
            : DateTime.now();
        return dateB.compareTo(dateA);
      });

      _pendingActionsList.sort((a, b) {
        final dateA = a['created_at'] != null
            ? DateTime.parse(a['created_at'])
            : DateTime.now();
        final dateB = b['created_at'] != null
            ? DateTime.parse(b['created_at'])
            : DateTime.now();
        return dateB.compareTo(dateA);
      });
    }
  }
}

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

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class PaymentDashboard extends ConsumerStatefulWidget {
  const PaymentDashboard({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  ConsumerState<PaymentDashboard> createState() => _PaymentDashboardState();
}

class _PaymentDashboardState extends ConsumerState<PaymentDashboard>
    with SingleTickerProviderStateMixin {
  // Controllers and state variables (Translate comment)
  late TabController _tabController;
  DateTime _startDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime _endDate = DateTime.now();
  String? _selectedTechnicianId;
  String? _selectedTechnicianName;
  bool _isLoading = false;
  bool _hasError = false;
  String? _errorMessage;

  // Data for display (Translate comment)
  List<Map<String, dynamic>> _pendingPayments = [];
  List<Map<String, dynamic>> _payoutHistory = [];
  double _totalPendingAmount = 0;
  int _visitsInPeriod = 0;
  int _updatesInPeriod = 0;
  double _netBalance = 0;
  List<Map<String, dynamic>> _technicians = [];

  // Add Currency and Date Formatters (Re-add and configure for USD/MM-dd-yyyy)
  final _currencyFormatter =
      NumberFormat.currency(locale: 'en_US', symbol: '\$');
  final _dateFormatter = DateFormat('MM/dd/yyyy');
  final _dateTimeFormatter = DateFormat('MM/dd/yyyy HH:mm');
  final _chartDateFormatter = DateFormat('MM/dd');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadTechnicians();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Load list of technicians (Translate comment)
  Future<void> _loadTechnicians() async {
    setState(() => _isLoading = true);
    try {
      final response = await SupaFlow.client
          .from('users')
          .select('user_id, full_name')
          .eq('role', 'technician')
          .order('full_name');

      setState(() {
        _technicians = List<Map<String, dynamic>>.from(response);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        // Translate error message
        _errorMessage = 'Error loading technicians: $e';
        _isLoading = false;
      });
    }
  }

  // Load pending payments and related stats (Translate comment)
  Future<void> _loadPendingPayments() async {
    if (_selectedTechnicianId == null) {
      setState(() {
        _hasError = true;
        // Translate error message
        _errorMessage = 'Please select a technician first.';
        _pendingPayments = []; // Clear data on error
        _totalPendingAmount = 0;
        _visitsInPeriod = 0;
        _updatesInPeriod = 0;
        _netBalance = 0;
      });
      return;
    }

    setState(() => _isLoading = true);
    try {
      final formattedStartDate = _startDate.toIso8601String();
      final formattedEndDate =
          _endDate.add(const Duration(days: 1)).toIso8601String();

      // Query 1: Pending Payments for Table
      final pendingPaymentsResponse = await SupaFlow.client
          .from('payments')
          .select(
              'id, diagnosis_id, amount, reason, update_seq, created_at, diagnoses(visit_type)')
          .eq('technician_uuid', _selectedTechnicianId as Object)
          .eq('paid', false)
          .gte('created_at', formattedStartDate)
          .lt('created_at', formattedEndDate)
          .order('created_at', ascending: false);

      // Query 2: Visits for Card (Adjust date filter)
      final visitsResponse = await SupaFlow.client
          .from('diagnoses')
          .select('diagnosis_id') // Select minimal field
          .eq('technician_uuid', _selectedTechnicianId as Object)
          .gte('created_at', formattedStartDate)
          .lt('created_at', formattedEndDate);

      // Query 3: Updates for Card (Adjust date filter)
      final updatesResponse = await SupaFlow.client
          .from('payments')
          .select('id') // Select minimal field
          .eq('technician_uuid', _selectedTechnicianId as Object)
          .eq('reason', 'addition')
          .gte('created_at', formattedStartDate)
          .lt('created_at', formattedEndDate);

      // Query 4: Net Balance from technician_earnings (fetching latest record)
      final earningsResponse = await SupaFlow.client
          .from('technician_earnings')
          .select('total_earned')
          .eq('technician_uuid', _selectedTechnicianId as Object)
          .order('period_end', ascending: false)
          .limit(1)
          .maybeSingle(); // Use maybeSingle to handle cases where no record exists

      // Process Results
      final List<Map<String, dynamic>> pendingPaymentsData =
          List<Map<String, dynamic>>.from(pendingPaymentsResponse);
      // Calculate counts using .length on the response lists
      final int visitsCount = (visitsResponse as List?)?.length ?? 0;
      final int updatesCount = (updatesResponse as List?)?.length ?? 0;
      // Safely get net balance, default to 0.0 if null or record doesn't exist
      final double netBalanceFromEarnings =
          (earningsResponse?['total_earned'] as num?)?.toDouble() ?? 0.0;

      // Calculate Total Pending Amount from the fetched list
      final double totalPending = pendingPaymentsData.fold<double>(
          0, (sum, p) => sum + ((p['amount'] as num?)?.toDouble() ?? 0.0));

      setState(() {
        _pendingPayments = pendingPaymentsData;
        _totalPendingAmount = totalPending; // Use sum of pending items
        _visitsInPeriod = visitsCount;
        _updatesInPeriod = updatesCount;
        _netBalance =
            netBalanceFromEarnings; // Use value from technician_earnings
        _hasError = false;
        _errorMessage = null;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        // Translate error message
        _errorMessage =
            'Error loading dashboard data: $e'; // More generic error
        _isLoading = false;
        // Clear data on error
        _pendingPayments = [];
        _totalPendingAmount = 0;
        _visitsInPeriod = 0;
        _updatesInPeriod = 0;
        _netBalance = 0;
      });
    }
  }

  // Load payout history (Translate comment)
  Future<void> _loadPayoutHistory() async {
    if (_selectedTechnicianId == null) return;

    setState(() => _isLoading = true);
    try {
      final response = await SupaFlow.client
          .from('payouts')
          .select('batch_id, total_amount, paid_at')
          .eq('technician_uuid', _selectedTechnicianId as Object)
          .order('paid_at', ascending: false);

      setState(() {
        _payoutHistory = List<Map<String, dynamic>>.from(response);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        // Translate error message
        _errorMessage = 'Error loading payout history: $e';
        _isLoading = false;
      });
    }
  }

  // Pay technician (Translate comment)
  Future<void> _payTechnician() async {
    if (_selectedTechnicianId == null) return;
    if (_pendingPayments.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        // Translate snackbar message
        const SnackBar(content: Text('No pending payments to process')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final formattedStartDate = _startDate.toIso8601String().substring(0, 10);
      final formattedEndDate = _endDate.toIso8601String().substring(0, 10);

      final result = await SupaFlow.client.rpc('pay_technician', params: {
        'p_technician': _selectedTechnicianId,
        'p_date_start': formattedStartDate,
        'p_date_end': formattedEndDate,
      });

      final batchId = result as String;

      ScaffoldMessenger.of(context).showSnackBar(
        // Translate snackbar message
        SnackBar(content: Text('Payout batch generated: $batchId')),
      );

      // Reload data after payment (Translate comment)
      await _loadPendingPayments();
      await _loadPayoutHistory();
    } catch (e) {
      setState(() {
        _hasError = true;
        // Translate error message
        _errorMessage = 'Error processing payment: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDarkMode ? Colors.cyanAccent : Colors.blue;
    final secondaryColor = isDarkMode ? Colors.pinkAccent : Colors.purple;

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF121212) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: _hasError
          ? _buildErrorWidget()
          : Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildPendingPaymentsTab(),
                      _buildPayoutHistoryTab(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: SelectableText.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Error loading data:\\n',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: _errorMessage ?? 'Unknown error',
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payments & Payouts Dashboard',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Select Technician',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedTechnicianId,
                  items: _technicians.map((tech) {
                    return DropdownMenuItem<String>(
                      value: tech['user_id'],
                      child: Text(tech['full_name']),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedTechnicianId = value;
                      _selectedTechnicianName = _technicians.firstWhere(
                          (t) => t['user_id'] == value)['full_name'];
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Start Date',
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        controller: TextEditingController(
                          text: _dateFormatter.format(_startDate),
                        ),
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: _startDate,
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            setState(() => _startDate = date);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'End Date',
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        controller: TextEditingController(
                          text: _dateFormatter.format(_endDate),
                        ),
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: _endDate,
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            setState(() => _endDate = date);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.search),
                label: const Text('Load Data'),
                onPressed: () {
                  _loadPendingPayments();
                  _loadPayoutHistory();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Pending'),
              Tab(text: 'Payout History'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPendingPaymentsTab() {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSummaryCards(),
                const SizedBox(height: 24),
                _buildPendingPaymentsTable(),
                const SizedBox(height: 24),
                _buildPayTechnicianButton(),
                const SizedBox(height: 32),
                _buildChartsSection(),
              ],
            ),
          );
  }

  Widget _buildSummaryCards() {
    // Use the USD formatter
    final formatter = _currencyFormatter;

    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildSummaryCard(
          title: 'Total Pending',
          value: formatter.format(_totalPendingAmount),
          icon: Icons.account_balance_wallet,
          color: Colors.blue,
        ),
        _buildSummaryCard(
          title: 'Visits in Period',
          value: _visitsInPeriod.toString(),
          icon: Icons.home_repair_service,
          color: Colors.green,
        ),
        _buildSummaryCard(
          title: 'Updates',
          value: _updatesInPeriod.toString(),
          icon: Icons.update,
          color: Colors.orange,
        ),
        _buildSummaryCard(
          title: 'Net Balance',
          value: formatter.format(_netBalance),
          icon: Icons.payment,
          color: Colors.purple,
        ),
      ],
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
              Icon(icon, color: color),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingPaymentsTable() {
    // Use the USD formatter
    final formatter = _currencyFormatter;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pending Payments',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[850] : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(
                  label: Text('Diagnosis ID'),
                  tooltip: 'Diagnosis Identifier',
                ),
                DataColumn(
                  label: Text('Visit Type'),
                  tooltip: 'Category of service',
                ),
                DataColumn(
                  label: Text('Reason'),
                  tooltip: 'Base, addition, or discount',
                ),
                DataColumn(
                  label: Text('Amount'),
                  numeric: true,
                  tooltip: 'Value in USD',
                ),
                DataColumn(
                  label: Text('Update Seq'),
                  numeric: true,
                  tooltip: 'Number of updates sequence',
                ),
                DataColumn(
                  label: Text('Date'),
                  tooltip: 'Record date',
                ),
              ],
              rows: _pendingPayments.map((payment) {
                // Safe data extraction with null checks
                final diagnosisId =
                    payment['diagnosis_id']?.toString() ?? 'N/A';
                final diagnosesData =
                    payment['diagnoses'] as Map<String, dynamic>?;
                final visitType =
                    diagnosesData?['visit_type']?.toString() ?? 'N/A';
                final reason = payment['reason']?.toString() ?? '';
                final amount = (payment['amount'] as num?)?.toDouble() ?? 0.0;
                final updateSeq = payment['update_seq']?.toString() ?? '0';
                final createdAtStr = payment['created_at'] as String?;
                String formattedDate = 'Invalid Date';
                if (createdAtStr != null) {
                  try {
                    formattedDate =
                        _dateFormatter.format(DateTime.parse(createdAtStr));
                  } catch (e) {
                    print('Error parsing date: $createdAtStr - $e');
                    // Keep 'Invalid Date'
                  }
                }

                return DataRow(
                  cells: [
                    DataCell(Text(diagnosisId)),
                    DataCell(Text(visitType)),
                    DataCell(Text(_getReasonText(reason))),
                    DataCell(
                      Text(
                        formatter.format(amount),
                        style: TextStyle(
                          color:
                              reason == 'discount' ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataCell(Text(updateSeq)),
                    DataCell(Text(formattedDate)),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  String _getReasonText(String reason) {
    switch (reason) {
      case 'base':
        return 'Base';
      case 'addition':
        return 'Addition';
      case 'discount':
        return 'Discount';
      default:
        return reason;
    }
  }

  Widget _buildPayTechnicianButton() {
    return Center(
      child: ElevatedButton.icon(
        icon: const Icon(Icons.payments),
        label: const Text('Pay Technician'),
        onPressed: _pendingPayments.isEmpty ? null : _payTechnician,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 32,
          ),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildChartsSection() {
    if (_pendingPayments.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'No data available for charts. Load pending data first.',
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      );
    }

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Data Analysis',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[850] : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Distribution by Visit Type',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: _buildVisitTypeDonutChart(),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[850] : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daily Credits vs. Debits',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: _buildDailyCreditsDebitsChart(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVisitTypeDonutChart() {
    // Agrupar por tipo de visita
    final visitTypes = <String, int>{};

    for (final payment in _pendingPayments) {
      final visitType =
          payment['diagnoses']['visit_type'] as String? ?? 'Uncategorized';
      visitTypes[visitType] = (visitTypes[visitType] ?? 0) + 1;
    }

    // Preparar dados para o gráfico
    final sections = <PieChartSectionData>[];
    final colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.amber,
      Colors.pink,
      Colors.teal,
    ];

    int colorIndex = 0;
    visitTypes.forEach((type, count) {
      final percentage = count / _pendingPayments.length * 100;
      sections.add(
        PieChartSectionData(
          color: colors[colorIndex % colors.length],
          value: percentage,
          title: '${percentage.toStringAsFixed(1)}%',
          radius: 50,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
      colorIndex++;
    });

    // Construir legenda
    final legends = <Widget>[];
    colorIndex = 0;
    visitTypes.forEach((type, count) {
      legends.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                color: colors[colorIndex % colors.length],
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  '$type ($count)',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
      colorIndex++;
    });

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 30,
              sections: sections,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: legends,
          ),
        ),
      ],
    );
  }

  Widget _buildDailyCreditsDebitsChart() {
    // Agrupar por dia
    final dailyData = <String, Map<String, double>>{};

    for (final payment in _pendingPayments) {
      // Use MM/dd format for chart keys
      final date = _chartDateFormatter.format(
        DateTime.parse(payment['created_at']),
      );

      final isCredit = payment['reason'] != 'discount';
      final amount = payment['amount'] as double;

      dailyData[date] ??= {'credits': 0, 'debits': 0};

      if (isCredit) {
        dailyData[date]!['credits'] =
            (dailyData[date]!['credits'] ?? 0) + amount;
      } else {
        dailyData[date]!['debits'] = (dailyData[date]!['debits'] ?? 0) + amount;
      }
    }

    // Ordenar datas
    final sortedDates = dailyData.keys.toList()
      ..sort((a, b) {
        try {
          // Use MM/dd parser
          final dateA = _chartDateFormatter.parse(a);
          final dateB = _chartDateFormatter.parse(b);
          return dateA.compareTo(dateB);
        } catch (e) {
          // Handle potential parsing errors if format is unexpected
          print('Error parsing chart date: $e');
          return 0;
        }
      });

    // Dados para o gráfico
    final credits = <BarChartGroupData>[];
    final debits = <BarChartGroupData>[];

    for (var i = 0; i < sortedDates.length; i++) {
      final date = sortedDates[i];
      final data = dailyData[date]!;

      credits.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: data['credits'] ?? 0,
              color: Colors.green,
              width: 16,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
          ],
        ),
      );

      debits.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: data['debits'] ?? 0,
              color: Colors.red,
              width: 16,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
          ],
        ),
      );
    }

    final groups = <BarChartGroupData>[];

    for (var i = 0; i < sortedDates.length; i++) {
      groups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: dailyData[sortedDates[i]]!['credits'] ?? 0,
              color: Colors.green,
              width: 12,
            ),
            BarChartRodData(
              toY: dailyData[sortedDates[i]]!['debits'] ?? 0,
              color: Colors.red,
              width: 12,
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceEvenly,
              maxY: dailyData.values
                      .map((day) => (day['credits'] ?? 0) > (day['debits'] ?? 0)
                          ? (day['credits'] ?? 0)
                          : (day['debits'] ?? 0))
                      .fold<num>(0, (max, value) => value > max ? value : max) *
                  1.2,
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index < 0 || index >= sortedDates.length) {
                        return const SizedBox();
                      }
                      if (sortedDates.length > 10 &&
                          index % (sortedDates.length ~/ 5) != 0) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          sortedDates[index],
                          style: const TextStyle(fontSize: 10),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 45,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        _currencyFormatter.format(value).replaceAll('.00', ''),
                        style: const TextStyle(fontSize: 10),
                        textAlign: TextAlign.left,
                      );
                    },
                  ),
                ),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              barGroups: groups,
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  tooltipPadding: const EdgeInsets.all(8),
                  tooltipMargin: 8,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    final date = sortedDates[group.x.toInt()];
                    final value = rod.toY;
                    final isCredit = rodIndex == 0;

                    return BarTooltipItem(
                      '${isCredit ? 'Credits' : 'Debits'} on $date\\n',
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: _currencyFormatter.format(value),
                          style: TextStyle(
                            color:
                                isCredit ? Colors.green[300] : Colors.red[300],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  color: Colors.green,
                ),
                const SizedBox(width: 4),
                const Text('Credits'),
              ],
            ),
            const SizedBox(width: 16),
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  color: Colors.red,
                ),
                const SizedBox(width: 4),
                const Text('Debits'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPayoutHistoryTab() {
    // Use USD formatter
    final formatter = _currencyFormatter;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Payout History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: _payoutHistory.isEmpty
                        ? const Center(
                            child: Text(
                              'No payout history found for this technician.',
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            child: DataTable(
                              columns: const [
                                DataColumn(
                                  label: Text('Batch ID'),
                                  tooltip: 'Payout batch identifier',
                                ),
                                DataColumn(
                                  label: Text('Total Amount'),
                                  numeric: true,
                                  tooltip: 'Total amount of the batch',
                                ),
                                DataColumn(
                                  label: Text('Paid At'),
                                  tooltip:
                                      'Date and time the payout was processed',
                                ),
                                DataColumn(
                                  label: Text('Details'),
                                  tooltip: 'View details of this batch',
                                ),
                              ],
                              rows: _payoutHistory.map((payout) {
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        payout['batch_id'],
                                        style: const TextStyle(
                                          fontFamily: 'Space Grotesk',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        formatter
                                            .format(payout['total_amount']),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        _dateTimeFormatter.format(
                                          DateTime.parse(payout['paid_at']),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      IconButton(
                                        icon: const Icon(Icons.visibility),
                                        onPressed: () =>
                                            _showPayoutDetails(payout),
                                        tooltip: 'View payments in this batch',
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

  void _showPayoutDetails(Map<String, dynamic> payout) async {
    setState(() => _isLoading = true);

    try {
      final response = await SupaFlow.client
          .from('payments')
          .select(
              'id, diagnosis_id, amount, reason, created_at, diagnoses(visit_type)')
          .eq('payout_batch_id', payout['batch_id'])
          .order('created_at');

      final paymentDetails = List<Map<String, dynamic>>.from(response);

      if (!mounted) return;

      setState(() => _isLoading = false);

      showDialog(
        context: context,
        builder: (context) {
          // Use USD formatter
          final formatter = _currencyFormatter;

          return AlertDialog(
            title: Text('Batch Details: ${payout['batch_id']}'),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Total: ${formatter.format(payout['total_amount'])}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    DataTable(
                      columns: const [
                        DataColumn(label: Text('Diagnosis')),
                        DataColumn(label: Text('Type')),
                        DataColumn(label: Text('Reason')),
                        DataColumn(
                          label: Text('Amount'),
                          numeric: true,
                        ),
                        DataColumn(label: Text('Date')),
                      ],
                      rows: paymentDetails.map((payment) {
                        return DataRow(
                          cells: [
                            DataCell(Text(payment['diagnosis_id'].toString())),
                            DataCell(Text(
                                payment['diagnoses']['visit_type'] ?? 'N/A')),
                            DataCell(Text(_getReasonText(payment['reason']))),
                            DataCell(
                              Text(
                                formatter.format(payment['amount']),
                                style: TextStyle(
                                  color: payment['reason'] == 'discount'
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                _dateFormatter.format(
                                  DateTime.parse(payment['created_at']),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Error loading batch details: $e';
        _isLoading = false;
      });
    }
  }
}

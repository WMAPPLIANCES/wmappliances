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
import 'package:flutter_animate/flutter_animate.dart';

class CreatePaymentForm extends StatefulWidget {
  const CreatePaymentForm({
    super.key,
    this.width,
    this.height,
    required this.diagnosisId,
    required this.technicianUuid,
    this.technicianName,
    this.onSuccess,
  });

  final double? width;
  final double? height;
  final String diagnosisId;
  final String technicianUuid;
  final String? technicianName;
  final VoidCallback? onSuccess;

  @override
  State<CreatePaymentForm> createState() => _CreatePaymentFormState();
}

class _CreatePaymentFormState extends State<CreatePaymentForm> {
  // Estado do formulário
  List<Map<String, dynamic>> _payRates = [];
  List<String> _appliances = [];
  List<String> _visitTypes = [];

  String? _selectedItemCategory;
  String? _selectedVisitType;
  double? _pricePreview;

  bool _isLoading = true;
  bool _isSubmitting = false;
  String? _errorMsg;

  final _currencyFormatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: '\$',
    decimalDigits: 2,
  );

  @override
  void initState() {
    super.initState();
    _loadPayRates();
  }

  // Carregar dados de pay_rates
  Future<void> _loadPayRates() async {
    setState(() {
      _isLoading = true;
      _errorMsg = null;
    });

    try {
      final response = await SupaFlow.client
          .from('pay_rates')
          .select('item_category, visit_type, amount')
          .order('item_category')
          .order('visit_type');

      // Processar resultados
      final rates = (response as List<dynamic>).map((item) {
        return {
          'item_category': item['item_category'] as String,
          'visit_type': item['visit_type'] as String,
          'amount': (item['amount'] as num).toDouble(),
        };
      }).toList();

      // Extrair listas únicas para os dropdowns
      final appliances = <String>{};
      final visitTypes = <String>{};

      for (final rate in rates) {
        appliances.add(rate['item_category'] as String);
        visitTypes.add(rate['visit_type'] as String);
      }

      setState(() {
        _payRates = rates;
        _appliances = appliances.toList()..sort();
        _visitTypes = visitTypes.toList()..sort();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMsg = 'Error loading payment rates: $e';
        _isLoading = false;
      });
      print('Error loading pay_rates: $e');
    }
  }

  // Atualizar preço quando seleções mudarem
  void _updatePricePreview() {
    if (_selectedItemCategory == null || _selectedVisitType == null) {
      setState(() {
        _pricePreview = null;
      });
      return;
    }

    try {
      final matchingRate = _payRates.firstWhere(
        (r) =>
            r['item_category'] == _selectedItemCategory &&
            r['visit_type'] == _selectedVisitType,
        orElse: () => {'amount': null},
      );

      setState(() {
        _pricePreview = matchingRate['amount'] as double?;
      });
    } catch (e) {
      setState(() {
        _pricePreview = null;
      });
      print('Error finding matching rate: $e');
    }
  }

  // Inserir pagamento e atualizar diagnóstico
  Future<void> _insertPayment() async {
    if (_pricePreview == null ||
        _selectedItemCategory == null ||
        _selectedVisitType == null) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      // 1. Inserir pagamento na tabela payments
      await SupaFlow.client.from('payments').insert({
        'diagnosis_id': widget.diagnosisId,
        'technician_uuid': widget.technicianUuid,
        'amount': _pricePreview,
        'reason': 'base',
        'update_seq': null,
        'paid': false,
      });

      // 2. Atualizar a tabela diagnoses
      await SupaFlow.client.from('diagnoses').update({
        'visit_type': _selectedVisitType,
        'base_amount': _pricePreview,
        'pay_category': _selectedItemCategory,
        'payment_autorized': true,
      }).eq('diagnosis_id', widget.diagnosisId);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment created!'),
          backgroundColor: Colors.green,
        ),
      );

      // Notificar o sucesso e fechar
      if (widget.onSuccess != null) {
        widget.onSuccess!();
      }

      // Tentar fechar o diálogo se estiver em um
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error creating payment: $e'),
          backgroundColor: Colors.redAccent,
        ),
      );

      setState(() {
        _isSubmitting = false;
      });
      print('Error processing payment: $e');
    }
  }

  // Fechar o widget/dialog
  void _close() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final canSubmit = _pricePreview != null && !_isSubmitting;

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color(0xFF1E1E1E).withOpacity(0.85)
            : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDarkMode ? Colors.white12 : Colors.black12,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: _isLoading && _payRates.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : _errorMsg != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline,
                            color: Colors.redAccent, size: 48),
                        const SizedBox(height: 16),
                        Text(
                          _errorMsg!,
                          style: TextStyle(color: Colors.redAccent),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _loadPayRates,
                          child: Text('Try Again'),
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header atualizado
                    Row(
                      children: [
                        // Título estilizado com ícone
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: isDarkMode
                                    ? [
                                        Colors.teal.shade900,
                                        Colors.cyan.shade900
                                      ]
                                    : [
                                        Colors.teal.shade300,
                                        Colors.cyan.shade400
                                      ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.payments_rounded,
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black87,
                                  size: 24,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Create Payment',
                                  style: TextStyle(
                                    fontFamily: 'Space Grotesk',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                                Spacer(),
                                // Botão fechar
                                IconButton(
                                  icon: Icon(Icons.close,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black87),
                                  onPressed: _close,
                                  tooltip: 'Close',
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Informações do técnico e diagnóstico
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color:
                            isDarkMode ? Colors.black26 : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isDarkMode
                              ? Colors.white10
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Column(
                        children: [
                          // Técnico
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 18,
                                color: isDarkMode
                                    ? Colors.cyan.shade300
                                    : Colors.teal.shade700,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Technician:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode
                                      ? Colors.white70
                                      : Colors.black54,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  widget.technicianName ??
                                      'ID: ${widget.technicianUuid}',
                                  style: TextStyle(
                                    fontFamily: 'Space Grotesk',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          // Diagnosis ID
                          Row(
                            children: [
                              Icon(
                                Icons.assignment,
                                size: 18,
                                color: isDarkMode
                                    ? Colors.amber.shade300
                                    : Colors.amber.shade800,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Diagnosis:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode
                                      ? Colors.white70
                                      : Colors.black54,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  widget.diagnosisId,
                                  style: TextStyle(
                                    fontFamily: 'Space Grotesk',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Dropdown de Aparelho
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            offset: Offset(0, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _selectedItemCategory,
                        isExpanded: true,
                        decoration: InputDecoration(
                          labelText: 'Appliance',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.cyanAccent : Colors.teal,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color:
                                  isDarkMode ? Colors.cyanAccent : Colors.teal,
                              width: 2,
                            ),
                          ),
                        ),
                        items: _appliances.map((appliance) {
                          return DropdownMenuItem<String>(
                            value: appliance,
                            child: Text(
                              appliance,
                              style: TextStyle(fontFamily: 'Inter'),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedItemCategory = value;
                          });
                          _updatePricePreview();
                        },
                        dropdownColor:
                            isDarkMode ? Color(0xFF2D2D2D) : Colors.white,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: isDarkMode ? Colors.cyanAccent : Colors.teal,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Dropdown de Tipo de Visita
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            offset: Offset(0, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _selectedVisitType,
                        isExpanded: true,
                        decoration: InputDecoration(
                          labelText: 'Visit Type',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDarkMode
                                ? Colors.amberAccent
                                : Colors.amber.shade800,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: isDarkMode
                                  ? Colors.amberAccent
                                  : Colors.amber.shade800,
                              width: 2,
                            ),
                          ),
                        ),
                        items: _visitTypes.map((type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(
                              type,
                              style: TextStyle(fontFamily: 'Inter'),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedVisitType = value;
                          });
                          _updatePricePreview();
                        },
                        dropdownColor:
                            isDarkMode ? Color(0xFF2D2D2D) : Colors.white,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: isDarkMode
                              ? Colors.amberAccent
                              : Colors.amber.shade800,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Visualização de preço
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? Colors.indigo.shade900.withOpacity(0.3)
                            : Colors.indigo.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDarkMode
                              ? Colors.indigo.shade700
                              : Colors.indigo.shade200,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price Preview',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? Colors.indigo.shade200
                                  : Colors.indigo.shade800,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            _pricePreview != null
                                ? _currencyFormatter.format(_pricePreview)
                                : '—',
                            style: TextStyle(
                              fontFamily: 'Space Grotesk',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: _pricePreview != null
                                  ? (isDarkMode
                                      ? Colors.white
                                      : Colors.indigo.shade800)
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Spacer(),

                    // Botão de inserir pagamento
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: canSubmit
                              ? (isDarkMode
                                  ? Colors.cyan.shade700
                                  : Colors.cyan.shade600)
                              : Colors.grey.shade600,
                          foregroundColor: Colors.white,
                          elevation: canSubmit ? 4 : 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: canSubmit ? _insertPayment : null,
                        child: _isSubmitting
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.payments_rounded),
                                  SizedBox(width: 8),
                                  Text(
                                    'INSERT PAYMENT',
                                    style: TextStyle(
                                      fontFamily: 'Space Grotesk',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                )
                  .animate()
                  .fadeIn(
                    duration: 300.ms,
                  )
                  .slideY(
                    begin: 0.2,
                    end: 0,
                    duration: 400.ms,
                    curve: Curves.easeOutCubic,
                  ),
    );
  }
}

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

import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
// Supabase client is already available via SupaFlow.client

// Define data structures for clarity
class _TechnicianInfo {
  final String userId;
  final String fullName;
  _TechnicianInfo({required this.userId, required this.fullName});
}

class _UpdateLevelInfo {
  final String updateSeq;
  final double additionAmt;
  final double discountAmt;
  _UpdateLevelInfo({
    required this.updateSeq,
    required this.additionAmt,
    required this.discountAmt,
  });
}

/// Rename class from ApplyUpdatePanel to ApplyUpdate
class ApplyUpdate extends StatefulWidget {
  // Rename constructor to match the new class name
  const ApplyUpdate({
    super.key,
    required this.diagnosisId,
    this.deductionTechnicianName, // Novo parâmetro para o técnico com dedução
    this.onSuccess, // Modificado: removido 'required' e tornado opcional
    this.width,
    this.height,
  });

  final String diagnosisId;
  final String?
      deductionTechnicianName; // Nome do técnico que terá dedução (opcional)
  final VoidCallback?
      onSuccess; // Modificado: adicionado '?' para tornar nullable
  final double? width;
  final double? height;

  @override
  // Adjust the State class name in createState
  State<ApplyUpdate> createState() => _ApplyUpdateState();
}

// Rename state class from _ApplyUpdatePanelState to _ApplyUpdateState
// Adjust the generic type to match the new widget class name
class _ApplyUpdateState extends State<ApplyUpdate> {
  bool _isLoading = true;
  String? _loadingError;

  List<_TechnicianInfo> _technicians = [];
  List<_UpdateLevelInfo> _updateLevels = [];

  String? _selectedTechnicianId;
  _UpdateLevelInfo? _selectedUpdateLevel;

  final _currencyFormatter =
      NumberFormat.currency(locale: 'en_US', symbol: '\$');

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    print('Diagnosis ID recebido: ${widget.diagnosisId}'); // Logging para debug
  }

  Future<void> _loadInitialData() async {
    setState(() {
      _isLoading = true;
      _loadingError = null;
    });
    try {
      await Future.wait([
        _loadTechnicians(),
        _loadUpdateLevels(),
      ]);
      setState(() => _isLoading = false);
    } catch (e) {
      setState(() {
        _loadingError = 'Error loading data: $e';
        _isLoading = false;
      });
      print('Error loading initial data: $e'); // Log for debugging
    }
  }

  Future<void> _loadTechnicians() async {
    final response = await SupaFlow.client
        .from('users')
        .select('user_id, full_name')
        .eq('role', 'technician')
        .order('full_name');

    // Handle potential errors or empty lists if necessary
    // Supabase typically returns an empty list, not an error, if no match

    setState(() {
      _technicians = (response as List<dynamic>)
          .map((item) => _TechnicianInfo(
                userId: item['user_id'] as String,
                fullName: item['full_name'] as String? ?? 'Unnamed Technician',
              ))
          .toList();
    });
  }

  Future<void> _loadUpdateLevels() async {
    final response = await SupaFlow.client
        .from('update_rates')
        .select('update_seq, addition_amt, discount_amt')
        .order('update_seq');

    setState(() {
      _updateLevels = (response as List<dynamic>)
          .map((item) => _UpdateLevelInfo(
                updateSeq: item['update_seq'] as String,
                additionAmt: (item['addition_amt'] as num?)?.toDouble() ?? 0.0,
                discountAmt: (item['discount_amt'] as num?)?.toDouble() ?? 0.0,
              ))
          .toList();
    });
  }

  // Método para fechar o bottomSheet
  void _closeBottomSheet() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  Future<void> _applyUpdate() async {
    if (_selectedTechnicianId == null || _selectedUpdateLevel == null) {
      return; // Should not happen if button is enabled correctly
    }

    setState(() => _isLoading = true); // Show loading state on button press

    try {
      print('Chamando RPC com diagnosis_id: ${widget.diagnosisId}');
      print(
          'Parâmetros: p_update_seq: ${_selectedUpdateLevel!.updateSeq}, p_new_technician: ${_selectedTechnicianId!}');

      // Garantir que o diagnosisId não está vazio
      if (widget.diagnosisId.isEmpty) {
        throw Exception('Diagnosis ID não pode ser vazio');
      }

      final result = await SupaFlow.client.rpc('apply_update', params: {
        'p_diagnosis_id':
            widget.diagnosisId.trim(), // Remover espaços em branco
        'p_update_seq': _selectedUpdateLevel!.updateSeq,
        'p_new_technician': _selectedTechnicianId!,
      });

      if (!mounted) return; // Check if widget is still in tree

      print('Resultado da RPC: $result');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Update applied!'),
          backgroundColor: Colors.green,
        ),
      );

      // Chamada condicional do callback
      if (widget.onSuccess != null) {
        widget.onSuccess!();
      }

      // Fechando o bottomSheet explicitamente
      _closeBottomSheet();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error applying update: $e'),
          backgroundColor: Colors.redAccent,
        ),
      );
      print('Error running RPC apply_update: $e'); // Log for debugging
    } finally {
      if (mounted) {
        setState(() => _isLoading = false); // Hide loading state
      }
    }
  }

  // Método para obter o nome do técnico selecionado
  String? _getSelectedTechnicianName() {
    if (_selectedTechnicianId == null) return null;

    final technicianInfo = _technicians.firstWhere(
      (tech) => tech.userId == _selectedTechnicianId,
      orElse: () => _TechnicianInfo(userId: '', fullName: 'Unknown'),
    );

    return technicianInfo.fullName;
  }

  @override
  Widget build(BuildContext context) {
    final bool canApply =
        _selectedTechnicianId != null && _selectedUpdateLevel != null;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final selectedTechnicianName = _getSelectedTechnicianName();

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height, // Use provided height or let it size naturally
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color(0xFF1E1E1E).withOpacity(0.85) // Dark glass-like
            : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16), // rounded-xl equivalent
        border: Border.all(
          color: isDarkMode ? Colors.white12 : Colors.black12,
          width: 1,
        ),
        boxShadow: isDarkMode
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                )
              ]
            : null,
      ),
      child: _isLoading && _technicians.isEmpty && _updateLevels.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : _loadingError != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _loadingError!,
                      style: TextStyle(color: Colors.redAccent),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min, // Fit content vertically
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título com gradiente
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isDarkMode
                              ? [Colors.teal.shade900, Colors.cyan.shade900]
                              : [Colors.teal.shade200, Colors.cyan.shade300],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '⚙️ Apply Update',
                            style: TextStyle(
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: isDarkMode ? Colors.white : Colors.black87,
                            ),
                          ),
                          // Botão para fechar
                          IconButton(
                            icon: Icon(Icons.close,
                                color:
                                    isDarkMode ? Colors.white : Colors.black87),
                            onPressed: _closeBottomSheet,
                            tooltip: 'Close',
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Diagnosis ID display com estilo melhorado
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color:
                            isDarkMode ? Colors.black38 : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDarkMode ? Colors.white12 : Colors.black12,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Diagnosis ID:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color:
                                  isDarkMode ? Colors.white70 : Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.diagnosisId,
                            style: TextStyle(
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Technician Dropdown com estilo aprimorado
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            offset: const Offset(0, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _selectedTechnicianId,
                        isExpanded: true,
                        decoration: InputDecoration(
                          labelText: 'Receiving Technician',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.cyanAccent : Colors.teal,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.symmetric(
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
                        items: _technicians.map((tech) {
                          return DropdownMenuItem<String>(
                            value: tech.userId,
                            child: Text(tech.fullName,
                                style: const TextStyle(fontFamily: 'Inter')),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() => _selectedTechnicianId = value);
                        },
                      ),
                    ),

                    // Exibição do valor de adição
                    if (_selectedUpdateLevel != null &&
                        selectedTechnicianName != null)
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Receiving: $selectedTechnicianName',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              '+${_currencyFormatter.format(_selectedUpdateLevel!.additionAmt)}',
                              style: TextStyle(
                                fontFamily: 'Space Grotesk',
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 16),

                    // Update Level Dropdown estilizado
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            offset: const Offset(0, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: DropdownButtonFormField<_UpdateLevelInfo>(
                        value: _selectedUpdateLevel,
                        isExpanded: true,
                        decoration: InputDecoration(
                          labelText: 'Update Level',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDarkMode
                                ? Colors.amberAccent
                                : Colors.amber.shade900,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: isDarkMode
                                  ? Colors.amberAccent
                                  : Colors.amber.shade900,
                              width: 2,
                            ),
                          ),
                        ),
                        items: _updateLevels.map((level) {
                          return DropdownMenuItem<_UpdateLevelInfo>(
                            value: level,
                            child: Text(level.updateSeq,
                                style: const TextStyle(fontFamily: 'Inter')),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() => _selectedUpdateLevel = value);
                        },
                      ),
                    ),

                    // Técnico com dedução (novo campo)
                    if (_selectedUpdateLevel != null &&
                        widget.deductionTechnicianName != null)
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.red.shade200),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Deduction: ${widget.deductionTechnicianName}',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              _currencyFormatter
                                  .format(-_selectedUpdateLevel!.discountAmt),
                              style: TextStyle(
                                fontFamily: 'Space Grotesk',
                                fontWeight: FontWeight.bold,
                                color: Colors.red.shade600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 16),

                    // Sumário com estilo melhorado para os chips
                    if (_selectedUpdateLevel != null)
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? Colors.grey.shade900.withOpacity(0.5)
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isDarkMode
                                ? Colors.white10
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Update Summary',
                              style: TextStyle(
                                fontFamily: 'Space Grotesk',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: isDarkMode
                                    ? Colors.white70
                                    : Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Chip de adição
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.green.shade600,
                                        Colors.green.shade800
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green.withOpacity(0.3),
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    '+${_currencyFormatter.format(_selectedUpdateLevel!.additionAmt)}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                // Chip de dedução
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.red.shade600,
                                        Colors.red.shade800
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red.withOpacity(0.3),
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    _currencyFormatter.format(
                                        -_selectedUpdateLevel!.discountAmt),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    const Spacer(), // Push button to bottom if height allows

                    // Botões (Cancelar e Apply) com estilo aprimorado
                    Row(
                      children: [
                        // Botão Cancelar
                        Expanded(
                          flex: 2,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: BorderSide(
                                color: isDarkMode
                                    ? Colors.white30
                                    : Colors.grey.shade400,
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: _closeBottomSheet,
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Space Grotesk',
                                color: isDarkMode
                                    ? Colors.white70
                                    : Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Botão Apply Update
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: canApply
                                  ? Colors.cyan.shade600
                                  : Colors.grey.shade600,
                              foregroundColor: Colors.white,
                              elevation: canApply ? 3 : 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Space Grotesk',
                                letterSpacing: 0.5,
                              ),
                            ),
                            onPressed:
                                canApply && !_isLoading ? _applyUpdate : null,
                            child: _isLoading &&
                                    _technicians.isNotEmpty &&
                                    _updateLevels
                                        .isNotEmpty // Only show spinner when actively applying
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 8),
                                      const Text('APPLY UPDATE'),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ].animate(interval: 50.ms).slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 400.ms,
                        curve: Curves.easeOutCubic,
                      ),
                ),
    );
  }
}

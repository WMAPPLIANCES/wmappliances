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

import 'package:google_fonts/google_fonts.dart';

class ListOfItems extends StatefulWidget {
  const ListOfItems({
    super.key,
    this.width,
    this.height = 400,
    required this.items, // Espera List<dynamic>?
    // Removido: this.onEditItem,
  });

  final double? width;
  final double? height;
  final List<dynamic>? items;
  // Removido: final Future<dynamic> Function(dynamic)? onEditItem;

  @override
  State<ListOfItems> createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  List<Map<String, dynamic>> _parsedItems = [];

  @override
  void initState() {
    super.initState();
    _parseItemsInput();
  }

  @override
  void didUpdateWidget(covariant ListOfItems oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items != oldWidget.items) {
      print(
          "ListOfItems (Simplified): didUpdateWidget called, items changed. Reparsing.");
      _parseItemsInput();
      if (mounted) {
        setState(() {});
      }
    }
  }

  void _parseItemsInput() {
    print(
        "ListOfItems (Simplified): Parsing input. Input type: ${widget.items?.runtimeType}");
    _parsedItems = [];
    final List<dynamic>? inputList = widget.items;

    if (inputList == null || inputList.isEmpty) {
      print("ListOfItems (Simplified): Input list is null or empty.");
      return;
    }

    try {
      _parsedItems = List<Map<String, dynamic>>.from(
        inputList.map((item) {
          if (item is Map) {
            return Map<String, dynamic>.from(item.map(
              (key, value) => MapEntry(key.toString(), value),
            ));
          } else {
            print('ListOfItems (Simplified): Item is not a Map: $item');
            return <String, dynamic>{};
          }
        }).where((item) => item.isNotEmpty),
      );
      print(
          "ListOfItems (Simplified): Parsed ${inputList.length} items. Result count: ${_parsedItems.length}");
    } catch (e) {
      print('ListOfItems (Simplified): Error converting list items: $e');
      _parsedItems = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    print(
        "ListOfItems (Simplified): Building widget. Parsed items count: ${_parsedItems.length}");

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.primaryBackground,
            theme.secondaryBackground,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: theme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: _parsedItems.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'No items to display.', // <<< Traduzido
                    style:
                        theme.bodyMedium.copyWith(color: theme.secondaryText),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                itemCount: _parsedItems.length,
                itemBuilder: (context, index) {
                  final itemData = _parsedItems[index];
                  // Extração com fallback "Not Provided"
                  final String itemName = itemData['itemName']?.toString() ??
                      'Item Name Not Provided'; // Fallback específico
                  final String brand = itemData['brand']?.toString() ??
                      ''; // Deixa vazio para _buildDetailRow tratar
                  final String model = itemData['model']?.toString() ?? '';
                  final String location =
                      itemData['location']?.toString() ?? '';
                  final String? problem = itemData['problem']?.toString();

                  return Card(
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    color: theme.secondaryBackground.withOpacity(0.9),
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      // Padding normal agora que o botão foi removido
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Linha do Título (sem botão)
                          Row(
                            children: [
                              Icon(
                                Icons.inventory_2_outlined,
                                color: theme.primary,
                                size: 22.0,
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: Text(
                                  itemName,
                                  style: theme.titleMedium.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: theme.primaryText,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // Removido: IconButton
                            ],
                          ),
                          SizedBox(height: 10.0),

                          // Detalhes (com fallback e labels em inglês)
                          _buildDetailRow(context, Icons.branding_watermark,
                              'Brand', brand), // <<< Traduzido
                          _buildDetailRow(
                              context,
                              Icons.confirmation_number_outlined,
                              'Model',
                              model), // <<< Traduzido
                          _buildDetailRow(context, Icons.location_on_outlined,
                              'Location', location), // <<< Traduzido

                          // Seção do Problema (condicional)
                          if (problem != null && problem.isNotEmpty) ...[
                            Divider(
                                height: 20.0,
                                thickness: 1.0,
                                color: theme.alternate.withOpacity(0.5)),
                            _buildDetailRow(
                                context,
                                Icons.report_problem_outlined,
                                'Problem', // <<< Traduzido
                                problem,
                                valueColor: theme.error),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  // Função auxiliar atualizada com fallback text e labels em inglês
  Widget _buildDetailRow(
      BuildContext context, IconData icon, String label, String value,
      {Color? valueColor}) {
    final theme = FlutterFlowTheme.of(context);
    int maxLines = label == 'Problem' ? 5 : 2; // Ajuste de linhas
    // Define o texto a ser exibido: o valor ou o fallback "Not Provided"
    final String displayValue = (value == null || value.trim().isEmpty)
        ? 'Not Provided' // <<< Fallback Text
        : value;
    // Define a cor do valor (cinza se for fallback, senão a cor padrão/passada)
    final Color displayColor = (value == null || value.trim().isEmpty)
        ? theme.secondaryText // Cor cinza para "Not Provided"
        : (valueColor ?? theme.primaryText); // Cor normal ou de erro

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: theme.secondaryText,
            size: 18.0,
          ),
          SizedBox(width: 8.0),
          Text(
            '$label: ', // <<< Label já está em inglês
            style: theme.bodyMedium.copyWith(
              color: theme.secondaryText,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              displayValue, // <<< Exibe o valor ou o fallback
              style: theme.bodyMedium.copyWith(
                color: displayColor, // <<< Usa a cor definida
              ),
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
// DO NOT REMOVE OR MODIFY THE CODE BELOW!
// End custom widget code

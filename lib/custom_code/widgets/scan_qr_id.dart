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

// Adicione esta importação para garantir o acesso correto ao AppState

// Pacotes de scanner
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrId extends StatefulWidget {
  const ScanQrId({
    super.key,
    this.width,
    this.height,
  });

  final double? width, height; // Permite null safety

  @override
  State<ScanQrId> createState() => _ScanQrIdState();
}

class _ScanQrIdState extends State<ScanQrId> {
  String? _localQrCodeResult;

  @override
  Widget build(BuildContext context) {
    // Define um tamanho padrão maior se width e height não forem fornecidos
    final width = widget.width ?? 400.0; // Aumentei o tamanho padrão
    final height = widget.height ?? 500.0; // Aumentei o tamanho padrão

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        // Usando Stack para sobrepor o scanner e o overlay
        children: [
          AiBarcodeScanner(
            onDetect: (BarcodeCapture result) {
              if (result.barcodes.isNotEmpty) {
                final String value = result.barcodes.first.rawValue ?? '';

                // Atualização correta do AppState
                if (value.isNotEmpty) {
                  FFAppState().update(() {
                    FFAppState().qrUuidScaned = value;
                  });
                  if (mounted) Navigator.pop(context); // Fechar após leitura
                }
              }
            },
          ),
          // Overlay visual para destacar a área de leitura
          Center(
            child: Container(
              width:
                  width * 0.7, // 70% da largura do scanner como área de leitura
              height:
                  height * 0.5, // 50% da altura do scanner como área de leitura
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white
                      .withOpacity(0.8), // Borda branca semi-transparente
                  width: 2.0,
                ),
                borderRadius:
                    BorderRadius.circular(10.0), // Borda arredondada (opcional)
              ),
            ),
          ),
        ],
      ),
    );
  }
}

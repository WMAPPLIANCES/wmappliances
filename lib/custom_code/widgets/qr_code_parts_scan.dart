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
import '/flutter_flow/flutter_flow_model.dart';

// Pacotes de scanner
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodePartsScan extends StatefulWidget {
  const QrCodePartsScan({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<QrCodePartsScan> createState() => _QrCodePartsScanState();
}

class _QrCodePartsScanState extends State<QrCodePartsScan> {
  String? _localQrCodeResult;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 300,
      height: widget.height ?? 400,
      child: AiBarcodeScanner(
        onDetect: (BarcodeCapture result) {
          if (result.barcodes.isNotEmpty) {
            final String value = result.barcodes.first.rawValue ?? '';

            // Atualização correta do AppState
            if (value.isNotEmpty) {
              // Correção do nome do método (verifique o nome gerado no seu projeto)
              FFAppState().update(() {
                FFAppState().qrCodeStockParts =
                    value; // Nome exato da variável do AppState
              });

              // Fechar scanner após leitura bem-sucedida
              if (mounted) Navigator.pop(context);
            }
          }
        },
      ),
    );
  }
}

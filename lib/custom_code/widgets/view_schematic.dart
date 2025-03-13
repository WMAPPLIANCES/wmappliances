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

import 'package:url_launcher/url_launcher.dart';

class ViewSchematic extends StatefulWidget {
  const ViewSchematic({
    super.key,
    this.width,
    this.height,
    required this.urlData, // Renomeado para urlData para refletir que agora contém mais dados
  });

  final double? width;
  final double? height;
  final List<dynamic> urlData; // Agora espera uma lista de objetos (mapas)

  @override
  State<ViewSchematic> createState() => _ViewSchematicState();
}

class _ViewSchematicState extends State<ViewSchematic> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        // Usamos Column para empilhar os botões verticalmente
        mainAxisSize: MainAxisSize
            .min, // Para que a Column ocupe apenas o espaço necessário
        children: widget.urlData.map((item) {
          // Iteramos sobre a lista de urlData
          final title = item['title'] as String? ??
              'View Schematic'; // Extrai o título, fallback para 'View Schematic'
          final urlString = item['url'] as String?; // Extrai a URL

          return Padding(
            // Adiciona um pequeno espaçamento entre os botões
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ElevatedButton(
              onPressed: () async {
                if (urlString != null) {
                  print('Attempting to launch URL: $urlString');
                  final Uri? uri = Uri.tryParse(urlString);
                  if (uri != null && uri.isAbsolute) {
                    print('Parsed URI: $uri');
                    try {
                      await launchUrl(uri);
                      print('URL launched successfully: $uri');
                    } catch (e) {
                      print('Could not launch URL: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Could not open link: $e'),
                        ),
                      );
                    }
                  } else {
                    print('Invalid URL: $urlString');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Invalid link provided.'),
                      ),
                    );
                  }
                } else {
                  print('URL is null for item: $item');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('No link available for this item.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                foregroundColor: FlutterFlowTheme.of(context).info,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                title, // Usa o título extraído do JSONB
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: FlutterFlowTheme.of(context).info,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

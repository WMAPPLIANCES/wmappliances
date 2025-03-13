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

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

class PrintStockParts extends StatefulWidget {
  // Parameters for dynamic data
  final String partNumber;
  final String partName;
  final String item;
  final String stockId; // Used to generate the QR Code
  final String printerName; // Exact printer name in PrintNode
  final String typeDate; // New field: Type/Date

  // Optional parameters to allow FlutterFlow to use width/height
  final double? width;
  final double? height;

  const PrintStockParts({
    Key? key,
    // These two below solve the error "No named parameter with the name 'width'"
    this.width,
    this.height,
    // Mandatory parameters
    required this.partNumber,
    required this.partName,
    required this.item,
    required this.stockId,
    required this.typeDate, // Required Type/Date parameter
    this.printerName = 'ITPP130 Printer',
  }) : super(key: key);

  @override
  State<PrintStockParts> createState() => _PrintStockPartsState();
}

class _PrintStockPartsState extends State<PrintStockParts> {
  // PrintNode API Key – replace with your actual value
  final String _printNodeApiKey = 'MeHXF5K_9eDyCdIxtxiamPae47Dd0vbiRzIlAJokckY';

  int? _printerId;
  bool _isLoading = true;
  String _statusMessage = 'Starting...';

  @override
  void initState() {
    super.initState();
    _initializePrintProcess();
  }

  Future<void> _initializePrintProcess() async {
    try {
      // 1) Fetch the printer ID from PrintNode
      await _fetchPrinterId();

      // 2) If the ID is obtained, generate the PDF and send it to print
      if (_printerId != null) {
        await _generateAndPrintPdf();
      }
    } catch (e) {
      _showSnackBar('Initial error: $e', Colors.red);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _fetchPrinterId() async {
    try {
      setState(() => _statusMessage = 'Searching for printer...');

      final response = await http.get(
        Uri.parse('https://api.printnode.com/printers'),
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$_printNodeApiKey:'))}',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> printers = jsonDecode(response.body);

        // Find the printer whose 'name' is equal to widget.printerName
        final targetPrinter = printers.firstWhere(
          (printer) => printer['name'] == widget.printerName,
          orElse: () => null,
        );

        if (targetPrinter != null) {
          _printerId = targetPrinter['id'];
          debugPrint('Printer found: ID $_printerId');
        } else {
          throw Exception('Printer "${widget.printerName}" not found');
        }
      } else {
        throw Exception('API Error: ${response.statusCode}');
      }
    } catch (e) {
      _showSnackBar('Failed to find printer: $e', Colors.red);
      rethrow;
    }
  }

  Future<void> _generateAndPrintPdf() async {
    final pdfDoc = pw.Document();
    try {
      setState(() => _statusMessage = 'Creating PDF...');

      // Load the logo from the web to display in the header
      final logoImage = await networkImage(
        'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/logowm1920x1080.png',
      );

      // Create a page in 100x152mm format with the label layout
      pdfDoc.addPage(
        pw.Page(
          pageFormat: PdfPageFormat(100 * PdfPageFormat.mm,
              152 * PdfPageFormat.mm), // Define custom page format
          build: (pw.Context context) {
            return pw.Center(
              // Center the entire content vertically and horizontally
              child: pw.Column(
                mainAxisAlignment:
                    pw.MainAxisAlignment.center, // Center content vertically
                crossAxisAlignment: pw.CrossAxisAlignment
                    .center, // Center the content horizontally
                children: [
                  // Logo at the top center, doubled size
                  pw.Image(logoImage,
                      width: 160), // Increased logo size (doubled)
                  pw.SizedBox(height: 15),
                  // Part Number highlighted below the logo, doubled size
                  pw.Text(
                    widget.partNumber,
                    style: pw.TextStyle(
                        fontSize: 36,
                        fontWeight: pw.FontWeight
                            .bold), // Increased font size (doubled) and bold
                  ),
                  pw.SizedBox(height: 10),
                  // Part Name below the Part Number
                  pw.Text(
                    widget.partName,
                    style: pw.TextStyle(fontSize: 16),
                  ),
                  pw.SizedBox(height: 10),
                  // Item below the Part Name (Value only, without "Item:")
                  pw.Text(
                    widget.item, // Display only the item value
                    style: pw.TextStyle(fontSize: 16),
                  ),
                  pw.SizedBox(height: 25),
                  // QR Code below the Item
                  pw.BarcodeWidget(
                    barcode: pw.Barcode.qrCode(),
                    data: widget.stockId,
                    width: 120,
                    height: 120,
                  ),
                  pw.SizedBox(height: 10),
                  // Stock ID below the QR Code
                  pw.Text(
                    'Stock ID: ${widget.stockId}',
                    style: pw.TextStyle(fontSize: 12),
                  ),
                  pw.SizedBox(height: 5), // Add some spacing
                  // Type/Date below the Stock ID
                  pw.Text(
                    'Type/Date: ${widget.typeDate}', // Display Type/Date
                    style: pw.TextStyle(fontSize: 12),
                  ),
                ],
              ),
            );
          },
        ),
      );

      // Convert the PDF to bytes and send it to print
      final pdfData = await pdfDoc.save();
      await _printPdfWithPrintNode(pdfData);
    } catch (e) {
      _showSnackBar('Error creating PDF: $e', Colors.red);
    }
  }

  Future<void> _printPdfWithPrintNode(Uint8List pdfData) async {
    try {
      setState(() => _statusMessage = 'Sending to printer...');

      final response = await http.post(
        Uri.parse('https://api.printnode.com/printjobs'),
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$_printNodeApiKey:'))}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "printerId": _printerId,
          "title": "Label 100x152mm - ${widget.partNumber}",
          "contentType": "pdf_base64",
          "content": base64Encode(pdfData).replaceAll(RegExp(r'\n'), ''),
          "options": {
            "media": "Custom", // Use "Custom" media for specific size
            "pageSize": "Custom",
            "width": 100, // Width in mm
            "height": 152, // Height in mm
            "bin": "1",
          }
        }),
      );

      if (response.statusCode == 201) {
        _showSnackBar('Print job scheduled!', Colors.green);
      } else {
        throw Exception('API Error: ${response.body}');
      }
    } catch (e) {
      _showSnackBar('Print failed: $e', Colors.red);
    }
  }

  void _showSnackBar(String message, Color color) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: color,
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // If FlutterFlow passes width/height, we will use it to delimit the container
    return Container(
      width: widget.width,
      height: widget.height,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WM Printing System'),
          centerTitle: true,
        ),
        body: Center(
          child: _isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20),
                    Text(
                      _statusMessage,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.print, size: 50, color: Colors.blue),
                    SizedBox(height: 20),
                    Text('Process completed!'),
                  ],
                ),
        ),
      ),
    );
  }
}

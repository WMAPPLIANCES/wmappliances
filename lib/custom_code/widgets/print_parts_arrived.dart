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

class PrintPartsArrived extends StatefulWidget {
  // Parameters for dynamic data
  final String name; // Renamed from partNumber, max 13 chars
  final String workOrderId; // New parameter: Work Order ID
  final String item;
  final String
      stockId; // Used to generate the QR Code - not used for QR code anymore
  final String printerName; // Exact printer name in PrintNode
  // removed final String typeDate; //  Date/Time and Appliance Type
  final String requestedQuantity; //  Requested Quantity
  final String arrivedQuantity; //  Arrived Quantity

  // Optional parameters to allow FlutterFlow to use width/height
  final double? width;
  final double? height;

  const PrintPartsArrived({
    Key? key,
    // These two below solve the error "No named parameter with the name 'width'"
    this.width,
    this.height,
    // Mandatory parameters
    required this.name, // Renamed from partNumber
    required this.workOrderId, // New parameter
    required this.item,
    required this.stockId, // still required for process, but not used for QR
    // removed required this.typeDate,
    required this.requestedQuantity,
    required this.arrivedQuantity,
    this.printerName = 'ITPP130 Printer',
  }) : super(key: key);

  @override
  State<PrintPartsArrived> createState() => _PrintPartsArrivedState();
}

class _PrintPartsArrivedState extends State<PrintPartsArrived> {
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
                  pw.SizedBox(height: 5),

                  // Name (Part Number) - Max 13 characters, Doubled size
                  pw.Text(
                    widget.name.length > 13
                        ? widget.name.substring(0, 13)
                        : widget.name, // Truncate to 13 chars
                    style: pw.TextStyle(
                        fontSize: 42, // Doubled size from previous 24
                        fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(height: 5),

                  // Work Order ID - Medium size, without label
                  pw.Text(
                    widget.workOrderId,
                    style: pw.TextStyle(fontSize: 26), // Medium size
                  ),
                  pw.SizedBox(height: 5),

                  // Requested Field and Parameter - Doubled label size, Tripled number size
                  pw.Text(
                    'Requested',
                    style: pw.TextStyle(fontSize: 28), // Doubled label size
                  ),
                  pw.Text(
                    widget.requestedQuantity,
                    style: pw.TextStyle(fontSize: 48), // Tripled number size
                  ),
                  pw.SizedBox(height: 5),

                  // Arrived Field and Parameter - Doubled label size, Tripled number size
                  pw.Text(
                    'Arrived',
                    style: pw.TextStyle(fontSize: 28), // Doubled label size
                  ),
                  pw.Text(
                    widget.arrivedQuantity,
                    style: pw.TextStyle(fontSize: 48), // Tripled number size
                  ),
                  pw.SizedBox(height: 5),

                  // Item below Arrived
                  pw.Text(
                    'Item: ${widget.item}',
                    style: pw.TextStyle(fontSize: 16),
                  ),
                  pw.SizedBox(height: 5),

                  // QR Code at the bottom, smaller size, using Work Order ID
                  pw.BarcodeWidget(
                    barcode: pw.Barcode.qrCode(),
                    data: widget.workOrderId, // Changed to workOrderId
                    width: 80, // Reduced size
                    height: 80, // Reduced size
                  ),
                  pw.SizedBox(height: 5),

                  // removed Type/Date below the QR Code
                  // pw.Text(
                  //   '${widget.typeDate}', // Display Type/Date (Date/Time and Appliance Type)
                  //   style: pw.TextStyle(fontSize: 12),
                  //   textAlign: pw.TextAlign.center, // Center align the text
                  // ),
                  // pw.SizedBox(height: 5),
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
          "title": "Label 100x152mm - ${widget.name}",
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

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

import 'package:qr_flutter/qr_flutter.dart'; // Added dependency: qr_flutter

class QrIdGenerate extends StatefulWidget {
  const QrIdGenerate({
    super.key,
    this.width,
    this.height,
    required this.userId, // Required userId parameter - Changed from 'id' to 'userId'
  });

  final double? width;
  final double? height;
  final String
      userId; // Parameter to receive the User ID - Changed from 'id' to 'userId'

  @override
  State<QrIdGenerate> createState() => _QrIdGenerateState();
}

class _QrIdGenerateState extends State<QrIdGenerate> {
  bool _showQrCode = false; // Controls the visibility of the QR Code

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Center(
        child: _showQrCode
            ? _buildQrCodeDisplay() // Shows the QR Code if _showQrCode is true
            : ElevatedButton(
                // Button to open the QR Code
                onPressed: () {
                  setState(() {
                    _showQrCode =
                        true; // Sets _showQrCode to true to display the QR Code
                  });
                },
                child: const Text('Show QR Code'), // Button text
                style: ElevatedButton.styleFrom(
                  // Modern and futuristic button style
                  backgroundColor: FlutterFlowTheme.of(context)
                      .primary, // Primary theme color
                  foregroundColor: Colors.white, // White text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15), // Button padding
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10)), // Rounded borders
                  elevation: 5, // Elevation for a 3D effect
                ),
              ),
      ),
    );
  }

  Widget _buildQrCodeDisplay() {
    return Stack(
      // Using Stack to overlay the close button
      alignment: Alignment
          .topRight, // Aligning the close button to the top right corner
      children: [
        Container(
          // Container for the QR Code with background and rounded borders
          padding:
              const EdgeInsets.all(20), // Internal padding of the container
          decoration: BoxDecoration(
            // Container decoration
            color: FlutterFlowTheme.of(context)
                .secondaryBackground, // Secondary background theme color
            borderRadius:
                BorderRadius.circular(20), // Rounded borders of the container
            boxShadow: [
              // Shadow to give a depth effect
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                spreadRadius: 5, // Shadow spread radius
                blurRadius: 10, // Shadow blur radius
                offset: const Offset(0, 3), // Shadow offset
              ),
            ],
          ),
          child: Column(
            // Column to organize the QR Code and optional text
            mainAxisSize: MainAxisSize.min, // Minimum column size
            children: [
              QrImageView(
                // Widget to generate and display the QR Code
                data: widget
                    .userId, // Data for the QR Code, coming from the 'userId' parameter - Changed to userId
                version: QrVersions.auto, // Automatic QR Code version
                size: 200.0, // QR Code size
                eyeStyle: QrEyeStyle(
                  // Style of the QR Code eyes (corners)
                  eyeShape: QrEyeShape.square, // Square shape of the eyes
                  color: Colors
                      .black, // **MODIFICATION: Force black color for eyes for better contrast**
                ),
                dataModuleStyle: QrDataModuleStyle(
                  // Style of the data modules (internal dots)
                  dataModuleShape:
                      QrDataModuleShape.square, // Square shape of the modules
                  color: Colors
                      .black, // **MODIFICATION: Force black color for modules for better contrast**
                ),
                backgroundColor: Colors
                    .white, // **MODIFICATION: Force white background for maximum contrast**
              ),
              const SizedBox(
                  height: 10), // Spacing between the QR Code and the text
              Text(
                // Optional text below the QR Code
                'User ID: ${widget.userId}', // Displaying the User ID below the QR Code - Changed to userId
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      // Text style
                      fontFamily: 'Readex Pro', // Text font
                      color: FlutterFlowTheme.of(context)
                          .primaryText, // Text color (primary text theme color)
                    ),
              ),
            ],
          ),
        ),
        Padding(
          // Padding for the close button to not stick to the border
          padding: const EdgeInsets.all(8.0), // Padding of the close button
          child: IconButton(
            // Button to close the QR Code
            icon: const Icon(Icons.close,
                color: Colors.white), // White close icon
            style: IconButton.styleFrom(
              // IconButton style for circular background and color
              backgroundColor: FlutterFlowTheme.of(context)
                  .error, // Red background color (error theme color)
              shape: const CircleBorder(), // Circular button shape
            ),
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Dismisses the bottom sheet (if any) and hides QR Code
            },
          ),
        ),
      ],
    );
  }
}

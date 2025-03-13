// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as path; // Import path package

Future<FFUploadedFile?> convertAudioPathToUploadedFile(
    String audioFilePath) async {
  // Add your function code here!
  Uint8List? audioBytes = null;
  String fileName = "savedAudio.m4a"; // Default filename

  try {
    File file = File.fromUri(Uri.parse(audioFilePath));

    try {
      audioBytes = await file.readAsBytes();

      // Extract filename from path if possible
      fileName =
          path.basename(audioFilePath); // Use path package to get filename

      FFUploadedFile audioFile =
          new FFUploadedFile(bytes: audioBytes, name: fileName);
      return audioFile;
    } catch (e) {
      print("Error reading audio file: $e");
      return null;
    }
  } catch (e) {
    print("Error creating File object from path: $e");
    return null;
  }
}

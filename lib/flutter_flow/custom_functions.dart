import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

Color hexToColor(String colorHex) {
  // Converts a hexadecimal color string to color
  colorHex = colorHex.replaceAll("#", "");
  if (colorHex.length == 6) {
    colorHex = "FF" + colorHex;
  }
  int colorInt = int.parse(colorHex, radix: 16);
  return Color(colorInt);
}

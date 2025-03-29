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

DateTime today() {
  final now = DateTime.now(); // Get the current date and time
  final formatter =
      DateFormat('yyyy-MM-dd'); // Create a formatter for yyyy-MM-dd
  final formattedDateString =
      formatter.format(now); // Format the DateTime to a string

  // To return a DateTime object (as the function signature suggests), parse the formatted string back to DateTime.
  // This will effectively give you a DateTime object representing today with the time set to midnight (00:00:00).
  return DateTime.parse(formattedDateString);
}

LatLng convertlanLngStringToLatLng(
  double lat,
  double lng,
) {
  // function to convert double lat and lng into latLng
  return LatLng(lat, lng);
}

DateTime scheduleDate(String dateString) {
  if (dateString.isNotEmpty) {
    return DateTime.parse(dateString);
  } else {
    throw ArgumentError("A string de data não pode ser nula ou vazia.");
  }
}

int convertStringToInt(String stringValue) {
  if (stringValue.isNotEmpty) {
    try {
      return int.parse(stringValue);
    } catch (e) {
      throw ArgumentError(
          "A string não contém um inteiro válido: $stringValue");
    }
  } else {
    throw ArgumentError("A string não pode ser nula ou vazia.");
  }
}

String? convertDateTimeInDate(DateTime? dateTime) {
  if (dateTime == null) {
    return null;
  }
  return DateFormat('yyyy-MM-dd').format(dateTime);
}

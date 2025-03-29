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

import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:intl/intl.dart'; // For date formatting

// ATTENTION: Make sure the class name below is exactly the same
// as the name given in the FlutterFlow editor for this custom widget.
class DatePartArrived extends StatefulWidget {
  const DatePartArrived({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<DatePartArrived> createState() => _DatePartArrivedState();
}

class _DatePartArrivedState extends State<DatePartArrived> {
  DateTime? selectedDateArrived;
  TextEditingController searchTrackingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set initial default date to today
    selectedDateArrived = DateTime.now();
    _updateAppStateDate(); // Initialize App State with current date
  }

  void _updateAppStateDate() {
    if (selectedDateArrived != null) {
      print(
          "DatePartArrived - _updateAppStateDate - Updating App State with dateTrackingArrive: $selectedDateArrived");
      FFAppState().dateTrackingArrive = selectedDateArrived;
    } else {
      print(
          "DatePartArrived - _updateAppStateDate - selectedDateArrived is NULL, App State NOT updated.");
    }
  }

  void _updateAppStateSearch(String searchText) {
    print(
        "DatePartArrived - _updateAppStateSearch - Updating App State with trackingSearch: $searchText");
    FFAppState().trackingSearch = searchText;
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = selectedDateArrived != null
        ? DateFormat('dd/MM/yyyy').format(selectedDateArrived!)
        : 'Select Date'; // Default message if no date selected

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Padding(
        padding: const EdgeInsets.all(
            8.0), // Adds general padding for better visualization
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchTrackingController,
              decoration: InputDecoration(
                labelText: 'Search Tracking Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (text) {
                _updateAppStateSearch(
                    text); // Updates App State on each text change
              },
            ),
            SizedBox(height: 12), // Spacing between TextField and date button
            ElevatedButton.icon(
              // Using ElevatedButton.icon for a more visual button
              onPressed: () async {
                DateTime now = DateTime.now();
                DateTime initialDateForPicker = selectedDateArrived ?? now;

                DateTime? pickedDate = await showOmniDateTimePicker(
                  context: context,
                  type: OmniDateTimePickerType.date, // Sets to date only
                  initialDate: initialDateForPicker,
                  firstDate: DateTime(1600),
                  lastDate: DateTime.now().add(const Duration(days: 3652)),
                  is24HourMode: true,
                  isShowSeconds: false,
                  minutesInterval: 1,
                  secondsInterval: 1,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(8)), // Rounded borders
                  constraints: const BoxConstraints(
                    maxWidth: 350,
                    maxHeight: 650,
                  ),
                  transitionBuilder: (context, anim1, anim2, child) {
                    return FadeTransition(
                      opacity: anim1.drive(
                        Tween(
                          begin: 0,
                          end: 1,
                        ),
                      ),
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 300),
                  barrierDismissible: true,
                );

                setState(() {
                  selectedDateArrived = pickedDate;
                });
                print(
                    'DatePartArrived - ElevatedButton Picker - Selected Date: $pickedDate');
                _updateAppStateDate();
              },
              icon: Icon(Icons.calendar_today), // Calendar icon
              label: Text(
                  formattedDate), // Displays formatted date or default message
              style: ElevatedButton.styleFrom(
                minimumSize: Size(widget.width ?? double.infinity,
                    50), // Button takes available width
              ),
            ),
          ],
        ),
      ),
    );
  }
}

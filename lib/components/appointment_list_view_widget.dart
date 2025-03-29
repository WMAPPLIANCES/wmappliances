import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'appointment_list_view_model.dart';
export 'appointment_list_view_model.dart';

class AppointmentListViewWidget extends StatefulWidget {
  const AppointmentListViewWidget({
    super.key,
    required this.scheduleQuery,
  });

  final SchedulesRow? scheduleQuery;

  @override
  State<AppointmentListViewWidget> createState() =>
      _AppointmentListViewWidgetState();
}

class _AppointmentListViewWidgetState extends State<AppointmentListViewWidget> {
  late AppointmentListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentListViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.0,
      height: 120.0,
      child: custom_widgets.DispatchViewMapToday(
        width: 390.0,
        height: 120.0,
        technicianImage: valueOrDefault<String>(
          widget.scheduleQuery?.techniciansPhoto,
          'https://api.wmappliances.cloud/storage/v1/object/public/photos/users/LOGO%20WM%20APPLIANCE%20NOVA%20casa%20alta%20reso.png',
        ),
        technicianName: valueOrDefault<String>(
          widget.scheduleQuery?.techniciansName,
          'Willian Fernando',
        ),
        technicianColor: valueOrDefault<String>(
          widget.scheduleQuery?.technicianColor,
          '#2797FF',
        ),
        workOrderId: valueOrDefault<String>(
          widget.scheduleQuery?.workOrderId,
          '00300',
        ),
        address: valueOrDefault<String>(
          widget.scheduleQuery?.customerAddress,
          '15175 Discvovery Rd',
        ),
        stopNumber: valueOrDefault<int>(
          widget.scheduleQuery?.stopNumber,
          1,
        ),
        eventType: valueOrDefault<String>(
          widget.scheduleQuery?.eventType,
          'Diagnosis',
        ),
        startTime: widget.scheduleQuery!.startTime!,
        endTime: widget.scheduleQuery!.endTime!,
      ),
    );
  }
}

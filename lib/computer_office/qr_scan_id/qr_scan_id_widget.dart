import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'qr_scan_id_model.dart';
export 'qr_scan_id_model.dart';

class QrScanIdWidget extends StatefulWidget {
  const QrScanIdWidget({super.key});

  @override
  State<QrScanIdWidget> createState() => _QrScanIdWidgetState();
}

class _QrScanIdWidgetState extends State<QrScanIdWidget> {
  late QrScanIdModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QrScanIdModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: custom_widgets.ScanQrId(
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}

import '';
import '/flutter_flow/flutter_flow_util.dart';
import '/stock_page/part_location_photo/part_location_photo_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'qr_code_scaned_model.dart';
export 'qr_code_scaned_model.dart';

class QrCodeScanedWidget extends StatefulWidget {
  const QrCodeScanedWidget({super.key});

  @override
  State<QrCodeScanedWidget> createState() => _QrCodeScanedWidgetState();
}

class _QrCodeScanedWidgetState extends State<QrCodeScanedWidget> {
  late QrCodeScanedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QrCodeScanedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On component dispose action.
    () async {
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.viewInsetsOf(context),
            child: Container(
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: PartLocationPhotoWidget(),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));
    }();

    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 300.0,
      height: 400.0,
      child: custom_widgets.QrCodePartsScan(
        width: 300.0,
        height: 400.0,
      ),
    );
  }
}

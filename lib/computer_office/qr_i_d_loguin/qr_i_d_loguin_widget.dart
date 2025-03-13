import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'qr_i_d_loguin_model.dart';
export 'qr_i_d_loguin_model.dart';

class QrIDLoguinWidget extends StatefulWidget {
  const QrIDLoguinWidget({
    super.key,
    String? qrLogID,
  }) : this.qrLogID = qrLogID ?? 'wmappliances';

  final String qrLogID;

  @override
  State<QrIDLoguinWidget> createState() => _QrIDLoguinWidgetState();
}

class _QrIDLoguinWidgetState extends State<QrIDLoguinWidget> {
  late QrIDLoguinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QrIDLoguinModel());

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
        width: 600.0,
        height: 600.0,
        child: custom_widgets.QrIdGenerate(
          width: 600.0,
          height: 600.0,
          userId: widget.qrLogID,
        ),
      ),
    );
  }
}

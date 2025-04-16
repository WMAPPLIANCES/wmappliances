import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'create_payment_model.dart';
export 'create_payment_model.dart';

class CreatePaymentWidget extends StatefulWidget {
  const CreatePaymentWidget({
    super.key,
    String? diagnosisId,
    String? technicianName,
    String? technicianUuid,
  })  : this.diagnosisId = diagnosisId ?? '342342',
        this.technicianName = technicianName ?? 'Willian',
        this.technicianUuid = technicianUuid ?? '243434';

  final String diagnosisId;
  final String technicianName;
  final String technicianUuid;

  @override
  State<CreatePaymentWidget> createState() => _CreatePaymentWidgetState();
}

class _CreatePaymentWidgetState extends State<CreatePaymentWidget> {
  late CreatePaymentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatePaymentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                width: 600.0,
                height: 600.0,
                child: custom_widgets.CreatePaymentForm(
                  width: 600.0,
                  height: 600.0,
                  diagnosisId: widget.diagnosisId,
                  technicianUuid: widget.technicianUuid,
                  technicianName: widget.technicianName,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'update_diagnosis_model.dart';
export 'update_diagnosis_model.dart';

class UpdateDiagnosisWidget extends StatefulWidget {
  const UpdateDiagnosisWidget({
    super.key,
    String? diagnosisID,
    String? deductionTechnicianName,
  })  : this.diagnosisID = diagnosisID ?? '12341',
        this.deductionTechnicianName = deductionTechnicianName ?? 'Willian';

  final String diagnosisID;
  final String deductionTechnicianName;

  @override
  State<UpdateDiagnosisWidget> createState() => _UpdateDiagnosisWidgetState();
}

class _UpdateDiagnosisWidgetState extends State<UpdateDiagnosisWidget> {
  late UpdateDiagnosisModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateDiagnosisModel());

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
                height: MediaQuery.sizeOf(context).height * 6.0,
                child: custom_widgets.ApplyUpdate(
                  width: 600.0,
                  height: MediaQuery.sizeOf(context).height * 6.0,
                  diagnosisId: widget.diagnosisID,
                  deductionTechnicianName: widget.deductionTechnicianName,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/work_order_diagnosis_pages/diagnosis_botton_sheet/diagnosis_botton_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'diagnosis_part_model.dart';
export 'diagnosis_part_model.dart';

/// Create a diagnostic page with the following elements:
///
/// Header: A title labeled 'Work Order' at the top of the page, followed by a
/// text field where the user can input the work order number.
///
/// Image Upload Fields: Two side-by-side image upload fields with the
/// following labels:
///
/// 'Model Number' for the first upload field.
/// 'Appliance Photo' for the second upload field.
/// API Response Field: A text field designed to display the API response,
/// with support for displaying clickable links. Next to this field, include a
/// 'Copy' button for users to copy the content with one click.
///
/// Diagnosis Input: A text field where the technician can manually enter the
/// diagnosis.
///
/// Buttons:
///
/// A 'Generate Diagnosis' button that triggers the Agent and returns the
/// diagnosis in the API response field.
/// A 'Save Diagnosis' button that saves the generated or manually entered
/// diagnosis.
/// Additional Buttons for Parts:
///
/// Below the diagnosis field, add two buttons:
/// 'Save Diagnosis'
/// 'Add Part'
/// Part Information Form: If the 'Add Part' button is clicked, a form should
/// appear, allowing the user to input:
///
/// Part Name
/// Part Number
/// Quantity
/// Part Form Buttons: Below the part form, add two buttons:
///
/// 'Save' to save the entered part information.
/// 'Complete' to finish adding parts.
/// Ensure the layout is intuitive and responsive, with all headers and fields
/// clearly labeled, making them easily accessible and functional on both
/// desktop and mobile devices.
class DiagnosisPartWidget extends StatefulWidget {
  const DiagnosisPartWidget({
    super.key,
    required this.workOrderDiagnosis,
  });

  final WorkOrdersRow? workOrderDiagnosis;

  static String routeName = 'diagnosisPart';
  static String routePath = '/diagnosisW';

  @override
  State<DiagnosisPartWidget> createState() => _DiagnosisPartWidgetState();
}

class _DiagnosisPartWidgetState extends State<DiagnosisPartWidget> {
  late DiagnosisPartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiagnosisPartModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'diagnosisPart',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).alternate,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                'Diagnosis',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: wrapWithModel(
                  model: _model.diagnosisBottonSheetModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: DiagnosisBottonSheetWidget(
                    workOrderDiagnosis: widget.workOrderDiagnosis!,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

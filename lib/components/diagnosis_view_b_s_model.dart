import '/backend/supabase/supabase.dart';
import '/components/diagnosis_view_b_s_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'diagnosis_view_b_s_widget.dart' show DiagnosisViewBSWidget;
import 'package:flutter/material.dart';

class DiagnosisViewBSModel extends FlutterFlowModel<DiagnosisViewBSWidget> {
  ///  Local state fields for this component.

  String selectType = 'Select Type....';

  String partPaid = 'PaidBy';

  List<String> diagnosisPhotos = [];
  void addToDiagnosisPhotos(String item) => diagnosisPhotos.add(item);
  void removeFromDiagnosisPhotos(String item) => diagnosisPhotos.remove(item);
  void removeAtIndexFromDiagnosisPhotos(int index) =>
      diagnosisPhotos.removeAt(index);
  void insertAtIndexInDiagnosisPhotos(int index, String item) =>
      diagnosisPhotos.insert(index, item);
  void updateDiagnosisPhotosAtIndex(int index, Function(String) updateFn) =>
      diagnosisPhotos[index] = updateFn(diagnosisPhotos[index]);

  bool showSchematic = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in diagnosisViewBS widget.
  List<DiagnosesRow>? queryDiagnosis;
  // Stores action output result for [Backend Call - Query Rows] action in diagnosisViewBS widget.
  List<StockPartsRow>? queryStockParts;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<DiagnosesRow>? updateQuery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

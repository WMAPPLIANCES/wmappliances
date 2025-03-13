import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_model_model.dart';
export 'list_model_model.dart';

class ListModelWidget extends StatefulWidget {
  const ListModelWidget({super.key});

  @override
  State<ListModelWidget> createState() => _ListModelWidgetState();
}

class _ListModelWidgetState extends State<ListModelWidget> {
  late ListModelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListModelModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'print_part_arrived_model.dart';
export 'print_part_arrived_model.dart';

class PrintPartArrivedWidget extends StatefulWidget {
  const PrintPartArrivedWidget({
    super.key,
    String? customerName,
    String? workOrderId,
    String? date,
    int? requested,
    int? arrived,
  })  : this.customerName = customerName ?? 'custumerName',
        this.workOrderId = workOrderId ?? 'workOrderId',
        this.date = date ?? 'Date',
        this.requested = requested ?? 0,
        this.arrived = arrived ?? 0;

  final String customerName;
  final String workOrderId;
  final String date;
  final int requested;
  final int arrived;

  @override
  State<PrintPartArrivedWidget> createState() => _PrintPartArrivedWidgetState();
}

class _PrintPartArrivedWidgetState extends State<PrintPartArrivedWidget> {
  late PrintPartArrivedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrintPartArrivedModel());

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
      constraints: BoxConstraints(
        maxWidth: 600.0,
        maxHeight: 600.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Container(
        width: 300.0,
        height: 400.0,
        child: custom_widgets.PrintStockParts(
          width: 300.0,
          height: 400.0,
          partNumber: widget.customerName,
          partName: widget.workOrderId,
          item: 'R: ${valueOrDefault<String>(
            widget.requested.toString(),
            '0',
          )} | A: ${valueOrDefault<String>(
            widget.arrived.toString(),
            '0',
          )}',
          stockId: widget.workOrderId,
          printerName: 'ITPP130 Printer',
          typeDate: widget.date,
        ),
      ),
    );
  }
}

import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'print_stock_parts_model.dart';
export 'print_stock_parts_model.dart';

class PrintStockPartsWidget extends StatefulWidget {
  const PrintStockPartsWidget({
    super.key,
    required this.printTockPartsParam,
  });

  final StockPartsRow? printTockPartsParam;

  @override
  State<PrintStockPartsWidget> createState() => _PrintStockPartsWidgetState();
}

class _PrintStockPartsWidgetState extends State<PrintStockPartsWidget> {
  late PrintStockPartsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrintStockPartsModel());

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
          partNumber: '${valueOrDefault<String>(
            widget.printTockPartsParam?.partNumber,
            'part_number',
          )}',
          partName: valueOrDefault<String>(
            widget.printTockPartsParam?.partName,
            'part',
          ),
          item: valueOrDefault<String>(
            widget.printTockPartsParam?.iten,
            'None',
          ),
          stockId: valueOrDefault<String>(
            widget.printTockPartsParam?.stockId,
            'id',
          ),
          printerName: 'ITPP130 Printer',
          typeDate: '|| ${valueOrDefault<String>(
            widget.printTockPartsParam?.workOrderId,
            'ID',
          )} || ${valueOrDefault<String>(
            widget.printTockPartsParam?.type,
            'type',
          )}  ||  ${dateTimeFormat("MMMd", widget.printTockPartsParam?.restockDate)}',
        ),
      ),
    );
  }
}

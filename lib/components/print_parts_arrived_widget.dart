import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'print_parts_arrived_model.dart';
export 'print_parts_arrived_model.dart';

class PrintPartsArrivedWidget extends StatefulWidget {
  const PrintPartsArrivedWidget({
    super.key,
    required this.partsArrived,
    required this.partAgregate,
    required this.workOrder,
  });

  final PartsRow? partsArrived;
  final PartSummaryAggregatedRow? partAgregate;
  final WorkOrdersRow? workOrder;

  @override
  State<PrintPartsArrivedWidget> createState() =>
      _PrintPartsArrivedWidgetState();
}

class _PrintPartsArrivedWidgetState extends State<PrintPartsArrivedWidget> {
  late PrintPartsArrivedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrintPartsArrivedModel());

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
      width: double.infinity,
      height: double.infinity,
      child: custom_widgets.PrintPartsArrived(
        width: double.infinity,
        height: double.infinity,
        item: '${valueOrDefault<String>(
          widget.partsArrived?.iten,
          'Iten',
        )} | ${dateTimeFormat("MMMd", getCurrentTimestamp)}',
        stockId: valueOrDefault<String>(
          widget.partsArrived?.workOrderId,
          'workId',
        ),
        requestedQuantity: valueOrDefault<String>(
          widget.partAgregate?.totalPartSum?.toString(),
          '0',
        ),
        arrivedQuantity: valueOrDefault<String>(
          widget.partAgregate?.totalPartArrivedSum?.toString(),
          '0',
        ),
        printerName: 'ITPP130 Printer',
        name: valueOrDefault<String>(
          widget.workOrder?.customerName,
          'Name',
        ),
        workOrderId: valueOrDefault<String>(
          widget.workOrder?.workOrderId,
          'workID',
        ),
      ),
    );
  }
}

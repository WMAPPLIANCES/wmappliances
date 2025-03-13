import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'search_query_arrived_tracking_model.dart';
export 'search_query_arrived_tracking_model.dart';

class SearchQueryArrivedTrackingWidget extends StatefulWidget {
  const SearchQueryArrivedTrackingWidget({super.key});

  @override
  State<SearchQueryArrivedTrackingWidget> createState() =>
      _SearchQueryArrivedTrackingWidgetState();
}

class _SearchQueryArrivedTrackingWidgetState
    extends State<SearchQueryArrivedTrackingWidget> {
  late SearchQueryArrivedTrackingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchQueryArrivedTrackingModel());

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
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 390.0,
              height: 200.0,
              child: custom_widgets.DatePartArrived(
                width: 390.0,
                height: 200.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'fieldservice_model.dart';
export 'fieldservice_model.dart';

class FieldserviceWidget extends StatefulWidget {
  const FieldserviceWidget({super.key});

  @override
  State<FieldserviceWidget> createState() => _FieldserviceWidgetState();
}

class _FieldserviceWidgetState extends State<FieldserviceWidget> {
  late FieldserviceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FieldserviceModel());

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
      height: 75.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.network(
                  'https://images.unsplash.com/photo-1535368362808-e21d5f250bed?w=50&h=50',
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ahmad Santoso',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Manrope',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    'Field Tech',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.access_time,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20.0,
                ),
                Text(
                  '72%',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(SizedBox(width: 4.0)),
            ),
          ].divide(SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}

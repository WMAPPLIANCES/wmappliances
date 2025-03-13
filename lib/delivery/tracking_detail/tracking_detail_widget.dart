import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tracking_detail_model.dart';
export 'tracking_detail_model.dart';

class TrackingDetailWidget extends StatefulWidget {
  const TrackingDetailWidget({
    super.key,
    required this.deliveryTraking,
  });

  final DeliveryRow? deliveryTraking;

  @override
  State<TrackingDetailWidget> createState() => _TrackingDetailWidgetState();
}

class _TrackingDetailWidgetState extends State<TrackingDetailWidget> {
  late TrackingDetailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackingDetailModel());

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
      child: Padding(
        padding: EdgeInsets.all(36.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tracking # ${valueOrDefault<String>(
                            widget.deliveryTraking?.trackingNumber,
                            'Tracking #',
                          )}',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Text(
                            'Delivered on ${valueOrDefault<String>(
                              dateTimeFormat(
                                  "yMMMd", widget.deliveryTraking?.date),
                              'Mar 6, 2025',
                            )}',
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: Image.network(
                                  valueOrDefault<String>(
                                    widget.deliveryTraking?.photoTracking,
                                    'photo_tracking',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: valueOrDefault<String>(
                                  widget.deliveryTraking?.photoTracking,
                                  'photo_tracking',
                                ),
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: valueOrDefault<String>(
                            widget.deliveryTraking?.photoTracking,
                            'photo_tracking',
                          ),
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                widget.deliveryTraking?.photoTracking,
                                'photo_tracking',
                              ),
                              width: 240.0,
                              height: 240.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: Image.network(
                                  valueOrDefault<String>(
                                    widget.deliveryTraking?.photoItens,
                                    'photo_itens',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: valueOrDefault<String>(
                                  widget.deliveryTraking?.photoItens,
                                  'photo_itens',
                                ),
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: valueOrDefault<String>(
                            widget.deliveryTraking?.photoItens,
                            'photo_itens',
                          ),
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                widget.deliveryTraking?.photoItens,
                                'photo_itens',
                              ),
                              width: 240.0,
                              height: 240.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: Image.network(
                                  valueOrDefault<String>(
                                    widget.deliveryTraking?.partReceipt,
                                    'part_receipt',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: valueOrDefault<String>(
                                  widget.deliveryTraking?.partReceipt,
                                  'part_receipt',
                                ),
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: valueOrDefault<String>(
                            widget.deliveryTraking?.partReceipt,
                            'part_receipt',
                          ),
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                widget.deliveryTraking?.partReceipt,
                                'part_receipt',
                              ),
                              width: 240.0,
                              height: 240.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}

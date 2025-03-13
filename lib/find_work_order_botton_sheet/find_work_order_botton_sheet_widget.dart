import '';
import '/components/side_menu_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'find_work_order_botton_sheet_model.dart';
export 'find_work_order_botton_sheet_model.dart';

/// **Design Prompt for a Modern Responsive Work Order Interface**
///
/// Create a modern, responsive layout for displaying work orders on both
/// desktop and mobile devices.
///
/// ### Layout Requirements:
/// - **Header**: "Work Order" at the top.
/// - **Left Panel**: Include fields:
///   - **Work Order** (WoNumber)
///   - **Customer**
///   - **Tenant**
///   - **Address**
///   - **Detail**
///   - **Status**: Modern display with color-coded labels (e.g., green for
/// "Completed," yellow for "In Progress") and icons.
///
/// - **Right Panel**: Display a list of notes.
///
/// ### Design Features:
/// - Balanced screen split, clean fonts, and intuitive icons.
/// - Status field highlighted with subtle colors.
/// - Consistent padding and responsive scaling.
///
/// ### Mobile View:
/// - Stack panels, prioritize the information panel, and ensure
/// touch-friendly navigation. *** KEEP SIDE BAR***
class FindWorkOrderBottonSheetWidget extends StatefulWidget {
  const FindWorkOrderBottonSheetWidget({super.key});

  static String routeName = 'findWorkOrderBottonSheet';
  static String routePath = '/findWorkOrderbottonSheet';

  @override
  State<FindWorkOrderBottonSheetWidget> createState() =>
      _FindWorkOrderBottonSheetWidgetState();
}

class _FindWorkOrderBottonSheetWidgetState
    extends State<FindWorkOrderBottonSheetWidget> {
  late FindWorkOrderBottonSheetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FindWorkOrderBottonSheetModel());

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
        title: 'findWorkOrderBottonSheet',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Align(
              alignment: AlignmentDirectional(1.0, 1.0),
              child: Stack(
                alignment: AlignmentDirectional(1.0, 1.0),
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.sideMenuViewModel,
                            updateCallback: () => safeSetState(() {}),
                            child: SideMenuViewWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

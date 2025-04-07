import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'chat_bot_support_model.dart';
export 'chat_bot_support_model.dart';

class ChatBotSupportWidget extends StatefulWidget {
  const ChatBotSupportWidget({super.key});

  static String routeName = 'chatBotSupport';
  static String routePath = '/chatBotSupport';

  @override
  State<ChatBotSupportWidget> createState() => _ChatBotSupportWidgetState();
}

class _ChatBotSupportWidgetState extends State<ChatBotSupportWidget> {
  late ChatBotSupportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBotSupportModel());

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
        title: 'chatBotSupport',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    child: custom_widgets.ChatBotSupport(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      chatInput: '',
                      userUuid: currentUserUid,
                      webhook:
                          'https://webhook.wmappliances.cloud/webhook/chatBotSupport',
                      chatImage:
                          'https://api.wmappliances.cloud/storage/v1/object/public/photos/images/1730152737100000_2.jpg',
                      chatAudio:
                          'https://api.wmappliances.cloud/storage/v1/object/public/audioDiagnosis//WhatsApp%20Audio%202025-03-07%20at%2019.59.41_567fede3.waptt.opus',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

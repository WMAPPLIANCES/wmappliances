import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? WelcomeWidget() : LoguinWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? WelcomeWidget() : LoguinWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: DiagnosisPartWidget.routeName,
          path: DiagnosisPartWidget.routePath,
          builder: (context, params) => DiagnosisPartWidget(
            workOrderDiagnosis: params.getParam<WorkOrdersRow>(
              'workOrderDiagnosis',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: EditnotesWidget.routeName,
          path: EditnotesWidget.routePath,
          builder: (context, params) => EditnotesWidget(
            parameterEditPage: params.getParam<NotesRow>(
              'parameterEditPage',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: PagePartStockWidget.routeName,
          path: PagePartStockWidget.routePath,
          builder: (context, params) => PagePartStockWidget(),
        ),
        FFRoute(
          name: DashboardTechnicianWidget.routeName,
          path: DashboardTechnicianWidget.routePath,
          builder: (context, params) => DashboardTechnicianWidget(),
        ),
        FFRoute(
          name: WebSearchWidget.routeName,
          path: WebSearchWidget.routePath,
          builder: (context, params) => WebSearchWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: CreateTechWidget.routeName,
          path: CreateTechWidget.routePath,
          builder: (context, params) => CreateTechWidget(
            userParameter: params.getParam<UsersRow>(
              'userParameter',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(
            userParameter: params.getParam<UsersRow>(
              'userParameter',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: WelcomeWidget.routeName,
          path: WelcomeWidget.routePath,
          builder: (context, params) => WelcomeWidget(),
        ),
        FFRoute(
          name: CreatProfileWidget.routeName,
          path: CreatProfileWidget.routePath,
          builder: (context, params) => CreatProfileWidget(),
        ),
        FFRoute(
          name: AssignUserWidget.routeName,
          path: AssignUserWidget.routePath,
          builder: (context, params) => AssignUserWidget(),
        ),
        FFRoute(
          name: TicketListWidget.routeName,
          path: TicketListWidget.routePath,
          builder: (context, params) => TicketListWidget(),
        ),
        FFRoute(
          name: TicketDetailWidget.routeName,
          path: TicketDetailWidget.routePath,
          builder: (context, params) => TicketDetailWidget(
            ticketDetailParam: params.getParam<TicketsRow>(
              'ticketDetailParam',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: SensorMainPageWidget.routeName,
          path: SensorMainPageWidget.routePath,
          builder: (context, params) => SensorMainPageWidget(
            workOrderIdSensor: params.getParam(
              'workOrderIdSensor',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: WorkOrderWidget.routeName,
          path: WorkOrderWidget.routePath,
          builder: (context, params) => WorkOrderWidget(
            workOrderId: params.getParam(
              'workOrderId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DiagnosisPageWidget.routeName,
          path: DiagnosisPageWidget.routePath,
          builder: (context, params) => DiagnosisPageWidget(
            diagnosisParameterWorkId: params.getParam<DiagnosesRow>(
              'diagnosisParameterWorkId',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: WorkOrderTechniciansViewWidget.routeName,
          path: WorkOrderTechniciansViewWidget.routePath,
          builder: (context, params) => WorkOrderTechniciansViewWidget(
            workOrderRow: params.getParam<WorkOrdersRow>(
              'workOrderRow',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: WorkReviewWidget.routeName,
          path: WorkReviewWidget.routePath,
          builder: (context, params) => WorkReviewWidget(),
        ),
        FFRoute(
          name: PendingWidget.routeName,
          path: PendingWidget.routePath,
          builder: (context, params) => PendingWidget(),
        ),
        FFRoute(
          name: WorkOrderWorkFlowWidget.routeName,
          path: WorkOrderWorkFlowWidget.routePath,
          builder: (context, params) => WorkOrderWorkFlowWidget(),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: LoguinWidget.routeName,
          path: LoguinWidget.routePath,
          builder: (context, params) => LoguinWidget(),
        ),
        FFRoute(
          name: ResetPasswordWidget.routeName,
          path: ResetPasswordWidget.routePath,
          builder: (context, params) => ResetPasswordWidget(),
        ),
        FFRoute(
          name: SelectRolePageWidget.routeName,
          path: SelectRolePageWidget.routePath,
          builder: (context, params) => SelectRolePageWidget(
            userSelectRole: params.getParam<UsersRow>(
              'userSelectRole',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: WaitingOnApprovedWidget.routeName,
          path: WaitingOnApprovedWidget.routePath,
          builder: (context, params) => WaitingOnApprovedWidget(
            waitingOnApprov: params.getParam(
              'waitingOnApprov',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DashboardDispatchWidget.routeName,
          path: DashboardDispatchWidget.routePath,
          builder: (context, params) => DashboardDispatchWidget(),
        ),
        FFRoute(
          name: TodayListViewSchedulesWidget.routeName,
          path: TodayListViewSchedulesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TodayListViewSchedulesWidget(),
        ),
        FFRoute(
          name: DispatchTodayViewWidget.routeName,
          path: DispatchTodayViewWidget.routePath,
          builder: (context, params) => DispatchTodayViewWidget(),
        ),
        FFRoute(
          name: QrPageOfficeWidget.routeName,
          path: QrPageOfficeWidget.routePath,
          builder: (context, params) => QrPageOfficeWidget(),
        ),
        FFRoute(
          name: DeliveryPartsArrivedPageWidget.routeName,
          path: DeliveryPartsArrivedPageWidget.routePath,
          builder: (context, params) => DeliveryPartsArrivedPageWidget(),
        ),
        FFRoute(
          name: WorkOrderSearchWidget.routeName,
          path: WorkOrderSearchWidget.routePath,
          builder: (context, params) => WorkOrderSearchWidget(),
        ),
        FFRoute(
          name: TradutorWidget.routeName,
          path: TradutorWidget.routePath,
          builder: (context, params) => TradutorWidget(),
        ),
        FFRoute(
          name: AppointmentTodayViewWidget.routeName,
          path: AppointmentTodayViewWidget.routePath,
          builder: (context, params) => AppointmentTodayViewWidget(),
        ),
        FFRoute(
          name: MapsNotUserWidget.routeName,
          path: MapsNotUserWidget.routePath,
          builder: (context, params) => MapsNotUserWidget(),
        ),
        FFRoute(
          name: PagePartStockMobileWidget.routeName,
          path: PagePartStockMobileWidget.routePath,
          builder: (context, params) => PagePartStockMobileWidget(),
        ),
        FFRoute(
          name: ListAllJobsWidget.routeName,
          path: ListAllJobsWidget.routePath,
          builder: (context, params) => ListAllJobsWidget(),
        ),
        FFRoute(
          name: ChatBotSupportWidget.routeName,
          path: ChatBotSupportWidget.routePath,
          builder: (context, params) => ChatBotSupportWidget(),
        ),
        FFRoute(
          name: VoiceDiagnosisN8nWidget.routeName,
          path: VoiceDiagnosisN8nWidget.routePath,
          builder: (context, params) => VoiceDiagnosisN8nWidget(),
        ),
        FFRoute(
          name: PaymentsWidget.routeName,
          path: PaymentsWidget.routePath,
          builder: (context, params) => PaymentsWidget(),
        ),
        FFRoute(
          name: BillingWidget.routeName,
          path: BillingWidget.routePath,
          builder: (context, params) => BillingWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loguin';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryText,
                  child: Image.asset(
                    'assets/images/wmappliancescasa512x512.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

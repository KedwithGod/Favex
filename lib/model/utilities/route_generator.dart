import 'imports/shared.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  debugLogDiagnostics: false,
  initialLocation: '/',
  redirect: (context, state) async {
    final initialRoute = await determineInitialRoute();
    if (state.fullPath == '/' && initialRoute != '/') {
      return initialRoute;
    }
    return null;
  },
  routes: [
    GoRoute(
        name: loginPageRoute,
        path: '/',
        builder: (context, state) => const LoginPage()),
    GoRoute(
        name: lockScreenPageRoute,
        path: '/lock_screen',
        builder: (context, state) => const LockScreenPage()),
    GoRoute(
        name: dashboardPageRoute,
        path: '/dashboard',
        builder: (context, state) => const DashboardPage()),
    GoRoute(
        name: emailEntryPageRoute,
        path: '/email_entry',
        builder: (context, state) => const EmailEntryPage()),
    GoRoute(
        name: createAccountPageRoute,
        path: '/create_account',
        builder: (context, state) => const CreateAccountPage()),
    GoRoute(
        name: createNewPasswordPage,
        path: '/create_new_password',
        builder: (context, state) => const CreateNewPasswordPage()),
    GoRoute(
        name: emailVeificationPageRoute,
        path: '/email_verification',
        builder: (context, state) => const EmailVerificationPage()),
    GoRoute(
        name: enterOTPCodePageRoute,
        path: '/enter_otp_code',
        builder: (context, state) {
          final Map<String, dynamic>? args =
              state.extra as Map<String, dynamic>?;
          final String? nextPage = args?['nextPage'] as String?;
          final String bottomSheetSubtitle =
              args?['bottomSheetSubtitle'] as String;

          return EnterOTPCodePage(
              nextPage: nextPage, bottomSheetSubtitle: bottomSheetSubtitle);
        }),
    GoRoute(
        name: createPasswordPageRoute,
        path: '/create_password',
        builder: (context, state) => const CreatePasswordPage()),
  ],
);

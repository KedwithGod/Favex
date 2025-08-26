
import 'imports/generalImport.dart';

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
        builder: (context, state) => const LoginPage(
                         )),

  ],
);

import 'package:freelancehub/core/router/app_routes.dart';
import 'package:freelancehub/home_page.dart';
import 'package:go_router/go_router.dart';

GoRouter createAppRouter({String initialLocation = AppRoutePaths.home}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: AppRoutePaths.home,
        name: AppRouteNames.home,
        builder: (context, state) =>
            const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    ],
  );
}

import "package:auto_route/auto_route.dart";
import "package:sample_app/core/constants/app_routes.dart";

class AuthGuard extends AutoRouteGuard {

  AuthGuard({required this.isAuthenticated});
  final bool isAuthenticated;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isAuthenticated) {
      resolver.next();
    } else {
      router.navigate(
        const PageRouteInfo(AppRoutes.signin),
      );
    }
  }
}

import "package:auto_route/auto_route.dart";
import "package:sample_app/presentation/routes/app_router.gr.dart";
import "package:sample_app/presentation/routes/guard/auth_guard.dart";

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({required this.isAuthenticated});
  final bool isAuthenticated;

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
          guards: <AutoRouteGuard>[
            AuthGuard(
              isAuthenticated: isAuthenticated,
            ),
          ],
        ),
        AutoRoute(
          page: PinSetupRoute.page,
        ),
        AutoRoute(
          page: PinLoginRoute.page,
        ),
        AutoRoute(
          page: NavigationRoute.page,
        ),
        AutoRoute(
          page: LinkedinLogin.page,
        ),
        AutoRoute(
          page: ApiPostRoute.page,
        ),
        AutoRoute(
          page: ApiGetRoute.page,
        ),
        AutoRoute(
          page: Welcomepage.page,
        ),
        AutoRoute(
          page: Selectandregister.page,
        ),
        AutoRoute(
          page: MainTabView.page,
        ),
        AutoRoute(
          page: Analytic.page,
        ),
        AutoRoute(
          page: ScanRoute.page,
        ),
        AutoRoute(
          page: BookDetailsRoute.page,
        ),
        AutoRoute(
          page: Community.page,
        ),
        AutoRoute(
          page: SignInRoute.page,
        ),
        AutoRoute(
          page: SignUpRoute.page,
        ),
        AutoRoute(
          page: Profile.page,
        ),
        AutoRoute(
          page: AuthConsentRoute.page,
        ),
        AutoRoute(
          page: InnerCircle.page,
        ),
        AutoRoute(
          page: InviteRoute.page,
        ),
        AutoRoute(page: HomeRoute.page,
        )
      ];
}

import "package:connectivity_plus/connectivity_plus.dart";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:sample_app/core/constants/app_colors.dart";
import "package:sample_app/presentation/custom_widgets/custom_theme.dart";
import "package:sample_app/presentation/provider/signup_riverpod.dart";
import "package:sample_app/presentation/routes/app_router.dart";

List<ConnectivityResult>? connectionResult;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (FlutterErrorDetails errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  await dotenv.load();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

final AppRouter rootRouter = AppRouter(isAuthenticated: true);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Locale locale = ref.watch(signupProvider);

    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: rootRouter.config(),
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      // themeMode: ThemeMode.dark,
      // darkTheme: customThemeData(
      //   drawerIconColor: Colors.white,
      //   backButtonIconColor: Colors.white,
      //   actionsIconColor: Colors.pink,
      //   closeIconColor: Colors.white,
      //   appBarBackgroundColor: AppColors.secondaryColor,
      //   titleColor: Colors.white,
      //   fontSize: 16,
      // ),
      theme: customThemeData(
        drawerIconColor: AppColors.white,
        backButtonIconColor: AppColors.white,
        actionsIconColor: AppColors.white,
        closeIconColor: AppColors.white,
        appBarBackgroundColor: AppColors.primaryColor,
        titleColor: AppColors.white,
        fontSize: 16,
      ),
      // onGenerateRoute: RouteManager.generateRoutes,
      debugShowCheckedModeBanner: false,
      // home: const FilePickerScreen(),
    );
  }
}

//  late StreamSubscription subscription;

//   final _rootRouter = AppRouter(isAuthenticated: true);

//   @override
//   void initState() {
//     subscription = Connectivity().onConnectivityChanged.listen(
//       (event) {
//         connectionResult = event;
//       },
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }


// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:flutter/material.dart' as _i24;
import 'package:sample_app/presentation/views/analytic/analytic.dart' as _i1;
import 'package:sample_app/presentation/views/api_get/api_get_screen.dart'
    as _i2;
import 'package:sample_app/presentation/views/api_post/api_post.dart' as _i3;
import 'package:sample_app/presentation/views/book_details/book_details_page.dart'
    as _i5;
import 'package:sample_app/presentation/views/community/community.dart' as _i6;
import 'package:sample_app/presentation/views/home/home_screen.dart' as _i7;
import 'package:sample_app/presentation/views/login/auth_consent.dart' as _i4;
import 'package:sample_app/presentation/views/login/linkdin.dart' as _i10;
import 'package:sample_app/presentation/views/login/signin.dart' as _i19;
import 'package:sample_app/presentation/views/login/signup.dart' as _i20;
import 'package:sample_app/presentation/views/main_tab/main_tab_view.dart'
    as _i11;
import 'package:sample_app/presentation/views/navigation/navigation_screen.dart'
    as _i12;
import 'package:sample_app/presentation/views/no_internet_connection/no_internet_connection.dart'
    as _i13;
import 'package:sample_app/presentation/views/pin_code/pin_login.dart' as _i14;
import 'package:sample_app/presentation/views/pin_code/pin_setup.dart' as _i15;
import 'package:sample_app/presentation/views/profile/profile.dart' as _i16;
import 'package:sample_app/presentation/views/profile/widgets/inner_circle.dart'
    as _i8;
import 'package:sample_app/presentation/views/profile/widgets/innercirclecard.dart'
    as _i9;
import 'package:sample_app/presentation/views/register/selectandregister.dart'
    as _i18;
import 'package:sample_app/presentation/views/scan/scanpage.dart' as _i17;
import 'package:sample_app/presentation/views/splash/splash.dart' as _i21;
import 'package:sample_app/presentation/views/welcome/welcomepage.dart' as _i22;

/// generated route for
/// [_i1.Analytic]
class Analytic extends _i23.PageRouteInfo<void> {
  const Analytic({List<_i23.PageRouteInfo>? children})
      : super(
          Analytic.name,
          initialChildren: children,
        );

  static const String name = 'Analytic';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i1.Analytic();
    },
  );
}

/// generated route for
/// [_i2.ApiGetScreen]
class ApiGetRoute extends _i23.PageRouteInfo<void> {
  const ApiGetRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ApiGetRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApiGetRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i2.ApiGetScreen();
    },
  );
}

/// generated route for
/// [_i3.ApiPostScreen]
class ApiPostRoute extends _i23.PageRouteInfo<void> {
  const ApiPostRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ApiPostRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApiPostRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i3.ApiPostScreen();
    },
  );
}

/// generated route for
/// [_i4.AuthConsentScreen]
class AuthConsentRoute extends _i23.PageRouteInfo<void> {
  const AuthConsentRoute({List<_i23.PageRouteInfo>? children})
      : super(
          AuthConsentRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthConsentRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i4.AuthConsentScreen();
    },
  );
}

/// generated route for
/// [_i5.BookDetailsPage]
class BookDetailsRoute extends _i23.PageRouteInfo<BookDetailsRouteArgs> {
  BookDetailsRoute({
    _i24.Key? key,
    required Map<String, dynamic> bookDetails,
    required String isbnNumber,
    bool showHeroImage = false,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          BookDetailsRoute.name,
          args: BookDetailsRouteArgs(
            key: key,
            bookDetails: bookDetails,
            isbnNumber: isbnNumber,
            showHeroImage: showHeroImage,
          ),
          initialChildren: children,
        );

  static const String name = 'BookDetailsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookDetailsRouteArgs>();
      return _i5.BookDetailsPage(
        key: args.key,
        bookDetails: args.bookDetails,
        isbnNumber: args.isbnNumber,
        showHeroImage: args.showHeroImage,
      );
    },
  );
}

class BookDetailsRouteArgs {
  const BookDetailsRouteArgs({
    this.key,
    required this.bookDetails,
    required this.isbnNumber,
    this.showHeroImage = false,
  });

  final _i24.Key? key;

  final Map<String, dynamic> bookDetails;

  final String isbnNumber;

  final bool showHeroImage;

  @override
  String toString() {
    return 'BookDetailsRouteArgs{key: $key, bookDetails: $bookDetails, isbnNumber: $isbnNumber, showHeroImage: $showHeroImage}';
  }
}

/// generated route for
/// [_i6.Community]
class Community extends _i23.PageRouteInfo<void> {
  const Community({List<_i23.PageRouteInfo>? children})
      : super(
          Community.name,
          initialChildren: children,
        );

  static const String name = 'Community';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i6.Community();
    },
  );
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i23.PageRouteInfo<void> {
  const HomeRoute({List<_i23.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomeScreen();
    },
  );
}

/// generated route for
/// [_i8.InnerCircle]
class InnerCircle extends _i23.PageRouteInfo<void> {
  const InnerCircle({List<_i23.PageRouteInfo>? children})
      : super(
          InnerCircle.name,
          initialChildren: children,
        );

  static const String name = 'InnerCircle';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i8.InnerCircle();
    },
  );
}

/// generated route for
/// [_i9.InviteScreen]
class InviteRoute extends _i23.PageRouteInfo<void> {
  const InviteRoute({List<_i23.PageRouteInfo>? children})
      : super(
          InviteRoute.name,
          initialChildren: children,
        );

  static const String name = 'InviteRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i9.InviteScreen();
    },
  );
}

/// generated route for
/// [_i10.LinkedinLogin]
class LinkedinLogin extends _i23.PageRouteInfo<LinkedinLoginArgs> {
  LinkedinLogin({
    _i24.Key? key,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          LinkedinLogin.name,
          args: LinkedinLoginArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LinkedinLogin';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LinkedinLoginArgs>(
          orElse: () => const LinkedinLoginArgs());
      return _i10.LinkedinLogin(key: args.key);
    },
  );
}

class LinkedinLoginArgs {
  const LinkedinLoginArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'LinkedinLoginArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.MainTabView]
class MainTabView extends _i23.PageRouteInfo<void> {
  const MainTabView({List<_i23.PageRouteInfo>? children})
      : super(
          MainTabView.name,
          initialChildren: children,
        );

  static const String name = 'MainTabView';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i11.MainTabView();
    },
  );
}

/// generated route for
/// [_i12.NavigationScreen]
class NavigationRoute extends _i23.PageRouteInfo<void> {
  const NavigationRoute({List<_i23.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i12.NavigationScreen();
    },
  );
}

/// generated route for
/// [_i13.NoInternetConnection]
class NoInternetConnection extends _i23.PageRouteInfo<void> {
  const NoInternetConnection({List<_i23.PageRouteInfo>? children})
      : super(
          NoInternetConnection.name,
          initialChildren: children,
        );

  static const String name = 'NoInternetConnection';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i13.NoInternetConnection();
    },
  );
}

/// generated route for
/// [_i14.PinLoginScreen]
class PinLoginRoute extends _i23.PageRouteInfo<void> {
  const PinLoginRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PinLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinLoginRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i14.PinLoginScreen();
    },
  );
}

/// generated route for
/// [_i15.PinSetupScreen]
class PinSetupRoute extends _i23.PageRouteInfo<void> {
  const PinSetupRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PinSetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinSetupRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i15.PinSetupScreen();
    },
  );
}

/// generated route for
/// [_i16.Profile]
class Profile extends _i23.PageRouteInfo<void> {
  const Profile({List<_i23.PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i16.Profile();
    },
  );
}

/// generated route for
/// [_i17.ScanPage]
class ScanRoute extends _i23.PageRouteInfo<void> {
  const ScanRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i17.ScanPage();
    },
  );
}

/// generated route for
/// [_i18.Selectandregister]
class Selectandregister extends _i23.PageRouteInfo<void> {
  const Selectandregister({List<_i23.PageRouteInfo>? children})
      : super(
          Selectandregister.name,
          initialChildren: children,
        );

  static const String name = 'Selectandregister';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i18.Selectandregister();
    },
  );
}

/// generated route for
/// [_i19.SignInScreen]
class SignInRoute extends _i23.PageRouteInfo<void> {
  const SignInRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i19.SignInScreen();
    },
  );
}

/// generated route for
/// [_i20.SignUpScreen]
class SignUpRoute extends _i23.PageRouteInfo<void> {
  const SignUpRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i20.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i21.SplashScreen]
class SplashRoute extends _i23.PageRouteInfo<void> {
  const SplashRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i21.SplashScreen();
    },
  );
}

/// generated route for
/// [_i22.Welcomepage]
class Welcomepage extends _i23.PageRouteInfo<void> {
  const Welcomepage({List<_i23.PageRouteInfo>? children})
      : super(
          Welcomepage.name,
          initialChildren: children,
        );

  static const String name = 'Welcomepage';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i22.Welcomepage();
    },
  );
}

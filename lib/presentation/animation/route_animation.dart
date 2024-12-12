import "package:flutter/material.dart";

class AnimationManager {
   PageRouteBuilder slideTransition(Widget page) => PageRouteBuilder(
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) =>
            page,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          const Offset begin = Offset(1, 0); // Slide in from the right
          const Offset end = Offset.zero;
          const Cubic curve = Curves.ease;

          final Animatable<Offset> tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final Animation<Offset> offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      );

  
   PageRouteBuilder fadeTransition(Widget page) => PageRouteBuilder(
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) =>
            page,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) =>
            FadeTransition(opacity: animation, child: child),
      );

  static PageRouteBuilder scaleTransition(Widget page) => PageRouteBuilder(
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) =>
            page,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          final Animation<double> scaleAnimation =
              Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
          );
          return ScaleTransition(scale: scaleAnimation, child: child);
        },
      );
}

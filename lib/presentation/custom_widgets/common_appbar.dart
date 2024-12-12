import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/core/constants/app_routes.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  const CommonAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: leading ?? const Icon(Icons.menu),
      actions: actions ??
          [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.all(5.0),
                width: 25,
                height: 25,
                child: Image.asset(
                  'assets/images/user.png',
                  fit: BoxFit.fill,
                  // color: Colors.yellow.shade600,
                ),
              ),
              onTap: () {
                context.pushRoute(
                  PageRouteInfo(
                    AppRoutes.profile,
                  ),
                );
              },
            ),
          ],
      title: Text(
        title,
        style: const TextStyle(fontFamily: "Playfair Display"),
      ),
    );
  }
}

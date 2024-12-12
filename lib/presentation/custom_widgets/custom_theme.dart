import "package:flutter/material.dart";

ThemeData customThemeData(
    {required Color drawerIconColor,
    required Color backButtonIconColor,
    required Color actionsIconColor,
    required Color closeIconColor,
    required Color appBarBackgroundColor,
    required Color titleColor,
    required double fontSize,}) => ThemeData(
    actionIconTheme: ActionIconThemeData(
      drawerButtonIconBuilder: (context) => Icon(
        Icons.menu,
        color: drawerIconColor,
      ),
      backButtonIconBuilder: (context) => Icon(
        Icons.arrow_back,
        color: backButtonIconColor,
      ),
      closeButtonIconBuilder: (context) => Icon(
        Icons.close,
        color: closeIconColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: appBarBackgroundColor,
      centerTitle: true,
      titleTextStyle: TextStyle(color: titleColor, fontSize: fontSize),
      actionsIconTheme: IconThemeData(
        color: actionsIconColor,
      ),
    ),
  );

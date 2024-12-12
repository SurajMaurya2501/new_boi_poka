  import "package:flutter/material.dart";
import "package:sample_app/core/constants/app_colors.dart";

Widget circularIcon(IconData icon, Function()? onTap) => GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(right: 5.0, left: 5.0),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primaryColor,
            ),
          ),
          child: Icon(icon)),
    );
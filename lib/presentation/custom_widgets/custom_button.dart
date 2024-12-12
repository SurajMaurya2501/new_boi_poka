import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample_app/core/constants/app_colors.dart';
import 'package:sample_app/core/constants/app_typography.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.buttonTitle,
    this.variant = 'default',
    this.iconName,
    this.isIconAtStart = true,
    this.iconPath,
  });

  final VoidCallback? onPressed;
  final String? buttonTitle;
  final String variant;
  final IconData? iconName;
  final bool isIconAtStart;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    // return TextButton(
    //   onPressed: onPressed,
    //   child: Text(buttonTitle, style: AppTypography.typo12PrimarySemibold),
    // );
    switch (variant) {
      case 'default':
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
          ),
          child: iconName != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isIconAtStart) ...[
                      Icon(iconName),
                      const SizedBox(width: 8),
                    ],
                    Text(buttonTitle!, style: AppTypography.typo14WhiteBold),
                    if (!isIconAtStart) ...[
                      const SizedBox(width: 8),
                      Icon(iconName)
                    ]
                  ],
                )
              : Text(buttonTitle!, style: AppTypography.typo14WhiteBold),
        );
      case 'text':
        return TextButton(
          onPressed: onPressed,
          child: Text(buttonTitle!, style: AppTypography.typo12PrimarySemibold),
        );
      case 'icon':
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: iconPath != null
                ? SvgPicture.asset(
                    iconPath!,
                    width: 24.0,
                    height: 24.0,
                  )
                : Icon(iconName),
            color: AppColors.secondaryColor,
            iconSize: 24.0,
          ),
        );
      case 'inverse':
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.secondaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
          ),
          child: iconName != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isIconAtStart) ...[
                      Icon(iconName),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      buttonTitle!,
                      style: AppTypography.typo14SecondaryBold,
                    ),
                    if (!isIconAtStart) ...[
                      const SizedBox(width: 8),
                      Icon(iconName),
                    ],
                  ],
                )
              : Text(buttonTitle!, style: AppTypography.typo14SecondaryBold),
        );
      default:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
          ),
          child: iconName != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isIconAtStart) ...[
                      Icon(iconName),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      buttonTitle!,
                      style: AppTypography.typo14WhiteBold,
                    ),
                    if (!isIconAtStart) ...[
                      const SizedBox(width: 8),
                      Icon(iconName)
                    ],
                  ],
                )
              : Text(buttonTitle!, style: AppTypography.typo14WhiteBold),
        );
    }
  }
}

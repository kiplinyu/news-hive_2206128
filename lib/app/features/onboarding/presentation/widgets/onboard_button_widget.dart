import 'package:flutter/material.dart';
import 'package:news_hive/shared/theme/app_colors.dart';

enum OnBoardButtonType { primary, secondary }

class OnboardButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final OnBoardButtonType variant;

  const OnboardButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        variant == OnBoardButtonType.primary
            ? AppColors.primary
            : AppColors.secondary;
    final foregroundColor =
        variant == OnBoardButtonType.primary
            ? AppColors.textLight
            : AppColors.textDark;

    return Expanded(
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

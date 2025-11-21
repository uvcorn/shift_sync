import 'package:flutter/material.dart';

import '../../utils/app_colors/app_colors.dart';
import '../texts_widgets/custom_text.dart';

/// A reusable Flutter-only toast widget (no native plugin required).
/// Works on Android, iOS, Web, and Desktop.
class AppToast {
  /// Shows a custom toast message.
  static void show(
    BuildContext context,

    String message, {
    Color backgroundColor = AppColors.black,
    Color textColor = Colors.white,
    double fontSize = 14,
    Duration duration = const Duration(seconds: 2),
    double bottomMargin = 80,
    double horizontalPadding = 16,
    double verticalPadding = 12,
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(8),
    ),
    bool isSuccess = true,
    bool isIcon = true,
  }) {
    final overlay = Overlay.of(context);

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: bottomMargin,
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          tween: Tween(begin: 0, end: 1),
          builder: (context, opacity, child) =>
              Opacity(opacity: opacity, child: child),
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isIcon)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        isSuccess ? Icons.check : Icons.error,
                        color: textColor,
                      ),
                    ),
                  Flexible(
                    child: CustomText(
                      text: message,
                      textAlign: TextAlign.center,
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors/app_colors.dart';
import '../texts_widgets/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final bool isLoading;

  final IconData? iconData;
  final Color iconColor;
  final double iconSize;
  final double iconSpacing;
  final Color borderColor;

  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width = 335,
    this.height = 46,
    this.borderRadius,
    this.backgroundColor = AppColors.primary,
    this.padding,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.textColor = AppColors.white,
    this.isLoading = false,
    // 🆕 Defaults for icon
    this.iconData,
    this.iconColor = AppColors.white,
    this.iconSize = 20,
    this.iconSpacing = 8,
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(10.r);
    final padding = this.padding ?? EdgeInsets.symmetric(horizontal: 16.w);

    return Material(
      color: backgroundColor,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius as BorderRadius,
        splashColor: Colors.white.withOpacity(0.2),
        highlightColor: Colors.white.withOpacity(0.1),
        child: Container(
          width: width.w,
          height: height.h,
          padding: padding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: borderColor, width: 0.8),
          ),
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: title,
                      fontSize: fontSize.sp,
                      fontWeight: fontWeight,
                      color: textColor,
                    ),
                    if (iconData != null) ...[
                      SizedBox(width: iconSpacing.w),
                      Icon(iconData, color: iconColor, size: iconSize.sp),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}

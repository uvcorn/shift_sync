import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shift_sync/core/utils/app_colors/app_colors.dart';

class CSearchBar extends StatelessWidget {
  const CSearchBar({
    super.key,
    required this.hintText,
    this.hasBackground = false,
    this.background = AppColors.lightGrey,
    this.fillcolor = AppColors.white,
    this.height = 50,
  });

  final String hintText;
  final Color background;
  final bool hasBackground;
  final Color fillcolor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.mediumGrey),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: textTheme.bodySmall?.copyWith(
            color: AppColors.mediumGrey,
            fontSize: 12.sp,
          ),
          prefixIcon: Icon(Icons.search, color: AppColors.black, size: 22.r),
          filled: true,
          fillColor: fillcolor,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r), // Rounded corners
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../utils/app_colors/app_colors.dart';
import '../texts_widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  final bool isBack;
  final String title;
  const CustomAppBar({super.key, required this.title, this.isBack = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isBack == true)
          GestureDetector(
            onTap: () => context.pop(),
            child: Icon(Icons.arrow_back_ios, color: AppColors.black),
          ),
        SizedBox(width: 20.w),
        CustomText(text: title, fontSize: 20.sp, fontWeight: FontWeight.w500),
      ],
    );
  }
}

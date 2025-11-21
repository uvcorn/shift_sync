import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shift_sync/core/utils/app_colors/app_colors.dart';
import 'package:shift_sync/core/utils/app_strings/app_strings.dart';
import 'package:shift_sync/core/widgets/texts_widgets/custom_text.dart';
import '../view_model/shift_overview_view_model.dart';

class ShiftsOverviewScreen extends ConsumerStatefulWidget {
  const ShiftsOverviewScreen({super.key});

  static const String routeName = '/shiftsOverviewScreen';

  @override
  ConsumerState<ShiftsOverviewScreen> createState() =>
      _ShiftsOverviewScreenState();
}

class _ShiftsOverviewScreenState extends ConsumerState<ShiftsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(shiftOverviewProvider);

    return Scaffold(
      backgroundColor: AppColors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            children: [
              // CustomAppBar(title: AppStrings.shiftsOverview, isBack: false,),
              Row(
                children: [
                  Spacer(),
                  CustomText(
                    text: AppStrings.shiftsOverview,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.separated(
                  itemCount: state.shifts.length,
                  separatorBuilder: (_, __) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) {
                    final shift = state.shifts[index];
                    return Container(
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        color: AppColors.blue.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: shift.name,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blue,
                          ),
                          CustomText(
                            text: shift.date,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blue.withOpacity(0.8),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

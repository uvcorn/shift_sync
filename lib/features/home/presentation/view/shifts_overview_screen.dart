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
              /// Header
              Row(
                children: [
                  const Spacer(),
                  CustomText(
                    text: AppStrings.shiftsOverview,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(height: 20.h),

              /// Section title
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: AppStrings.upcomingShifts,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black.withOpacity(0.85),
                ),
              ),
              SizedBox(height: 12.h),

              /// List
              Expanded(
                child: ListView.separated(
                  itemCount: state.shifts.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final shift = state.shifts[index];
                    return Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(
                          color: AppColors.blue.withOpacity(0.18),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.08),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          /// Icon container
                          Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: AppColors.blue.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(
                              Icons.work_rounded,
                              color: AppColors.black,
                              size: 22.sp,
                            ),
                          ),

                          SizedBox(width: 14.w),

                          /// Shift details
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: shift.name,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                              SizedBox(height: 4.h),

                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_rounded,
                                    size: 14.sp,
                                    color: AppColors.black.withOpacity(0.7),
                                  ),
                                  SizedBox(width: 6.w),
                                  CustomText(
                                    text: shift.date,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black.withOpacity(0.75),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Spacer(),

                          Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.black,
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

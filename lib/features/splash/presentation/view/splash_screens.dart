import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_strings/app_strings.dart';
import '../../../../../core/widgets/texts_widgets/custom_text.dart';
import '../view_model/splash_screen_view_model.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(splashScreenViewModelProvider);
    viewModel.navigateToNextScreen(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: AppStrings.appTitle,
              fontFamily: AppStrings.quantico,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/app_router.dart';

final splashScreenViewModelProvider = Provider<SplashScreenViewModel>((ref) {
  return SplashScreenViewModel();
});

class SplashScreenViewModel {
  // Method to trigger navigation after a delay
  Future<void> navigateToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      context.goNamed(AppRouter.loginScreen);
    }
  }
}

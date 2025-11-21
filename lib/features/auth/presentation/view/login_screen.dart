import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shift_sync/core/routes/app_router.dart';
import 'package:shift_sync/core/utils/validators/form_validators.dart';
import 'package:shift_sync/core/widgets/button_widgets/custom_elevated_button.dart';
import 'package:shift_sync/features/auth/presentation/view_model/login_view_model.dart';
import '../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../core/utils/app_strings/app_strings.dart';
import '../../../../../../core/widgets/texts_widgets/custom_checkbox.dart';
import '../../../../../../core/widgets/texts_widgets/custom_text.dart';
import '../../../../../../core/widgets/texts_widgets/custom_text_form_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login-screen';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    final state = ref.read(loginViewModelProvider);
    _emailController = TextEditingController(text: state.email);
    _passwordController = TextEditingController(text: state.password);
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);
    final vm = ref.read(loginViewModelProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),

                  SizedBox(height: 30.h),
                  Center(
                    child: CustomText(
                      text: AppStrings.welcomeBackSignIn,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: CustomText(
                      text: AppStrings.welcomeBackExplanation,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 50.h),

                  /// Email
                  CustomText(text: AppStrings.email, fontSize: 14.sp),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hintText: AppStrings.email,
                    controller: _emailController,
                    icon: Icons.email_outlined,
                    onChanged: vm.updateEmail,
                    validator: FormValidators.validateEmail,
                  ),
                  SizedBox(height: 20.h),

                  /// Password
                  CustomText(text: AppStrings.password, fontSize: 14.sp),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    hintText: AppStrings.password,
                    controller: _passwordController,
                    icon: Icons.lock_outline,
                    isPassword: true,
                    validator: FormValidators.validatePassword,
                    obscureText: state.isObscure,
                    togglePassword: vm.togglePasswordVisibility,
                    onChanged: vm.updatePassword,
                  ),

                  SizedBox(height: 10.h),

                  CustomCheckbox(
                    useSpaceBetweenAlignment: true,
                    showCheckbox: true,
                    leadingText: AppStrings.rememberMe,
                    value: state.rememberMe,
                    onChanged: vm.toggleRememberMe,
                    leadingTextStyle: TextStyle(color: AppColors.black),
                    clickableText: AppStrings.forgotPassword,
                    clickableTextStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                      // decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
                      decorationThickness: 2,
                    ),
                    onLinkTap: () {
                      // context.pushNamed(AppRouter.forgotPasswordScreen);
                    },
                  ),
                  SizedBox(height: 24.h),

                  /// Sign In Button
                  Center(
                    child: CustomElevatedButton(
                      title: AppStrings.signIn,
                      isLoading: state.isLoading,
                      onPressed: () {
                        // if (!_formKey.currentState!.validate()) return;
                        vm.loginUser(state.email, state.password);
                        context.pushNamed(AppRouter.shiftsOverviewScreen);
                      },
                    ),
                  ),

                  SizedBox(height: 24.h),

                  /// Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CustomCheckbox(
                          useSpaceBetweenAlignment: false,
                          showCheckbox: false,
                          leadingText: AppStrings.youDontHaveAnAccount,
                          leadingTextStyle: TextStyle(color: AppColors.black),
                          clickableText: AppStrings.signUp,
                          clickableTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: AppColors.primary,
                          ),
                          onLinkTap: () {
                            // context.pushNamed(AppRouter.selectAccount);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

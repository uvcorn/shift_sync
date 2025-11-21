import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../../core/utils/validators/form_validators.dart';

class LoginState {
  final String email;
  final String password;
  final bool isObscure;
  final bool isLoading;
  final bool rememberMe;
  final String? errorMessage;
  final bool isSuccess;

  LoginState({
    this.email = '',
    this.password = '',
    this.isObscure = true,
    this.isLoading = false,
    this.rememberMe = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isObscure,
    bool? isLoading,
    bool? rememberMe,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isObscure: isObscure ?? this.isObscure,
      isLoading: isLoading ?? this.isLoading,
      rememberMe: rememberMe ?? this.rememberMe,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

class LoginViewModel extends StateNotifier<LoginState> {
  // final AuthRepository _authRepository;
  LoginViewModel() : super(LoginState());
  // Validation methods
  String? validateEmail(String? value) => FormValidators.validateEmail(value);

  String? validatePassword(String? value) =>
      FormValidators.validatePassword(value);

  void togglePasswordVisibility() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  void toggleRememberMe(bool value) {
    state = state.copyWith(rememberMe: value);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  // For now, keep BuildContext
  // When you add Repository, change to:
  Future<void> loginUser(String email, String password) async {
    state = state.copyWith(isLoading: true);
    try {
      // await _authRepository.login(state.email, state.password);
      debugPrint('Email: $email, Password: $password');
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
  // Future<void> loginUser(String email, String password) async {
  //   state = state.copyWith(
  //     isLoading: true,
  //     errorMessage: null,
  //     isSuccess: false,
  //   );

  //   try {
  //     // Call repository instead of making API call directly
  //     final user = await _authRepository.login(email, password);

  //     // Handle remember me
  //     if (state.rememberMe) {
  //       // Save credentials logic (could be another repository method)
  //     }

  //     state = state.copyWith(
  //       isLoading: false,
  //       isSuccess: true,
  //     );
  //   } catch (e) {
  //     state = state.copyWith(
  //       isLoading: false,
  //       errorMessage: e.toString(),
  //       isSuccess: false,
  //     );
  //   }
  // }
  // void clearError() {
  //   state = state.copyWith(errorMessage: null);
  // }
}

final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>((ref) {
      return LoginViewModel();
    });
// final loginViewModelProvider =
//     StateNotifierProvider.autoDispose<LoginViewModel, LoginState>((ref) {
//       final authRepository = ref.watch(authRepositoryProvider);
//       return LoginViewModel(authRepository);
//     });

import 'package:get/get.dart';
import '../../features/splash/bindings/splash_binding.dart';
import '../../features/splash/views/splash_view.dart';
import '../../features/onboarding/bindings/onboarding_binding.dart';
import '../../features/onboarding/views/onboarding_view.dart';
import '../../features/auth/login/bindings/login_binding.dart';
import '../../features/auth/login/views/login_view.dart';
import '../../features/auth/signup/bindings/signup_binding.dart';
import '../../features/auth/signup/views/signup_view.dart';
import '../../features/auth/phone_entry/bindings/phone_entry_binding.dart';
import '../../features/auth/phone_entry/views/phone_entry_view.dart';
import '../../features/auth/otp_verification/bindings/otp_verification_binding.dart';
import '../../features/auth/otp_verification/views/otp_verification_view.dart';
import '../../features/auth/success/bindings/success_binding.dart';
import '../../features/auth/success/views/success_view.dart';
import '../../features/dashboard/bindings/dashboard_binding.dart';
import '../../features/dashboard/views/dashboard_view.dart';

// Import for currently active references that might not be moved yet
import '../../features/auth/bindings/auth_binding.dart';
import '../../features/auth/views/forgot_password_view.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String onboarding = "/onboarding";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String forgotPassword = "/forgotPassword";
  static const String verification = "/verification"; // Phone Entry
  static const String otpVerification = "/otpVerification";
  static const String success = "/success";
  static const String dashboard = "/dashboard";

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: signup,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: forgotPassword,
      // Temporarily use old view until updated if needed
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: verification,
      page: () => const PhoneEntryView(),
      binding: PhoneEntryBinding(),
    ),
    GetPage(
      name: otpVerification,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: success,
      page: () => const SuccessView(),
      binding: SuccessBinding(),
    ),
    GetPage(
      name: dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}

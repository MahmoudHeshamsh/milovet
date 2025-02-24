import 'package:flutter/material.dart';
import 'package:milovet/auth/view/screens/EmailVerificationScreen.dart';
import 'package:milovet/auth/view/screens/ForgotPasswordScreen.dart';
import 'package:milovet/auth/view/screens/ResetPasswordConfirmationScreen.dart';
import 'package:milovet/auth/view/screens/ResetPasswordScreen.dart';
import 'package:milovet/auth/view/screens/SignUpConfirmationScreen.dart';
import 'package:milovet/auth/view/screens/login_screen.dart';
import 'package:milovet/auth/view/screens/signUp_screen.dart';
import 'package:milovet/chat_tab/view/widgets/MilovetApp_chatList.dart';
import 'package:milovet/chat_tab/view/widgets/chat_tab.dart';
import 'package:milovet/get_started/view/screens/get_started.dart';
import 'package:milovet/profile_tab/view/screens/edit_profile_screen.dart';
import 'package:milovet/shared/home_screen/home_screen.dart';
import 'package:milovet/shared/routes/routes.dart';
import 'package:milovet/get_started/view/screens/onboarding_screen_one.dart';
import 'package:milovet/get_started/view/screens/onboarding_screen_two.dart';
import 'package:milovet/shared/widgets/doctor_or_user.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingOne:
        return MaterialPageRoute(builder: (_) => const OnboardingScreenOne());
      case Routes.onboardingTwo:
        return MaterialPageRoute(builder: (_) => const OnboardingScreenTwo());
      case Routes.getStarted:
        return MaterialPageRoute(builder: (_) => const GetStarted());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.doctorOrUSer:
        return MaterialPageRoute(
            builder: (_) => DoctorOrUser(), settings: settings);
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(), settings: settings);
      case Routes.signUpConfirmation:
        return MaterialPageRoute(
            builder: (_) => const SignUpConfirmationScreen());
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.emailVerification:
        return MaterialPageRoute(
            builder: (_) => const EmailVerificationScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.resetPasswordConfirmation:
        return MaterialPageRoute(
            builder: (_) => const ResetPasswordConfirmationScreen());
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case Routes.chatTab:
        return MaterialPageRoute(builder: (_) => const ChatTab());
      case Routes.chatList:
        return MaterialPageRoute(builder: (_) => const ChatList());
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}

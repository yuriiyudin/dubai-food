// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:go_router/go_router.dart';
import 'package:test_dubai/features/auth/presentation/view/check_otp_screen.dart';
import 'package:test_dubai/features/auth/presentation/view/sign_in_screen.dart';

final router = GoRouter(
  initialLocation: AppRoutes.signIn.path,
  routes: [
    GoRoute(
      path: AppRoutes.signIn.path,
      name: AppRoutes.signIn.name,
      builder: (context, state) => SignInScreen(),
      routes: [
        GoRoute(
          path: AppRoutes.checkOtp.path,
          name: AppRoutes.checkOtp.name,
          builder: (context, state) {
            final contact = state.extra as String;
            return CheckOtpScreen(contact: contact);
          },
        ),
      ],
    ),
  ],
);

class AppRoute {
  final String path;
  final String name;
  AppRoute({required this.path, required this.name});
}

class AppRoutes {
  static final signIn = AppRoute(path: '/sign-in', name: 'sign-in');
  static final checkOtp = AppRoute(path: '/check-otp', name: 'check-otp');
}

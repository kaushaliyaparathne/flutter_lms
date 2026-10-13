
import 'package:flutter/material.dart';

import '../features/auth/screens/login_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/student/screens/student_dashboard.dart';
import '../features/instructor/screens/instructor_dashboard.dart';
import '../features/admin/screens/admin_dashboard.dart';
import '../features/splash/screens/splash_screen.dart';
class AppRoutes {
  static const login = '/login';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const student = '/student';
  static const instructor = '/instructor';
  static const admin = '/admin';
  static const splash = '/splash';

  static Map<String, WidgetBuilder> get routes => {
    splash: (_) => const SplashScreen(),
        login: (_) => const LoginScreen(),
        onboarding: (_) => const OnboardingScreen(),
        home: (_) => const HomeScreen(),
        student: (_) => const StudentDashboard(),
        instructor: (_) => const InstructorDashboard(),
        admin: (_) => const AdminDashboard(),
      };
}

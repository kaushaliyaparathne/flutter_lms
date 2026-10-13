import 'package:flutter/material.dart';
import '../../../core/widgets/dashboard_shell.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardShell(
      title: 'Student Dashboard',
      greeting: 'Hello, Student',
      summary: [
        DashboardItem(Icons.menu_book, 'Enrolled', '4'),
        DashboardItem(Icons.check_circle_outline, 'Completed', '1'),
        DashboardItem(Icons.assignment_outlined, 'Assignments', '2'),
        DashboardItem(Icons.notifications_none, 'Notifications', '3'),
      ],
      sectionTitle: 'Continue Learning',
      shortcuts: ['Flutter Basics', 'Dart Fundamentals', 'UI Design'],
    );
  }
}
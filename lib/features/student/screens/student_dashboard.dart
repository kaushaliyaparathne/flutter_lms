import 'package:flutter/material.dart';
import '../../../core/widgets/dashboard_shell.dart';
import '../../../core/widgets/summary_grid.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardShell(
      title: 'Student',
      greeting: 'Hello, Student 👋',
      subtitle: 'Ready to continue learning?',
      headerIcon: Icons.school,
      summary: [
        SummaryGridItem(Icons.menu_book, 'Enrolled', '4', Colors.indigo),
        SummaryGridItem(
            Icons.check_circle_outline, 'Completed', '1', Colors.green),
        SummaryGridItem(
            Icons.assignment_outlined, 'Assignments', '2', Colors.orange),
        SummaryGridItem(
            Icons.notifications_none, 'Notifications', '3', Colors.pink),
      ],
      sectionTitle: 'Continue Learning',
      shortcuts: ['Flutter Basics', 'Dart Fundamentals', 'UI Design'],
      recentActivity: [
        'Completed lesson: Widgets Intro',
        'Submitted assignment: Layout Task',
        'Enrolled in UI Design',
      ],
      destinations: [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
        NavigationDestination(
            icon: Icon(Icons.menu_book_outlined), label: 'Courses'),
        NavigationDestination(
            icon: Icon(Icons.assignment_outlined), label: 'Assignments'),
        NavigationDestination(
            icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}
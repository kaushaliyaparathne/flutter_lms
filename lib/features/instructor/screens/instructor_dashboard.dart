import 'package:flutter/material.dart';
import '../../../core/widgets/dashboard_shell.dart';
import '../../../core/widgets/summary_grid.dart';

class InstructorDashboard extends StatelessWidget {
  const InstructorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardShell(
      title: 'Instructor',
      greeting: 'Hello, Instructor 👋',
      subtitle: 'Manage your courses and learners',
      headerIcon: Icons.cast_for_education,
      summary: [
        SummaryGridItem(
            Icons.library_books_outlined, 'Courses', '5', Colors.indigo),
        SummaryGridItem(Icons.people_outline, 'Students', '120', Colors.teal),
        SummaryGridItem(
            Icons.rate_review_outlined, 'To Grade', '8', Colors.orange),
        SummaryGridItem(Icons.quiz_outlined, 'Quizzes', '6', Colors.purple),
      ],
      sectionTitle: 'Management Shortcuts',
      shortcuts: ['Create Course', 'Review Submissions', 'View Enrollments'],
      recentActivity: [
        'New submission in Flutter Basics',
        'Quiz attempt completed in Dart Fundamentals',
        'New enrollment in UI Design',
      ],
      destinations: [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
        NavigationDestination(
            icon: Icon(Icons.library_books_outlined), label: 'Courses'),
        NavigationDestination(
            icon: Icon(Icons.people_outline), label: 'Learners'),
        NavigationDestination(
            icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}
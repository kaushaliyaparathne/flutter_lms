import 'package:flutter/material.dart';
import '../../../core/widgets/dashboard_shell.dart';

class InstructorDashboard extends StatelessWidget {
  const InstructorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardShell(
      title: 'Instructor Dashboard',
      greeting: 'Hello, Instructor',
      summary: [
        DashboardItem(Icons.library_books_outlined, 'Courses', '5'),
        DashboardItem(Icons.people_outline, 'Students', '120'),
        DashboardItem(Icons.rate_review_outlined, 'To Grade', '8'),
        DashboardItem(Icons.quiz_outlined, 'Quizzes', '6'),
      ],
      sectionTitle: 'Management Shortcuts',
      shortcuts: ['Create Course', 'Review Submissions', 'View Enrollments'],
    );
  }
}
import 'package:flutter/material.dart';
import '../../../core/widgets/dashboard_shell.dart';
import '../../../core/widgets/summary_grid.dart';

class InstructorDashboard extends StatelessWidget {
  const InstructorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardShell(
      title: 'Instructor Dashboard',
      greeting: 'Hello, Instructor',
      summary: [
        SummaryGridItem(Icons.library_books_outlined, 'Courses', '5'),
        SummaryGridItem(Icons.people_outline, 'Students', '120'),
        SummaryGridItem(Icons.rate_review_outlined, 'To Grade', '8'),
        SummaryGridItem(Icons.quiz_outlined, 'Quizzes', '6'),
      ],
      sectionTitle: 'Management Shortcuts',
      shortcuts: ['Create Course', 'Review Submissions', 'View Enrollments'],
      recentActivity: [
        'New submission in Flutter Basics',
        'Quiz attempt completed in Dart Fundamentals',
        'New enrollment in UI Design',
      ],
    );
  }
}
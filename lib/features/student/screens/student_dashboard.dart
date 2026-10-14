import 'package:flutter/material.dart';
import '../../../core/widgets/dashboard_shell.dart';
import '../../../core/widgets/summary_grid.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardShell(
      title: 'Student Dashboard',
      greeting: 'Hello, Student',
      summary: [
        SummaryGridItem(Icons.menu_book, 'Enrolled', '4'),
        SummaryGridItem(Icons.check_circle_outline, 'Completed', '1'),
        SummaryGridItem(Icons.assignment_outlined, 'Assignments', '2'),
        SummaryGridItem(Icons.notifications_none, 'Notifications', '3'),
      ],
      sectionTitle: 'Continue Learning',
      shortcuts: ['Flutter Basics', 'Dart Fundamentals', 'UI Design'],
      recentActivity: [
        'Completed lesson: Widgets Intro',
        'Submitted assignment: Layout Task',
        'Enrolled in UI Design',
      ],
    );
  }
}
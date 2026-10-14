import 'package:flutter/material.dart';
import '../../../core/widgets/dashboard_shell.dart';
import '../../../core/widgets/summary_grid.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardShell(
      title: 'Admin Dashboard',
      greeting: 'Hello, Admin',
      summary: [
        SummaryGridItem(Icons.people_outline, 'Users', '250'),
        SummaryGridItem(Icons.category_outlined, 'Categories', '12'),
        SummaryGridItem(Icons.library_books_outlined, 'Courses', '40'),
        SummaryGridItem(Icons.reviews_outlined, 'Reviews', '75'),
      ],
      sectionTitle: 'Management Shortcuts',
      shortcuts: ['Manage Users', 'Manage Categories', 'Moderate Reviews'],
      recentActivity: [
        'New user registered',
        'New review submitted',
        'Course published by an instructor',
      ],
    );
  }
}
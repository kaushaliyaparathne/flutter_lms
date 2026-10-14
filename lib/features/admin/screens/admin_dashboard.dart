import 'package:flutter/material.dart';
import '../../../core/widgets/dashboard_shell.dart';
import '../../../core/widgets/summary_grid.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardShell(
      title: 'Admin',
      greeting: 'Hello, Admin 👋',
      subtitle: 'Platform overview',
      headerIcon: Icons.admin_panel_settings,
      summary: [
        SummaryGridItem(Icons.people_outline, 'Users', '250', Colors.indigo),
        SummaryGridItem(
            Icons.category_outlined, 'Categories', '12', Colors.teal),
        SummaryGridItem(
            Icons.library_books_outlined, 'Courses', '40', Colors.orange),
        SummaryGridItem(Icons.reviews_outlined, 'Reviews', '75', Colors.pink),
      ],
      sectionTitle: 'Management Shortcuts',
      shortcuts: ['Manage Users', 'Manage Categories', 'Moderate Reviews'],
      recentActivity: [
        'New user registered',
        'New review submitted',
        'Course published by an instructor',
      ],
      destinations: [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
        NavigationDestination(
            icon: Icon(Icons.people_outline), label: 'Users'),
        NavigationDestination(
            icon: Icon(Icons.library_books_outlined), label: 'Courses'),
        NavigationDestination(
            icon: Icon(Icons.reviews_outlined), label: 'Reviews'),
      ],
    );
  }
}
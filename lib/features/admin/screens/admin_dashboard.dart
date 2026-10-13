import 'package:flutter/material.dart';
import '../../../core/widgets/dashboard_shell.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardShell(
      title: 'Admin Dashboard',
      greeting: 'Hello, Admin',
      summary: [
        DashboardItem(Icons.people_outline, 'Users', '250'),
        DashboardItem(Icons.category_outlined, 'Categories', '12'),
        DashboardItem(Icons.library_books_outlined, 'Courses', '40'),
        DashboardItem(Icons.reviews_outlined, 'Reviews', '75'),
      ],
      sectionTitle: 'Management Shortcuts',
      shortcuts: ['Manage Users', 'Manage Categories', 'Moderate Reviews'],
    );
  }
}
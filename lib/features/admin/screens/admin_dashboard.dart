
import 'package:flutter/material.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/section_header.dart';
import '../../../routes/app_routes.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Welcome, Admin!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            const Text('Manage the LMS and monitor its activities.'),
            const SizedBox(height: 24),
            const SectionHeader(title: 'System Overview'),
            Row(
              children: [
                Expanded(
                  child: _DashboardCard(
                    icon: Icons.people_outline,
                    title: 'Users',
                    value: '0',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _DashboardCard(
                    icon: Icons.menu_book,
                    title: 'Courses',
                    value: '0',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _DashboardCard(
                    icon: Icons.assignment_outlined,
                    title: 'Assignments',
                    value: '0',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _DashboardCard(
                    icon: Icons.analytics_outlined,
                    title: 'Reports',
                    value: '0',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Recent Activities'),
            const SizedBox(
              height: 220,
              child: EmptyState(
                icon: Icons.history,
                title: 'No recent activities',
                message: 'System activities will appear here.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 30, color: Colors.indigo),
            const SizedBox(height: 12),
            Text(title),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}

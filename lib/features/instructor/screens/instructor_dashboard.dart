
import 'package:flutter/material.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/section_header.dart';
import '../../../routes/app_routes.dart';

class InstructorDashboard extends StatelessWidget {
  const InstructorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructor Dashboard'),
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
              'Hello, Instructor!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            const Text('Manage your courses and student activities.'),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Overview'),
            Row(
              children: [
                Expanded(
                  child: _DashboardCard(
                    icon: Icons.menu_book,
                    title: 'My Courses',
                    value: '0',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _DashboardCard(
                    icon: Icons.people_outline,
                    title: 'Students',
                    value: '0',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const SectionHeader(title: 'My Courses'),
            const SizedBox(
              height: 220,
              child: EmptyState(
                icon: Icons.library_books_outlined,
                title: 'No courses available',
                message: 'Courses assigned to you will appear here.',
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

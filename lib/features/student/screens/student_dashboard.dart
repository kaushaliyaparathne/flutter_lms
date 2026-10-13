
import 'package:flutter/material.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/section_header.dart';
import '../../../routes/app_routes.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
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
              'Hello, Student!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            const Text('Welcome back to your learning journey.'),
            const SizedBox(height: 24),

            const SectionHeader(title: 'My Learning'),
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
                    icon: Icons.task_alt,
                    title: 'Assignments',
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
                icon: Icons.school_outlined,
                title: 'No courses yet',
                message: 'Your enrolled courses will appear here.',
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

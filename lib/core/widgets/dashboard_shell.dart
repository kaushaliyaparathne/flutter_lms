import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import 'section_header.dart';
import 'summary_grid.dart';

class DashboardShell extends StatelessWidget {
  final String title;
  final String greeting;
  final List<SummaryGridItem> summary;
  final String sectionTitle;
  final List<String> shortcuts;
  final List<String> recentActivity;

  const DashboardShell({
    super.key,
    required this.title,
    required this.greeting,
    required this.summary,
    required this.sectionTitle,
    required this.shortcuts,
    this.recentActivity = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () =>
                Navigator.pushReplacementNamed(context, AppRoutes.login),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(greeting, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          SummaryGrid(items: summary),
          const SizedBox(height: 16),
          SectionHeader(title: sectionTitle),
          for (final s in shortcuts)
            Card(
              child: ListTile(
                title: Text(s),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),
          if (recentActivity.isNotEmpty) ...[
            const SizedBox(height: 8),
            const SectionHeader(title: 'Recent Activity'),
            for (final a in recentActivity)
              Card(
                child: ListTile(
                  leading: const Icon(Icons.history, color: Colors.indigo),
                  title: Text(a),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
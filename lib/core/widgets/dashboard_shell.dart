import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import 'section_header.dart';
import 'summary_grid.dart';

class DashboardShell extends StatelessWidget {
  final String title;
  final String greeting;
  final String subtitle;
  final IconData headerIcon;
  final List<SummaryGridItem> summary;
  final String sectionTitle;
  final List<String> shortcuts;
  final List<String> recentActivity;
  final List<NavigationDestination> destinations;

  const DashboardShell({
    super.key,
    required this.title,
    required this.greeting,
    required this.subtitle,
    required this.headerIcon,
    required this.summary,
    required this.sectionTitle,
    required this.shortcuts,
    required this.destinations,
    this.recentActivity = const [],
  });

  void _soon(BuildContext context, String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$name comes in a later day')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () => _soon(context, 'Notifications'),
          ),
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
          // Gradient greeting header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [scheme.primary, scheme.primary.withValues(alpha: 0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(greeting,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(subtitle,
                          style: const TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white24,
                  child: Icon(headerIcon, color: Colors.white, size: 30),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          SummaryGrid(items: summary),
          const SizedBox(height: 20),

          SectionHeader(title: sectionTitle),
          for (final s in shortcuts)
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: scheme.primary.withValues(alpha: 0.12),
                  child: Icon(Icons.arrow_forward, color: scheme.primary),
                ),
                title: Text(s),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _soon(context, s),
              ),
            ),

          if (recentActivity.isNotEmpty) ...[
            const SizedBox(height: 12),
            const SectionHeader(title: 'Recent Activity'),
            for (final a in recentActivity)
              Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Icon(Icons.history, color: scheme.primary),
                  title: Text(a),
                ),
              ),
          ],
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (i) =>
            _soon(context, destinations[i].label),
        destinations: destinations,
      ),
    );
  }
}
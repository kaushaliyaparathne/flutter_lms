import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import 'section_header.dart';
import 'summary_card.dart';

class DashboardItem {
  final IconData icon;
  final String label;
  final String value;
  const DashboardItem(this.icon, this.label, this.value);
}

class DashboardShell extends StatelessWidget {
  final String title;
  final String greeting;
  final List<DashboardItem> summary;
  final String sectionTitle;
  final List<String> shortcuts;

  const DashboardShell({
    super.key,
    required this.title,
    required this.greeting,
    required this.summary,
    required this.sectionTitle,
    required this.shortcuts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
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
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.4,
            children: [
              for (final s in summary)
                SummaryCard(icon: s.icon, label: s.label, value: s.value),
            ],
          ),
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
        ],
      ),
    );
  }
}

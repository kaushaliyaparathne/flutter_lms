import 'package:flutter/material.dart';
import 'summary_card.dart';

class SummaryGridItem {
  final IconData icon;
  final String label;
  final String value;
  const SummaryGridItem(this.icon, this.label, this.value);
}

class SummaryGrid extends StatelessWidget {
  final List<SummaryGridItem> items;
  const SummaryGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: [
        for (final i in items)
          SummaryCard(icon: i.icon, label: i.label, value: i.value),
      ],
    );
  }
}
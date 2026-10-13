import 'package:flutter/material.dart';

enum MessageType { success, error, info }

class MessageBox extends StatelessWidget {
  final String message;
  final MessageType type;

  const MessageBox({
    super.key,
    required this.message,
    this.type = MessageType.info,
  });

  @override
  Widget build(BuildContext context) {
    final color = switch (type) {
      MessageType.success => Colors.green,
      MessageType.error => Colors.red,
      MessageType.info => Colors.blue,
    };
    final icon = switch (type) {
      MessageType.success => Icons.check_circle_outline,
      MessageType.error => Icons.error_outline,
      MessageType.info => Icons.info_outline,
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 8),
          Expanded(child: Text(message, style: TextStyle(color: color))),
        ],
      ),
    );
  }
}
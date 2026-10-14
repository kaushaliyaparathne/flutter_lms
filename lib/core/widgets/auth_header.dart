import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 80,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.school, size: 80, color: Colors.indigo),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(subtitle, textAlign: TextAlign.center),
        const SizedBox(height: 32),
      ],
    );
  }
}
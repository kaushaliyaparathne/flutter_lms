import 'package:flutter/material.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';

enum RegisterRole { student, instructor }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  RegisterRole _role = RegisterRole.student;
  bool _obscure = true;

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  String? _required(String? v, String name) =>
      (v == null || v.trim().isEmpty) ? '$name is required' : null;

  String? _validateEmail(String? v) {
    if (v == null || v.trim().isEmpty) return 'Email is required';
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Rules seen from the backend validation messages.
  String? _validatePassword(String? v) {
    if (v == null || v.isEmpty) return 'Password is required';
    if (v.length < 8) return 'At least 8 characters';
    if (!RegExp(r'[0-9]').hasMatch(v)) return 'Must contain a number';
    if (!RegExp(r'[^A-Za-z0-9]').hasMatch(v)) {
      return 'Must contain a special character';
    }
    return null;
  }

  String? _validateConfirm(String? v) =>
      v != _password.text ? 'Passwords do not match' : null;

  // Temporary. Replaced by the real API on Day 5.
  void _register() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration UI only. API comes on Day 5')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SegmentedButton<RegisterRole>(
                      segments: const [
                        ButtonSegment(
                            value: RegisterRole.student,
                            label: Text('Student'),
                            icon: Icon(Icons.school_outlined)),
                        ButtonSegment(
                            value: RegisterRole.instructor,
                            label: Text('Instructor'),
                            icon: Icon(Icons.person_outline)),
                      ],
                      selected: {_role},
                      onSelectionChanged: (s) =>
                          setState(() => _role = s.first),
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      controller: _firstName,
                      label: 'First name',
                      prefixIcon: Icons.person_outline,
                      validator: (v) => _required(v, 'First name'),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: _lastName,
                      label: 'Last name',
                      prefixIcon: Icons.person_outline,
                      validator: (v) => _required(v, 'Last name'),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: _email,
                      label: 'Email',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: _password,
                      label: 'Password',
                      prefixIcon: Icons.lock_outline,
                      obscureText: _obscure,
                      validator: _validatePassword,
                      suffixIcon: IconButton(
                        icon: Icon(_obscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () => setState(() => _obscure = !_obscure),
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: _confirm,
                      label: 'Confirm password',
                      prefixIcon: Icons.lock_outline,
                      obscureText: _obscure,
                      validator: _validateConfirm,
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(text: 'Register', onPressed: _register),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Already have an account? Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
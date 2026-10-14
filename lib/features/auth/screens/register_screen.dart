import 'package:flutter/material.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/auth_header.dart';
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
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

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

  // Rules taken from the backend validation messages.
  String? _validatePassword(String? v) {
    if (v == null || v.isEmpty) return 'Password is required';
    if (v.length < 8) return 'At least 8 characters';
    if (!RegExp(r'[A-Z]').hasMatch(v)) return 'Must contain an uppercase letter';
    if (!RegExp(r'[a-z]').hasMatch(v)) return 'Must contain a lowercase letter';
    if (!RegExp(r'[0-9]').hasMatch(v)) return 'Must contain a number';
    if (!RegExp(r'[^A-Za-z0-9]').hasMatch(v)) {
      return 'Must contain a special character';
    }
    return null;
  }

  String? _validateConfirm(String? v) {
    if (v == null || v.isEmpty) return 'Confirm your password';
    if (v != _password.text) return 'Passwords do not match';
    return null;
  }

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
                    const AuthHeader(
                      title: 'Create Account',
                      subtitle: 'Register to start learning',
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: SegmentedButton<RegisterRole>(
                        segments: const [
                          ButtonSegment(
                            value: RegisterRole.student,
                            label: Text('Student'),
                            icon: Icon(Icons.school_outlined),
                          ),
                          ButtonSegment(
                            value: RegisterRole.instructor,
                            label: Text('Instructor'),
                            icon: Icon(Icons.person_outline),
                          ),
                        ],
                        selected: {_role},
                        onSelectionChanged: (s) =>
                            setState(() => _role = s.first),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AppTextField(
                            controller: _firstName,
                            label: 'First name',
                            prefixIcon: Icons.person_outline,
                            validator: (v) => _required(v, 'Required'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AppTextField(
                            controller: _lastName,
                            label: 'Last name',
                            validator: (v) => _required(v, 'Required'),
                          ),
                        ),
                      ],
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
                      obscureText: _obscurePassword,
                      validator: _validatePassword,
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () => setState(
                            () => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: _confirm,
                      label: 'Confirm password',
                      prefixIcon: Icons.lock_outline,
                      obscureText: _obscureConfirm,
                      validator: _validateConfirm,
                      suffixIcon: IconButton(
                        icon: Icon(_obscureConfirm
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () => setState(
                            () => _obscureConfirm = !_obscureConfirm),
                      ),
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(text: 'Register', onPressed: _register),
                    const SizedBox(height: 16),
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Login'),
                        ),
                      ],
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
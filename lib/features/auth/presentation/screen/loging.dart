import 'package:curnectgate/features/auth/presentation/controller/auth_controller.dart';
import 'package:curnectgate/features/presentation/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKeyLogin = GlobalKey<FormState>();
  final _formKeyRegister = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Future<void> _submit() async {
    final currentFormKey =
        _tabController.index == 0 ? _formKeyLogin : _formKeyRegister;
    if (!currentFormKey.currentState!.validate()) return;

    final authController = ref.read(authControllerProvider.notifier);

    try {
      if (_tabController.index == 0) {
        authController.loginUser(
          context: context,
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else {
        await authController.register(
          context: context,
          userName: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      }
    } catch (e) {
      // Errors are handled by the listener below
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, (_, state) {
      if (state.hasError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(state.error.toString())));
      }
    });

    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Screen'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'Login'), Tab(text: 'Register')],
        ),
      ),
      body: authState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _buildTabViews(authState),
        data:
            (user) =>
                user == null ? _buildTabViews(authState) : const UsersScreen(),
      ),
    );
  }

  Widget _buildTabViews(AsyncValue<User?> authState) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TabBarView(
        controller: _tabController,
        children: [_buildLoginForm(authState), _buildRegisterForm(authState)],
      ),
    );
  }

  Widget _buildLoginForm(AsyncValue<User?> authState) {
    return Form(
      key: _formKeyLogin,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) => value!.isEmpty ? 'Enter email' : null,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) => value!.isEmpty ? 'Enter password' : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: authState.isLoading ? null : _submit,
            child:
                authState.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Login'),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterForm(AsyncValue<User?> authState) {
    return Form(
      key: _formKeyRegister,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
              validator: (value) => value!.isEmpty ? 'Enter your name' : null,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) => value!.isEmpty ? 'Enter email' : null,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) => value!.isEmpty ? 'Enter password' : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: authState.isLoading ? null : _submit,
              child:
                  authState.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}

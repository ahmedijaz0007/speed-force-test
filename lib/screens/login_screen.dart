import 'package:flutter/material.dart';
import 'package:speedforcetest/widgets/custom_button.dart';

import '../constants/app_constants.dart';
import '../models/login_model.dart';
import '../repositories/auth_repo.dart';
import '../services/auth_service.dart';
import '../utils/app_utils.dart';
import '../widgets/custom_textfield.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final AuthRepository _authRepository;
  bool _isLoading = false;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    // Initialize the repository with the API service
    _authRepository = AuthRepository(AuthApiService());
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Fetch parsed data from the repository
      final Login response = await _authRepository.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      // Handle successful login (e.g., navigate to home screen)
      print('Login Successful: Token: ${response}');
    } catch (e) {
      // Show error dialog for any API or network errors
      if(mounted) {
        showErrorDialog(context, e.toString());
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextField(
                controller: _emailController,
                  prefixIcon: const Icon(Icons.email_rounded), hintText: 'Email',

              ),
              const SizedBox(height: 16),
              CustomTextField(
                keyboardType: TextInputType.text,
                controller: _passwordController,
                isPasswordVisible: !_isPasswordVisible,//This will obscure text dynamically
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_rounded),
                 suffixWidget: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),

              ),
              const SizedBox(height: 32),
              _isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton.solid(
                onPressed: _login,
                text: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:speedforcetest/routes/app_routes.dart';
import 'package:speedforcetest/services/mock_service.dart';
import 'package:speedforcetest/widgets/custom_button.dart';

import '../cache/cache_manager.dart';
import '../constants/app_constants.dart';
import '../models/login_model.dart';
import '../repositories/auth_repo.dart';
import '../services/auth_service.dart';
import '../utils/app_utils.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final AuthRepository _authRepository;
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _authRepository = AuthRepository(MockAuthApiService());
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      // If the form is invalid, stop further processing.
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final Login response = await _authRepository.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      CacheManager().storeLoginInfo(response);
      // Handle successful login
      print('Login Successful: Token: ${response.data?.firstName}');
      if (mounted) {
        Navigator.pushNamed(
          context,
          AppRoutes.DashBoardScreen , // Named route for ProfileScreen
          arguments: response, // Passing Login object
        );      }
    } catch (e) {
      if (mounted) {
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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("assets/images/png/logo.png"),
                const SizedBox(height: 16),
                const Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: validateEmail,
                  prefixIcon: const Icon(Icons.email_rounded),
                  hintText: 'Email',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _passwordController,
                  validator: validatePassword,
                  isPasswordVisible: !_isPasswordVisible,
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_rounded),
                  suffixWidget: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      side: const BorderSide(
                        width: 2,
                        color: AppColors.primaryColor,
                      ),
                      onChanged: (val) {
                        setState(() {
                          _rememberMe = val ?? false;
                        });
                      },
                    ),
                    const Text("Remember Me"),
                  ],
                ),
                const SizedBox(height: 32),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton.solid(
                  onPressed: _login,
                  text: "Login",
                ),
                const SizedBox(height: 32),
                GestureDetector(
                  onTap: () {
                    print("Forgot Password clicked");
                  },
                  child: const Text(
                    "Forgot the Password?",
                    style: TextStyle(color: AppColors.primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  "or continue with",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage("assets/images/png/fb.png"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage("assets/images/png/google.png"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an Account?"),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUp);
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:speedforcetest/widgets/custom_button.dart';

import '../constants/app_constants.dart';
import '../models/login_model.dart';
import '../repositories/auth_repo.dart';
import '../services/auth_service.dart';
import '../utils/app_utils.dart';
import '../widgets/card_widget.dart';
import '../widgets/custom_textfield.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
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
      print('Login Successful: Token: $response');
    } catch (e) {
      // Show error dialog for any API or network errors
      if(mounted) {
        Navigator.pushNamed(context, "/SignUp");
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Image.asset("assets/images/png/logo.png"),
              const SizedBox(height: 16,),
              const Text(
                "Welcome Back",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16,),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                  validator: validateEmail,
                  prefixIcon: const Icon(Icons.email_rounded), hintText: 'Email',

              ),
              const SizedBox(height: 16),
              CustomTextField(
                validator: validatePassword,
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
                      // Update the state i.e. toggle the state of passwordVisible variable
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
                  Checkbox(value: false, side:
                  const BorderSide(width: 2, color: AppColors.primaryColor),onChanged: (val){}),
                  const Text("Remember Me"),
                ],
              ),
              const SizedBox(height: 32),
              _isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton.solid(
                onPressed: _login,
                text: "Login",
              ),
              const SizedBox(height: 32),
              const Text("Forgot the Password?",style: TextStyle(color: AppColors.primaryColor),),
              const SizedBox(height: 32),
              const Text("or continue with"),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                [
                  IconButton(onPressed: (){}, icon:const Image(image: AssetImage("assets/images/png/fb.png"))),
                  const SizedBox(width: 10,),
                  IconButton(onPressed: (){}, icon: const Image(image: AssetImage("assets/images/png/google.png")))
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have a Account?"),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    child: const Text("Sign up",style: TextStyle(color: AppColors.primaryColor),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

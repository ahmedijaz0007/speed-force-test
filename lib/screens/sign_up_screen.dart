

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:speedforcetest/widgets/custom_button.dart';
import 'package:speedforcetest/widgets/custom_textfield.dart';

import '../constants/app_constants.dart';

class SignUpScreen extends StatefulWidget {
  final List<String> list = ['Male','Female'];

  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen>{
  final TextEditingController controller = TextEditingController();
  String dropdownValue = "";

  @override
  void initState() {
    dropdownValue = widget.list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                CustomTextField(controller: controller, hintText: "First Name"),
                const SizedBox(height: 12,),
                CustomTextField(controller: controller, hintText: "Last Name"),
                const SizedBox(height: 12,),
                CustomTextField(controller: controller, hintText: "Email"),
                const SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: DropdownButton(

                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                      elevation: 16,

                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: widget.list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 12,),
                CustomTextField(controller: controller, hintText: "Password"),
                const SizedBox(height: 12,),
                CustomTextField(controller: controller, hintText: "Confirm Password"),
                SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'By continuing you agree to our ',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'Terms of Service',
                          style: const TextStyle(
                            color: Color(0xFF704B8D),// Link color
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to Terms of Service page
                              print('Terms of Service clicked');
                              // Add navigation logic here
                            },
                        ),
                        const TextSpan(
                          text: ' and ',
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                            color: Color(0xFF704B8D), // Link color
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to Privacy Policy page
                              print('Privacy Policy clicked');
                              // Add navigation logic here
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                CustomButton.solid(text: "Sign Up", onPressed: (){}),
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
                    const Text("Already have an Account?"),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      child:  const Text("Log In",style: TextStyle(color: AppColors.primaryColor),),
                    )
                  ],
                )
          
          
          
              ],
            ),
          ),
        ),
      ),
    );
  }

}
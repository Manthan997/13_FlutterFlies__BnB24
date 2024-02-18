
import 'dart:math';
import 'package:health_tech/screens/admin.dart';
import 'package:health_tech/screens/homepage.dart';
import 'package:health_tech/screens/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_tech/screens/custom_text_button.dart';
import 'package:health_tech/screens/primary_button.dart';
import 'package:health_tech/screens/signup_induction.dart';
import 'package:health_tech/screens/webview_page.dart';
import 'package:health_tech/services/firebase_auth_methods.dart';
// import 'package:provider/provider.dart';
import 'package:health_tech/providers/userprovider.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _shakeKey = GlobalKey<ShakeWidgetState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signUpUser() async{
    // call the sign in method
    // FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
    //   email: _emailController.text,
    //   password: _passwordController.text,
    //   context: context,
    // );
    
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
      );
  }
  //   Provider.of<UserProvider>(context, listen: false).setUname(_emailController.text, "Doctor");
  //    Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomePage()),
  //     );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Center(
                child: Text(
                  'Welcome Back',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              const Center(
                child: Text(
                  'Sign in to unlock exclusive features and personalized content',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              AuthField(
                controller: _emailController,
                hintText: 'Enter Username',
              ),
              const SizedBox(height: 30),
              AuthField(
                controller: _passwordController,
                hintText: 'Enter Password',
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  onPressed: () {},
                  text: 'Forget Password?',
                ),
              ),
              const SizedBox(height: 20),
              ShakeWidget(
                key: _shakeKey,
                shakeOffset: 10.0,
                shakeDuration: const Duration(milliseconds: 500),
                child: PrimaryButton(
                  onTap: signUpUser,
                  // () {
                  //   if (_emailController.text.isNotEmpty &&
                  //       _passwordController.text.isNotEmpty) {
                  //         // call the sign in method
                          
                  //         print("object")
                  //   } else {
                  //     _shakeKey.currentState?.shake();
                  //   }
                  // },
                  text: 'Login',
                ),
              ),
              const SizedBox(height: 20),
              const DividerWithText(),
              const SizedBox(height: 20),
              CustomSocialButton(
                onTap: signUpUser,
                icon: AppAssets.kFaceBook,
                text: 'Join using Facebook',
                margin: 0,
              ),
              const SizedBox(height: 20),
              CustomSocialButton(
                onTap: signUpUser,
                icon: AppAssets.kGoogle,
                text: 'Join using Google',
                margin: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

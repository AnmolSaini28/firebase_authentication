import 'package:firebase_authentication/screens/login_email_password_screen.dart';
import 'package:firebase_authentication/screens/phone_screen.dart';
import 'package:firebase_authentication/screens/signup_email_password_screen.dart';
import 'package:firebase_authentication/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
          children: [
          CustomButton(
            onTap: (){
              Navigator.pushNamed(context, EmailPasswordSignup.routeName);
            },
            text: 'Email/Password Sign Up',
          ),
            CustomButton(
              onTap: (){
                Navigator.pushNamed(context, EmailPasswordLogin.routeName);
              },
              text: 'Email/Password Login',
            ),
            CustomButton(
              onTap: (){
                Navigator.pushNamed(context, PhoneScreen.routeName);
              },
              text: 'Phone Sign In',
            ),
            CustomButton(
              onTap: (){},
              text: 'Google Sign In',
            ),
            CustomButton(
              onTap: (){},
              text: 'Facebook Sign In',
            ),
            CustomButton(
              onTap: (){},
              text: 'Anonymous Sign In',
            )
        ],
      )
      ),
    );
  }
}

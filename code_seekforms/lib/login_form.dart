import 'dart:developer';

import 'package:code_seekforms/app_colors.dart';
import 'package:flutter/material.dart';

import 'const_regex_validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Pattern emailPatter = Constants.emailRegex;
  RegExp? emailRegex;

  Pattern passwordPatter = Constants.passwordRegex;
  RegExp? passwordRegExp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Flutter Form and Validation By CodeSeek",
          style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _loginKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: "Enter Email"),
                validator: (val) {
                  emailRegex = RegExp(emailPatter.toString());
                  if (val.toString().isEmpty) {
                    return "Email is Empty";
                  } else if (!emailRegex!.hasMatch(_emailController.text)) {
                    return "Invalid Email Pattern";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: "Enter Password"),
                validator: (val) {
                  passwordRegExp = RegExp(passwordPatter.toString());
                  if (val.toString().isEmpty) {
                    return "Password is Empty";
                  } else if (!passwordRegExp!
                      .hasMatch(_passwordController.text)) {
                    return "Invalid Password Pattern";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  if (_loginKey.currentState!.validate()) {
                    print("VALIDTED");
                  }
                },
                color: AppColors.themeColor,
                child: const Text("Login"),
                textColor: AppColors.whiteColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

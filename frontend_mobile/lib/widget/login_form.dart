import 'package:flutter/material.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/validators.dart';
import 'package:frontend_mobile/utils/config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              // textInputAction: TextInputAction.continueAction,
              validator: validateEmail,
              controller: emailController,
              decoration: formDecoration('Email Address', Icons.email_rounded),
            ),
            const SizedBox(child: Config.spaceSmall),
            TextFormField(
              // textInputAction: TextInputAction.continueAction,
              validator: validateEmail,
              controller: passwordController,
              decoration: formDecoration('Password', Icons.lock),
            ),
            // SIGN IN BUTTON
            MaterialButton(
              padding: const EdgeInsets.all(12),
              onPressed: () {},
              child: const Text("Sign In"),
            )
          ],
        ),
      ),
    );
  }
}

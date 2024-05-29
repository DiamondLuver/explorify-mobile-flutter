import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
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
        padding: const EdgeInsets.all(12),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              // textInputAction: TextInputAction.continueAction,
              validator: validateEmail,
              controller: emailController,
              decoration: formDecoration('', Icons.person),
            ),
            const SizedBox(child: Config.spaceSmall),
            Text(
              "Password",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              // textInputAction: TextInputAction.continueAction,
              validator: validatePassword,
              controller: passwordController,
              decoration: formDecoration('', Icons.lock),
            ),
            const SizedBox(child: Config.spaceSmall),
            Text(
              "Password",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              // textInputAction: TextInputAction.continueAction,
              validator: validatePassword,
              controller: passwordController,
              decoration: formDecoration('', Icons.lock),
            ),
            Config.spaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    Text(
                      "Remember Me",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),

                // Forget Password
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColor.error),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            // SIGN IN BUTTON
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, RouteManager.loginScreen);
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: Text(AppText.enText['signIn-button']!),
            ),
          ],
        ),
      ),
    );
  }
}

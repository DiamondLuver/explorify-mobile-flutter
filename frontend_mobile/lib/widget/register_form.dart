import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/login/logic/user_input_logic.dart';
import 'package:frontend_mobile/screens/login/services/auth_service.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/validators.dart';
import 'package:frontend_mobile/utils/config.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RigisterState();
}

class _RigisterState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  final userInputData = UserInputLogic();
  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController(text: userInputData.email);
    passwordController = TextEditingController(text: userInputData.password);
    usernameController = TextEditingController(text: userInputData.username);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }

  void signUp() {
    authService.registration(
      context: context,
      username: userInputData.username,
      password: userInputData.password,
      email: userInputData.email,
    );

    print(userInputData.email);
    print(userInputData.password);
    print(userInputData.username);
  }

  bool isSubmitted = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
              validator: validateUsername,
              autovalidateMode: isSubmitted
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              controller: usernameController,
              decoration: formDecoration('', Icons.person),
              onChanged: (value) => userInputData.updateUsername(value),
            ),
            Config.spaceSmall,
            Text(
              "Email",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              // textInputAction: TextInputAction.continueAction,
              validator: validateEmail,
              controller: emailController,
              autovalidateMode: isSubmitted
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,

              decoration: formDecoration('', Icons.email),
              onChanged: (value) => userInputData.updateEmail(value),
            ),
            // const SizedBox(child: Config.spaceSmall),
            // Text(
            //   "Phone Numbers",
            //   style: Theme.of(context).textTheme.titleSmall,
            // ),
            // const SizedBox(
            //   height: 12,
            // ),
            // TextFormField(
            //   // textInputAction: TextInputAction.continueAction,
            //   validator: validatePassword,
            //   controller: passwordController,
            //   decoration: formDecoration('', Icons.phone),
            // ),
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
              autovalidateMode: isSubmitted
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              controller: passwordController,
              decoration: formDecoration('', Icons.lock),
              onChanged: (value) => userInputData.updatePassword(value),
              obscureText: true,
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
              ],
            ),
            Config.spaceSmall,
            // SIGN UP BUTTON
            ElevatedButton(
              onPressed: () {
                // Navigator.popAndPushNamed(
                //     context, RouteManager.checkEmailScreen);
                setState(() {
                  isSubmitted == true;
                });
                if (_formKey.currentState!.validate()) {
                  signUp();
                  // print("ok");
                }
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: Text(AppText.enText['signUp-button']!),
            ),
          ],
        ),
      ),
    );
  }
}

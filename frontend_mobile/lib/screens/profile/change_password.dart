import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/screens/profile/widget/costom_appBar.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_accAppBar.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/validators.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _oldPwdController = TextEditingController();
  final TextEditingController _newPwdController = TextEditingController();
  final TextEditingController _cfPwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImage.upperStyle),
            Column(
              children: [
                CustomAccountAppBar(
                  showBackArrow: true,
                  leadingIconColor: Colors.black,
                  title: Row(
                    children: [
                      Text(
                        AppText.enText['change_pwd']!,
                        style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Update New Password",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Old Password",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        validator: validatePassword,
                        controller: _oldPwdController,
                        decoration: formDecoration('', Icons.visibility),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "New Password",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        validator: validatePassword,
                        controller: _newPwdController,
                        decoration: formDecoration('', Icons.visibility),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Confirm Password",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        validator: validatePassword,
                        controller: _cfPwdController,
                        decoration: formDecoration('', Icons.visibility),
                      ),
                      Config.spaceLarge,
                      ElevatedButton(
                        onPressed: () {},
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: Text(AppText.enText['update_button']!),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Forget password?"),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Recover your password",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 9),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

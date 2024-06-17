import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/login/services/auth_service.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:frontend_mobile/widget/register_form.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'profile',
  ],
);

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  static final FacebookLogin facebookSignIn = FacebookLogin();
  late GoogleSignInAccount _currentUser;
  late String _message;
 
  
  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account!;
        _currentUser.authentication.then((value) {
          print("Custom Log:${value.accessToken}");
          _login("google", value.accessToken!);
        });
      });
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  
  }

  void _login(String provider, String token) async {
    var dio = Dio();
    Map data = {};
    data["access_token"] = token;
    data["provider"] = provider;
    try {
      Response response = await dio.post("http://192.168.1.143:8000/api/login",
          data: data, onSendProgress: (count, total) {
        print("Count:$count");
      });
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
  }

  Future<Null> _loginFB() async {
    final FacebookLoginResult result =
        await facebookSignIn.logIn(customPermissions: ['email']);

    switch (result.status) {
      case FacebookLoginStatus.success:
        final FacebookAccessToken? accessToken = result.accessToken;
        setState(() {
          _message = '''
         Logged in!
         
         Token: ${accessToken!.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''';
          print(_message);
          _login("facebook", accessToken.token);
        });
        break;
      case FacebookLoginStatus.cancel:
        break;
      case FacebookLoginStatus.error:
        print("FB Error: ${result.error}");
        break;
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // curve style
            Image.asset(AppImage.upperStyle),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Sub-title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.enText['register_title']!,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        AppText.enText['register_text']!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Config.spaceSmall,

                  // Form Register
                  const RegisterForm(),
                  Config.spaceSmall,

                  // Divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(
                        child: Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                          indent: 60,
                          endIndent: 5,
                        ),
                      ),
                      Text(
                        "Or continue with",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Flexible(
                        child: Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                          indent: 5,
                          endIndent: 60,
                        ),
                      )
                    ],
                  ),
                  Config.spaceSmall,

                  // Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.midGrey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage(AppImage.google),
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.midGrey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage(AppImage.facebook),
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(
                                context, RouteManager.loginScreen);
                          },
                          child: const Text(
                            "Login Now",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 9),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

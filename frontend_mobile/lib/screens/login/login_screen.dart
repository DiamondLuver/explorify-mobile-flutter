import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:frontend_mobile/widget/login_form.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'profile',
  ],
);

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        AppText.enText['signIn-title']!,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        AppText.enText['signIn-text']!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Config.spaceSmall,

                  // Form Login
                  const LoginForm(),
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
                      const Text("Don't have an account yet?"),
                      TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(
                                context, RouteManager.registerScreen);
                          },
                          child: const Text(
                            "Register Now",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 9),
                          ))
                    ],
                  ),
                  // Container(
                  //   margin: const EdgeInsets.symmetric(
                  //       horizontal: 20.0, vertical: 10.0),
                  //   child: MaterialButton(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20.0)),
                  //     padding: const EdgeInsets.all(10.0),
                  //     onPressed: () => _googleSignIn.signIn(),
                  //     color: Colors.white,
                  //     elevation: 5,
                  //     child: const Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         CircleAvatar(
                  //           backgroundImage: NetworkImage(
                  //               "https://storage.googleapis.com/gd-wagtail-prod-assets/original_images/evolving_google_identity_videoposter_006.jpg"),
                  //         ),
                  //         Padding(
                  //           padding: EdgeInsets.only(left: 10.0),
                  //           child: Text("Login with Google    "),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.symmetric(
                  //       horizontal: 20.0, vertical: 10.0),
                  //   child: MaterialButton(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20.0)),
                  //     padding: const EdgeInsets.all(10.0),
                  //     onPressed: () => _loginFB(),
                  //     color: Colors.white,
                  //     elevation: 5,
                  //     child: const Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         CircleAvatar(
                  //           backgroundImage: NetworkImage(
                  //               "https://i.pinimg.com/originals/1b/99/43/1b9943ad6de248c23a430fa07b0ec5bd.png"),
                  //         ),
                  //         Padding(
                  //           padding: EdgeInsets.only(left: 10.0),
                  //           child: Text("Login with Facebook"),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

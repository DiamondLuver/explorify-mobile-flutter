import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
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
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Text(
                  "Login Page",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const LoginForm(),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          padding: const EdgeInsets.all(10.0),
                          onPressed: () => _googleSignIn.signIn(),
                          color: Colors.white,
                          elevation: 5,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://storage.googleapis.com/gd-wagtail-prod-assets/original_images/evolving_google_identity_videoposter_006.jpg"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text("Login with Google    "),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          padding: const EdgeInsets.all(10.0),
                          onPressed: () => _loginFB(),
                          color: Colors.white,
                          elevation: 5,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://i.pinimg.com/originals/1b/99/43/1b9943ad6de248c23a430fa07b0ec5bd.png"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text("Login with Facebook"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

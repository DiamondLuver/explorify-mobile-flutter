import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'profile',
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    } on DioError catch (e) {
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Social Login Example"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: const NetworkImage(
                "https://www.xda-developers.com/files/2018/02/Flutter-Framework-Feature-Image-Red.png"),
            minRadius: MediaQuery.of(context).size.width / 4,
          ),
          const SizedBox(
            height: 280,
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
    );
  }
}

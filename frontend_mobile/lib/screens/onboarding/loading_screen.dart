
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //     const Duration(seconds: 5),
  //     () {
  //       InitApp.loginApp(context);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: LoadingAnimationWidget.discreteCircle(
                    color: Colors.white,
                    size: 40,
                    secondRingColor: Colors.black,
                    thirdRingColor: Colors.orange),
              ),
            ),
          ],

          // Text(
          //   "Loading Page",
          //   style: TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // AppProgressIndicator()
        ),
      ),
    );
  }
}

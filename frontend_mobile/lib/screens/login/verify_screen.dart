// import 'package:flutter/material.dart';
// import 'package:frontend_mobile/common/image_strings.dart';
// import 'package:frontend_mobile/common/text.dart';
// import 'package:frontend_mobile/routes/route_manager.dart';
// import 'package:frontend_mobile/utils/config.dart';

// class VerifyPage extends StatefulWidget {
//   const VerifyPage({
//     super.key,
//   });

//   @override
//   State<VerifyPage> createState() => _VerifyPageState();
// }

// class _VerifyPageState extends State<VerifyPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 // curve style
//                 Image.asset(AppImage.upperStyle),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //Config.spaceLarge,
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Align(
//                             alignment: Alignment.center,
//                             child: Image.asset(
//                               AppImage.verifyEmailImg,
//                               width: 250,
//                             ),
//                           ),
//                           SizedBox(height: 40), // Space for the back button
//                           Text(
//                             AppText.enText['verify_title']!,
//                             style: Theme.of(context).textTheme.headlineLarge,
//                           ),
//                           const SizedBox(
//                             height: 12,
//                           ),
//                           Text(
//                             AppText.enText['verify_text']!,
//                             style: Theme.of(context).textTheme.bodyLarge,
//                           ),
//                           Config.spaceLarge,
//                           Config.spaceSmall,
//                           Config.spaceSmall,
//                         ],
//                       ),
//                       Config.spaceLarge,
//                       Config.spaceLarge,
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.popAndPushNamed(
//                               context, RouteManager.loginScreen);
//                         },
//                         style: Theme.of(context).elevatedButtonTheme.style,
//                         child: Text(AppText.enText['continue_button']!),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/utils/config.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final _otp = ['', '', '', '']; // List to store individual OTP digits

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                // curve style
                Image.asset(AppImage.upperStyle),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Config.spaceLarge,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppImage.verifyEmailImg,
                              width: 250,
                            ),
                          ),
                          SizedBox(height: 40), // Space for the back button
                          Text(
                            AppText.enText['verify_title']!,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            AppText.enText['verify_text']!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Config.spaceLarge,
                          Config.spaceSmall,
                          // Row for separate OTP boxes
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Individual OTP box 1
                              _otpTextField(0),
                              SizedBox(width: 20), // Gap between boxes
                              _otpTextField(1),
                              SizedBox(width: 20), // Gap between boxes
                              _otpTextField(2),
                              SizedBox(width: 20), // Gap between boxes
                              _otpTextField(3),
                            ],
                          ),
                          Config.spaceLarge,

                          ElevatedButton(
                            onPressed: () {
                              // Add your logic for OTP code verification here, using the combined _otp list
                              Navigator.popAndPushNamed(
                                  context, RouteManager.loginScreen);
                            },
                            style: Theme.of(context).elevatedButtonTheme.style,
                            child: Text(AppText.enText['continue_button']!),
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

  // Function to create individual OTP text field
  Widget _otpTextField(int index) {
    return Container(
      width: 51,
      height: 53,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[400]!, // #DDDDDD color
          width: 1.6,
        ),
      ),
      child: TextField(
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          counterText: "", // Hide the default character counter
          border: InputBorder.none, // Remove default border
        ),
        onChanged: (value) {
          setState(() {
            _otp[index] = value;
            // Move focus to the next box if a digit is entered
            if (value.isNotEmpty && index < 3) {
              FocusScope.of(context).nextFocus();
            }
          });
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// Future<void> showConfirmationDialog(BuildContext context) async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('No CV uploaded yet'),
//         content: const Text(
//             'You don\'t have a CV uploaded yet. Would you like to upload one now?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               // navigate to upload CV screen
//               Navigator.pop(context);
//               // TODO: Add navigation to upload CV screen
//             },
//             child: const Text('Upload CV'),
//           ),
//         ],
//       );
//       // AlertDialog(
//       //   title: const Text('No CV uploaded yet'),
//       //   content: const SingleChildScrollView(
//       //     child: ListBody(
//       //       children: <Widget>[
//       //         Text('You don\'t have a CV uploaded yet. Would you like to upload one now?'),
//       //         Text('\nYou will not be able to undo this action.'),
//       //       ],
//       //     ),
//       //   ),
//       //   actions: <Widget>[
//       //     TextButton(
//       //       child: const Text('NO'),
//       //       onPressed: () {
//       //         Navigator.of(context).pop();
//       //       },
//       //     ),
//       //     TextButton(
//       //       child: const Text('YES'),
//       //       onPressed: () {
//       //         // delete account logic here
//       //         Navigator.of(context).pop();
//       //       },
//       //     ),
//       //   ],
//       // );
//     },
//   );
// }

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/text.dart';

enum ConfirmationType { warning, success }

Future<void> showConfirmationDialog(
  BuildContext context, {
  required ConfirmationType type,
  required String title,
  required String content,
  required String positiveButtonText,
  VoidCallback? onPositivePressed,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      String dialogTitle = "";
      String dialogContent = "";
      String positiveButtonLabel = "";
      VoidCallback? positiveButtonAction;

      switch (type) {
        case ConfirmationType.warning:
          dialogTitle = title;
          dialogContent = content;
          positiveButtonLabel = positiveButtonText ?? "Yes";
          positiveButtonAction = onPositivePressed;
          break;
        case ConfirmationType.success:
          dialogTitle = title ?? "Success";
          dialogContent = content ?? "Your action was successful.";
          positiveButtonLabel = positiveButtonText ?? "Ok";
          break;
      }

      return Dialog(
        // width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 24.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 16.0),
              child: Text(
                content,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 12, left: 12, top: 16.0, bottom: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: MaterialButton(
                          elevation: 0,
                          highlightElevation: 0,
                          highlightColor: AppColor.buttonSecondary,
                          onPressed: () => Navigator.pop(context),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              side: BorderSide(
                                color: AppColor.primary,
                              )),
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          child: Text(
                            AppText.enText['cancel_text']!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppColor.primary),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: MaterialButton(
                          elevation: 0,
                          highlightElevation: 0,
                          highlightColor: AppColor.primary,
                          onPressed: positiveButtonAction,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              side: BorderSide(
                                color: AppColor.primary,
                              )),
                          color: AppColor.primary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          child: Text(
                            positiveButtonLabel,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppColor.white),
                          ),
                        ),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      );
      // AlertDialog(
      //   title: Text(dialogTitle),
      //   content: Text(dialogContent),
      //   actions: [
      //     TextButton(
      //       onPressed: () => Navigator.pop(context),
      //       child: const Text('Cancel'),
      //     ),
      //     TextButton(
      //       onPressed: positiveButtonAction,
      //       child: Text(positiveButtonLabel),
      //     ),
      //   ],
      // );
    },
  );
}

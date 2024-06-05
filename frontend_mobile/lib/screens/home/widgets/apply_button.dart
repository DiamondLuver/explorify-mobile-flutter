import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/provider/apply.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:provider/provider.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadState = Provider.of<UploadState>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            // Navigator.popAndPushNamed(context, RouteManager.cvGenerateScreen);
            uploadState.setIsUpload(true);
            const snackBar = SnackBar(
              content: Text(
                "Successfully added!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              duration: Duration(seconds: 1),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(50),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "Apply Now",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColor.white),
            ),
          ),
        ),
      ),
    );
  }
}

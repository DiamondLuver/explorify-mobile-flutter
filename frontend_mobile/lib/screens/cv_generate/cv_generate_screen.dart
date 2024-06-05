import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/screens/home/widgets/select_file_name.dart';

class CVGenerateScreen extends StatefulWidget {
  const CVGenerateScreen({super.key});

  @override
  State<CVGenerateScreen> createState() => _CVGenerateScreenState();
}

class _CVGenerateScreenState extends State<CVGenerateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.enText['cv_title']!,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.primary),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                textAlign: TextAlign.justify,
                AppText.enText['cv_text']!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.normal, color: AppColor.secondary),
              ),
              const SizedBox(
                height: 18,
              ),
              const SelectFileButton(),
            ],
          ),
        ),
      ),
    );
  }
}

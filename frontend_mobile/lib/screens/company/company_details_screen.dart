import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/screens/home/widgets/bullet_list.dart';
import 'package:frontend_mobile/screens/home/widgets/company_info.dart';

import '../../widget/app_bar.dart';

class CompanyDetailsScreen extends StatelessWidget {
  final String logoImg;
  final String companyName;
  final String location;

  const CompanyDetailsScreen({
    super.key,
    required this.logoImg,
    required this.companyName,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.upperStyle),
            CustomAppBar(
              isCenter: true,
              showBackArrow: true,
              title: Text(
                "Company Profile",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    radius: 50,
                    child: Image.asset(
                      logoImg,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          companyName,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          location,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
                    "Contacts",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w600, color: AppColor.primary),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  BulletList(
                    const [
                      'Email: contact@example.com',
                      'Phone: +1234567890',
                      'Address: 123 Main Street, City, Country'
                    ],
                  ),
                  // Text(
                  //   textAlign: TextAlign.justify,
                  //   "Email: contact@example.com\nPhone: +1234567890\nAddress: 123 Main Street, City, Country",
                  //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  //       fontWeight: FontWeight.normal,
                  //       color: AppColor.secondary),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: CompanyInfo(),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}

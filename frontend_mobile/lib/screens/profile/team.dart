import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_accAppBar.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImage.upperStyle),
            const CustomAccountAppBar(
              showBackArrow: true,
              leadingIconColor: Colors.black,
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  "Language",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // Team members
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTeamMemberBox(
                        context,
                        'Edward Gilmore',
                        'Founder and CEO',
                        '+1234567890',
                        AppImage.linhImg,
                      ),
                      _buildTeamMemberBox(
                        context,
                        'Lucy Kims',
                        'Member Experience Manager',
                        '+1234567891',
                        AppImage.debImg,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTeamMemberBox(
                        context,
                        'Dan Wilson',
                        'Senior Community Manager',
                        '+1234567892',
                        AppImage.pichImg,
                      ),
                      _buildTeamMemberBox(
                        context,
                        'Lucy Kims',
                        'Member Experience Manager',
                        '+1234567891',
                        AppImage.sakuraImg,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTeamMemberBox(
                        context,
                        'Dan Wilson',
                        'Senior Community Manager',
                        '+1234567892',
                        AppImage.lizaImg,
                      ),
                      _buildTeamMemberBox(
                        context,
                        'Lucy Kims',
                        'Member Experience Manager',
                        '+1234567891',
                        AppImage.chhenglyImg,
                      ),
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

  Widget _buildTeamMemberBox(BuildContext context, String name, String role,
      String phone, String imagePath) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 325,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 10),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            role,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            phone,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook),
                onPressed: () {
                  // Handle Facebook icon press
                },
              ),
              IconButton(
                icon: const Icon(Icons.telegram),
                onPressed: () {
                  // Handle Telegram icon press
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

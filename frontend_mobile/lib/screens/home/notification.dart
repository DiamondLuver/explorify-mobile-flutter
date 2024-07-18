import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/screens/home/widgets/notificationList.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_accAppBar.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_divider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImage.upperStyle),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAccountAppBar(
                  showBackArrow: true,
                  leadingIconColor: Colors.black,
                  title: Text(
                    "Notification",
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recently",
                        style: TextStyle(
                          fontSize: 12, // Adjust the font size as needed
                          fontWeight: FontWeight.bold, // Make the text bold
                          color: AppColor.midGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProfileNotification(
                        image:
                            'https://cdn.britannica.com/83/211883-050-46933F1A/Rihanna-Barbadian-singer-Robyn-Fenty.jpg',
                        title: 'New Message',
                        subtitle: 'You have received a new message.',
                        date: '3h',
                        onTap: () {
                          // Handle notification tap
                        },
                      ),
                      const Divider(),
                      ProfileNotification(
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnFnOsOnTM6Q_cQ2eyjJF9Da2j0PzFRJb5Wg&s',
                        title: 'New Message',
                        subtitle: 'You have received a new message.',
                        date: '2024-07-03',
                        onTap: () {
                          // Handle notification tap
                        },
                      ),
                      const Divider(),
                      ProfileNotification(
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPe0_J8N_1gw7HqclDM5oaG1r04ogZ05Av-Q&s',
                        title: 'New Message',
                        subtitle: 'You have received a new message.',
                        date: '2024-07-03',
                        onTap: () {
                          // Handle notification tap
                        },
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Last Week",
                        style: TextStyle(
                          fontSize: 12, // Adjust the font size as needed
                          fontWeight: FontWeight.bold, // Make the text bold
                          color: AppColor.midGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      ProfileNotification(
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfhLU_BMLmN_y6J7IX0bfrqKWqNw86A5e-lw&s',
                        title: 'New Message',
                        subtitle: 'You have received a new message.',
                        date: '3h',
                        onTap: () {
                          // Handle notification tap
                        },
                      ),
                      const Divider(),
                      ProfileNotification(
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsGwlwih-vrpqbC1pYFh6a7t59HYhALxhNPA&s',
                        title: 'New Message',
                        subtitle: 'You have received a new message.',
                        date: '2024-07-03',
                        onTap: () {
                          // Handle notification tap
                        },
                      ),
                      const Divider(),
                      ProfileNotification(
                        image:
                            'https://i.pinimg.com/736x/01/61/6b/01616b7daa1d2ef8846022bffc253d68.jpg',
                        title: 'New Message',
                        subtitle: 'You have received a new message.',
                        date: '2024-07-03',
                        onTap: () {
                          // Handle notification tap
                        },
                      ),
                      const Divider(),
                      ProfileNotification(
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfhLU_BMLmN_y6J7IX0bfrqKWqNw86A5e-lw&s',
                        title: 'New Message',
                        subtitle: 'You have received a new message.',
                        date: '3h',
                        onTap: () {
                          // Handle notification tap
                        },
                      ),
                      const Divider(),
                      ProfileNotification(
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsGwlwih-vrpqbC1pYFh6a7t59HYhALxhNPA&s',
                        title: 'New Message',
                        subtitle: 'You have received a new message.',
                        date: '2024-07-03',
                        onTap: () {
                          // Handle notification tap
                        },
                      ),
                      const Divider(),
                      ProfileNotification(
                        image:
                            'https://i.pinimg.com/736x/01/61/6b/01616b7daa1d2ef8846022bffc253d68.jpg',
                        title: 'New Message',
                        subtitle: 'You have received a new message.',
                        date: '2024-07-03',
                        onTap: () {
                          // Handle notification tap
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

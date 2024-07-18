// import 'package:flutter/material.dart';
// import 'package:frontend_mobile/common/colors.dart';

// class ProfileNotification extends StatelessWidget {
//   const ProfileNotification({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.subtitle,
//     required this.date,
//     required this.onTap,
//   });
//   final String image;
//   final String title;
//   final String subtitle;
//   final String date;
//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Image.network(
//         image,
//         width: 50,
//         height: 50,
//       ),
//       title: Text(
//         title,
//         style: Theme.of(context).textTheme.titleLarge,
//       ),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             subtitle,
//             style: Theme.of(context).textTheme.bodyMedium,
//           ),
//           Text(
//             date,
//             style: Theme.of(context).textTheme.bodySmall,
//           ),
//         ],
//       ),
//       onTap: onTap,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class ProfileNotification extends StatelessWidget {
  const ProfileNotification({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.onTap,
  });

  final String image;
  final String title;
  final String subtitle;
  final String date;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Image.network(
          image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            date,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}

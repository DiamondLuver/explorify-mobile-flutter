import 'package:flutter/material.dart';

class CustomAccountAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAccountAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.action,
    this.leadingOnPressed,
    this.leadingIconColor = Colors.white, // Add this line
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPressed;
  final Color leadingIconColor; // Add this line

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: showBackArrow
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: leadingIconColor,
                ),
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: () {
                      if (leadingOnPressed != null) {
                        leadingOnPressed!();
                      }
                    },
                    icon: Icon(
                      leadingIcon,
                      size: 20,
                      color: leadingIconColor,
                    ),
                  )
                : null,
      ),
      title: title,
      actions: action,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

// class CustomAccountAppBar extends StatelessWidget
//     implements PreferredSizeWidget {
//   final Widget? title;
//   final bool showBackArrow;
//   final IconData? leadingIcon;
//   final VoidCallback? leadingOnPressed;
//   final Color leadingIconColor;
//   final List<Widget>? actions;

//   const CustomAccountAppBar({
//     super.key,
//     this.title,
//     this.showBackArrow = false,
//     this.leadingIcon,
//     this.leadingOnPressed,
//     this.leadingIconColor = Colors.white,
//     this.actions,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: preferredSize.height +
//           MediaQuery.of(context).padding.top, // Add status bar height
//       color: Colors.transparent,
//       child: Padding(
//         padding: const EdgeInsets.only(
//             left: 16.0, right: 16.0), // Adjust padding as needed
//         child: Row(
//           children: [
//             if (showBackArrow)
//               IconButton(
//                 onPressed: leadingOnPressed ??
//                     () => Navigator.pop(context), // Handle back button press
//                 icon: Icon(
//                   leadingIcon ?? Icons.arrow_back_ios,
//                   color: leadingIconColor,
//                 ),
//               ),
//             Spacer(),
//             if (title != null) Text(title.toString()),
//             Spacer(),
//             if (actions != null) ...actions!,
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize =>
//       const Size.fromHeight(56.0); // Adjust height as needed
// }

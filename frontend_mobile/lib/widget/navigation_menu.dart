import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/artical/artical_screen.dart';
import 'package:frontend_mobile/screens/home/home_screen.dart';
import 'package:frontend_mobile/screens/profile/profile_screen.dart';
import 'package:frontend_mobile/screens/history/history_screen.dart';
import 'package:provider/provider.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      extendBody: true, 
      bottomNavigationBar: Material(
        elevation: 8,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Background color for navigation bar
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 8, 
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: NavigationBar(
            height: 60,
            backgroundColor: Colors.transparent,  
            selectedIndex: context.watch<NavigationProvider>().selectedIndex,
            onDestinationSelected: (index) {
              if (index == 3) {
                // Navigate to the profile screen using Navigator.pushNamed
                Navigator.pushNamed(context, '/profile');
              } else {
                // Update the selected index for other destinations
                context.read<NavigationProvider>().updateSelectedIndex(index);
              }
            },
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(IconData(0xe0a2, fontFamily: 'MaterialIcons')), label: 'Article'),
              NavigationDestination(icon: Icon(Icons.history), label: 'History'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
      body: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            transitionBuilder: (Widget child, Animation<double> animation) {
              final offsetAnimation = Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation);
              return SlideTransition(position: offsetAnimation, child: child);
            },
            child: provider.screens[provider.selectedIndex],
          );
        },
      ),
    );
  }
}

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const ArticleScreen(),
    Container(color: Colors.yellow),
    const ProfileScreen(),
  ];

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 60,
        elevation: 0,
        selectedIndex: context.watch<NavigationProvider>().selectedIndex,
        onDestinationSelected: (index) =>
            context.read<NavigationProvider>().updateSelectedIndex(index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.document_scanner), label: 'Article'),
          NavigationDestination(icon: Icon(Icons.history), label: 'History'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: context
          .watch<NavigationProvider>()
          .screens[context.watch<NavigationProvider>().selectedIndex],
    );
  }
}

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    Container(color: Colors.red),
    Container(color: Colors.yellow),
    Container(color: Colors.orange),
  ];

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

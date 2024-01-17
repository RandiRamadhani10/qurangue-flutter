import 'package:flutter/material.dart';
import 'package:quran_gue/src/screens/list_screen.dart';
import 'package:quran_gue/src/utils/Custom_colors.dart';
import 'package:quran_gue/src/screens/home_screen.dart';
import 'package:quran_gue/src/screens/list_screen.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({super.key});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomeScreen(),
          ListScreen(),
          // const Center(child: Text('Settings')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: CustomColors.tealLightsec,
        selectedItemColor: Colors.white,
        backgroundColor: CustomColors.tealLight,
        onTap: (final index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Quran',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.bookmark),
          //   label: 'Bookmark',
          // ),
        ],
      ),
    );
  }
}

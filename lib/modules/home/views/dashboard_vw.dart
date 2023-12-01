import 'package:flutter/material.dart';
import 'package:xcbt/configs/all_configs.dart';

import '../x_homes.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const Center(child: Text('Materi')),
    const Center(
      child: Text('Notif'),
    ),
    const Center(
      child: Text('Profile'),
    ),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
          color: kWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavMenu(
              iconPath: 'lib/assets/icons/home.png',
              label: 'Home',
              isActive: _selectedIndex == 0,
              onPressed: () => _onItemTapped(0),
            ),
            NavMenu(
              iconPath: 'lib/assets/icons/message.png',
              label: 'Materi',
              isActive: _selectedIndex == 1,
              onPressed: () => _onItemTapped(1),
            ),
            NavMenu(
              iconPath: 'lib/assets/icons/bell.png',
              label: 'Notification',
              isActive: _selectedIndex == 2,
              onPressed: () => _onItemTapped(2),
            ),
            NavMenu(
              iconPath: 'lib/assets/icons/user.png',
              label: 'Profile',
              isActive: _selectedIndex == 3,
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}
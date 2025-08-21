import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_training/all_tasks.dart';
import 'package:flutter_training/pages/home.page.dart';
import 'package:flutter_training/pages/profile.page.dart';
import 'package:flutter_training/pages/settings.page.dart';
import 'package:flutter_training/pages/new_password.page.dart';
import 'package:flutter_training/pages/privacy.page.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.currentLocation, required this.child});

  final String currentLocation;
  final Widget child;

  int _calculateSelectedIndex(String location) {
    if (location.startsWith('/settings')) return 1;
    if (location.startsWith('/profile')) return 2;
    // default to home (AllTasks)
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/settings');
        break;
      case 2:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = _calculateSelectedIndex(currentLocation);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => ScaffoldWithNavBar(
        currentLocation: state.uri.toString(),
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/',
          name: 'tasks',
          builder: (context, state) => const AllTasks(),
        ),
        // Optional: keep a simple Home demo page
        GoRoute(
          path: '/home',
          name: 'homePage',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) => const SettingsPage(),
          routes: [
            GoRoute(
              path: 'new-password',
              name: 'newPassword',
              builder: (context, state) => const NewPasswordPage(),
            ),
            GoRoute(
              path: 'privacy',
              name: 'privacy',
              builder: (context, state) => const PrivacyPage(),
            ),
          ],
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
  ],
);

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 20),
          const Text(
            'Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.blue),
            title: const Text('Change Password'),
            subtitle: const Text('Update your account password'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.go('/settings/new-password'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.green),
            title: const Text('Privacy Settings'),
            subtitle: const Text('Manage your privacy preferences'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.go('/settings/privacy'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.grey),
            title: const Text('About'),
            subtitle: const Text('App version and information'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Todo App',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.check_circle),
              );
            },
          ),
        ],
      ),
    );
  }
}
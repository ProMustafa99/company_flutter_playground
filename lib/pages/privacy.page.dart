import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool _locationSharing = false;
  bool _dataCollection = true;
  bool _analytics = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/settings'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 20),
          const Text(
            'Privacy & Data',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text('Location Sharing'),
            subtitle: const Text('Allow app to access your location'),
            value: _locationSharing,
            onChanged: (value) {
              setState(() {
                _locationSharing = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Data Collection'),
            subtitle: const Text('Help improve the app by sharing usage data'),
            value: _dataCollection,
            onChanged: (value) {
              setState(() {
                _dataCollection = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Analytics'),
            subtitle: const Text('Allow anonymous analytics collection'),
            value: _analytics,
            onChanged: (value) {
              setState(() {
                _analytics = value;
              });
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Privacy settings saved!')),
              );
              context.go('/settings');
            },
            child: const Text('Save Settings'),
          ),
        ],
      ),
    );
  }
}

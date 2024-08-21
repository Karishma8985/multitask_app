import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo[400],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
       backgroundColor: Colors.blue[100],
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          // Section for account settings
          ListTile(
            leading: Icon(Icons.person, color: Colors.indigo[400]),
            title: Text('Account Settings'),
            subtitle: Text('Manage your account settings'),
            onTap: () {
              // Handle navigation to account settings
            },
          ),
          Divider(),
          
          // Section for theme settings
          ListTile(
            leading: Icon(Icons.color_lens, color: Colors.indigo[400]),
            title: Text('Theme'),
            subtitle: Text('Choose your theme'),
            onTap: () {
              // Handle navigation to theme settings
            },
          ),
          Divider(),

          // Section for notifications
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.indigo[400]),
            title: Text('Notifications'),
            subtitle: Text('Manage your notification preferences'),
            onTap: () {
              // Handle navigation to notification settings
            },
          ),
          Divider(),

          // Section for about app
          ListTile(
            leading: Icon(Icons.info, color: Colors.indigo[400]),
            title: Text('About'),
            subtitle: Text('App information and version'),
            onTap: () {
              // Handle navigation to about app
            },
          ),
          Divider(),

          // Section for logout
          ListTile(
            leading: Icon(Icons.logout, color: Colors.indigo[400]),
            title: Text('Logout'),
            subtitle: Text('Sign out of your account'),
            onTap: () {
              // Handle logout action
            },
          ),
        ],
      ),
    );
  }
}

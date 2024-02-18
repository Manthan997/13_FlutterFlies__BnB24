import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Admin Home Screen',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to user management dashboard
                Navigator.pushNamed(context, '/user_management');
              },
              child: Text('User Management'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to system configuration panel
                Navigator.pushNamed(context, '/system_configuration');
              },
              child: Text('System Configuration'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to analytics dashboard
                Navigator.pushNamed(context, '/analytics_dashboard');
              },
              child: Text('Analytics Dashboard'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to reporting module
                Navigator.pushNamed(context, '/reporting_module');
              },
              child: Text('Reporting Module'),
            ),
          ],
        ),
      ),
    );
  }
}
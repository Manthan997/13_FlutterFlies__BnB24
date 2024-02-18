import 'package:flutter/material.dart';
import 'package:health_tech/constants.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Home',
          style: TextStyle(
            fontFamily:
                'YourDesiredFont', // Replace 'YourDesiredFont' with the desired font family
            fontSize: 20, // Adjust font size as needed
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue, // Set the background color to a sky color
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/back.png'), // Replace 'assets/background_image.jpg' with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Admin Features',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.settings,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: <Widget>[
                    TabBar(
                      isScrollable: true,
                      labelColor: Colors.black, // Set label color to white
                      unselectedLabelColor: AppColors.kSecondary.withOpacity(
                          0.6), // Use kWhite with opacity for unselected labels
                      indicator: BoxDecoration(
                        // Set indicator color to kPrimary
                        color: AppColors.kPrimary,
                      ),
                      tabs: [
                        Tab(text: 'User Management'),
                        Tab(text: 'System Configuration'),
                        Tab(text: 'Analytics Dashboard'),
                        Tab(text: 'Reporting Module'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text('User Management Content'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('System Configuration Content'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Analytics Dashboard Content'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Reporting Module Content'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
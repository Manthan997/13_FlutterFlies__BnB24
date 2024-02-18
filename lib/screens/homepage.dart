import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_tech/providers/userprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

var username = Provider.of<UserProvider>(context).username;

    return Scaffold(
      appBar: AppBar(
        title: Text('welcome $username'),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage('URL_TO_PROFILE_PICTURE'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Option 1'),
              onTap: () {
                // Handle option 1
              },
            ),
            ListTile(
              title: Text('Option 2'),
              onTap: () {
                // Handle option 2
              },
            ),
          ],
        ),
      ),

      
      body: SingleChildScrollView(
        
        child: Column(
        children: [
          // const Expanded(
          //   child:
          // ),
          Text("Nearest Hospitals", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 10, maxWidth: 400, minHeight: 10, maxHeight: 400), // Replace 05 with valid BoxConstraints
            child: GoogleMap(
              // Map configuration
            
              initialCameraPosition: CameraPosition(
                target: LatLng(37.7749, -122.4194), // Initial map location
                zoom: 12.0,
              ),
            ),
            ),
            const Text("Health Blogs", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Container(
  height: MediaQuery.of(context).size.height * 0.5, // Adjust the height as needed
  child: PageView.builder(
    itemCount: 2, // Replace with the length of your blogs list
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Blog Entry ${index + 1}', // Replace with your blog title
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    },
  ),
),

        ],
        
      ),
    ),
    );
  }
}

// floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Handle emergency call
      //   },
      //   child: Icon(Icons.call),
      // ),
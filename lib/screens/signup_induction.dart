import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_tech/providers/userprovider.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  User _user = FirebaseAuth.instance.currentUser as User; //

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void updateuserprovider() {
    Provider.of<UserProvider>(context, listen: false).setUname(_nameController.text, "user");
    _updateProfile();
  }

  Future<void> _getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
      });
      // Retrieve user data from Firestore if available
      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection('patients').doc(user.uid).get();
      if (userData.exists) {
        _nameController.text = userData['name'];
        _ageController.text = userData['age'];
        _genderController.text = userData['gender'];
      }
    }
  }

  Future<void> _updateProfile() async {
    try {
      await FirebaseFirestore.instance.collection('patients').doc(_user.uid).set({
        'name': _nameController.text,
        'age': _ageController.text,
        'gender': _genderController.text,
      }, SetOptions(merge: true));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully')),
      );
    } catch (error) {
      print('Error updating profile: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            TextFormField(
              controller: _genderController,
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateuserprovider,
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
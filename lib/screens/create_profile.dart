import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruitbox_delivery/screens/home_screen.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> saveProfile() async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

      // Create a reference to the user's profile in Firestore
      CollectionReference drivers = FirebaseFirestore.instance.collection("drivers");

      // Save user details
      await drivers.doc(userId).set({
        'name': name,
        'email': email,
        'contactNo': contactNo,
        'selectedWorkTiming': selectedWorkTiming,
        'location': location,
        'selectedVehicle': selectedVehicle,
      });

      // Print success message
      print('Profile saved successfully!');
    } catch (e) {
      print('Error saving profile: $e');
      // Handle error accordingly
    }
  }

  String name = '';
  String email = '';
  String contactNo = '';
  String selectedVehicle = 'Bike';
  String selectedWorkTiming = 'Full Time';
  String location = '';

  bool isEditing = true;

  List<String> vehicleOptions = ['Bike', 'EV', 'Cycle', 'Other'];
  List<String> WorkTimingOptions = ['Full Time', 'Part Time', 'Weekends Only'];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC201),
        title: Text(
          'Get On Board!!',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Center(
                // ... existing code
              ),
              SizedBox(height: 20),
              Text(
                'Create your profile to start your Journey.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    contactNo = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Contact No.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField(
                value: selectedWorkTiming,
                onChanged: (value) {
                  setState(() {
                    selectedWorkTiming = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Work Timings',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: WorkTimingOptions.map((option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    location = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Enter location to work in',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField(
                value: selectedVehicle,
                onChanged: (value) {
                  setState(() {
                    selectedVehicle = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Vehicle you will use',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: vehicleOptions.map((option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  saveProfile();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHome()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFFC201),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

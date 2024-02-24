import 'package:flutter/material.dart';
import 'package:fruitbox_delivery/screens/settings.dart';

import 'create_profile.dart';
import 'home_screen.dart';
import 'order_history.dart';
import 'order_screen.dart';

class MyEarnings extends StatefulWidget {
  const MyEarnings({Key? key});

  @override
  State<MyEarnings> createState() => _MyEarningsState();
}

class _MyEarningsState extends State<MyEarnings> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Earnings',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFFFFC201),
        leading: GestureDetector(
          onTap: () {
            // Implement your drawer functionality here if needed
          },
          child: Icon(
            Icons.menu, // Hamburger menu icon
            color: Colors.black, // Set the color of the icon
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: Image.asset(
                'assets/images/earningsimg.png',
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
              ),
            ),
            Center(
              child: Text(
                'Your Earnings!!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFC201),
        selectedItemColor: Colors.black, // Color of the active item
        unselectedItemColor: Colors.grey, // Color of inactive items
        currentIndex: _currentIndex,
        onTap: (index) {
          // Handle tapping on navigation items
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            // Navigate to the home page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHome()),
            );
          } else if (index == 1) {
            // Handle other navigation items
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderScreen()),
            );
          } else if (index == 2) {
            // Already on MyEarnings page
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MySetting()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined), // Use outlined version
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee_rounded), // Use outlined version
            label: 'My Earnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined), // Use outlined version
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

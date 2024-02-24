import 'package:flutter/material.dart';
import 'package:fruitbox_delivery/screens/login.dart';
import 'package:fruitbox_delivery/screens/order_history.dart';
import 'home_screen.dart';
import 'order_screen.dart';


class MySetting extends StatefulWidget {
  @override
  _MySettingState createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  TextEditingController _phoneController = TextEditingController();

  int _currentIndex = 3;

  _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Sign Out",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          content: Text(
            "Are you sure you want to sign out?",
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                // Perform sign-out logic here
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MyLogin(),
                ));
              },
            ),
          ],
        );
      },
    );
  }

  _showChangePhoneNumberDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Change Phone Number"),
          content: TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(labelText: "New Phone Number"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                // Implement logic to update the phone number in your data store.
                // You can use _phoneController.text to get the new phone number.
                // After updating the phone number, you can return to the previous screen.
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.w100,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Color(0xFFFFC201),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Change Phone Number'),
            onTap: () {
              _showChangePhoneNumberDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sign Out'),
            onTap: () {
              _showSignOutDialog(context);
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
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
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHome()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => OrderScreen()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => OrderHistory()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MySetting()),
              );
              break;
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
            icon: Icon(Icons.history_outlined), // Use outlined version
            label: 'History',
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

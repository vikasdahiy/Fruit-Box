import 'package:flutter/material.dart';
import 'package:fruitbox_delivery/screens/earningsScreen.dart';
import 'package:fruitbox_delivery/screens/settings.dart';
import 'create_profile.dart';
import 'order_history.dart';
import 'order_screen.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFFFFC201),
        leading: GestureDetector(
          onTap: () {
            scaffoldKey.currentState?.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double screenWidth = constraints.maxWidth;
          double buttonWidth = screenWidth * 0.4;
          double buttonHeight = 150.0;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/deliveryimg.png',
                    width: screenWidth * 0.4,
                    height: screenWidth * 0.4,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Start Your Journey Now!!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSquareButton(
                      label: 'New Orders',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OrderScreen()),
                        );
                      },
                      width: buttonWidth,
                      height: buttonHeight,
                    ),
                    _buildSquareButton(
                      label: 'My Earnings',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyEarnings()),
                        );
                      },
                      width: buttonWidth,
                      height: buttonHeight,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSquareButton(
                      label: 'Order In Progress',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyEarnings()),
                        );
                      },
                      width: buttonWidth,
                      height: buttonHeight,
                    ),
                    _buildSquareButton(
                      label: 'Not Yet Delivered',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyEarnings()),
                        );
                      },
                      width: buttonWidth,
                      height: buttonHeight,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        },
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white70,
                ),
                child: Image.asset(
                  "assets/images/fruitbox_logo.png",
                  width: 200, // Adjust the width as needed
                  height: 200, // Adjust the height as needed
                  fit: BoxFit.contain, // Adjust the fit as needed
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHome()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person_outlined),
                title: Text("My Profile"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.list_alt_outlined),
                title: Text("Orders"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.history_outlined),
                title: Text("History"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderHistory()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.currency_rupee_rounded),
                title: Text("Your Earnings"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyEarnings()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.local_shipping_outlined),
                title: Text("Orders in progress"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.directions_bike),
                title: Text("Not yet delivered"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text("Settings"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MySetting()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFC201),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
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
                MaterialPageRoute(builder: (context) => const MyEarnings()),
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
            icon: Icon(Icons.list_alt_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee_rounded),
            label: 'My Earnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildSquareButton({
    required String label,
    required VoidCallback onPressed,
    required double width,
    required double height,
  }) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(40.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10.0,
          backgroundColor: Color(0xFFFFC201),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

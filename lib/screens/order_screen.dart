import 'package:flutter/material.dart';
import 'package:fruitbox_delivery/screens/create_profile.dart';
import 'package:fruitbox_delivery/screens/deliveryscreen.dart';
import 'package:fruitbox_delivery/screens/earningsScreen.dart';
import 'package:fruitbox_delivery/screens/home_screen.dart';
import 'package:fruitbox_delivery/screens/settings.dart';

import 'order_history.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order> orders = [
    Order(id: 1, product: 'Apples', quantity: 5, total: 10.0),
    Order(id: 2, product: 'Mango', quantity: 2, total: 4.0),
    Order(id: 3, product: 'Oranges', quantity: 3, total: 6.0),
    // Add more orders here
  ];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'New Orders',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFFFFC201),
        leading: GestureDetector(
          onTap: () {
            scaffoldKey.currentState?.openDrawer(); // Open the drawer on tap
          },
          child: Icon(
            Icons.menu, // Hamburger menu icon
            color: Colors.black, // Set the color of the icon
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Order ID: ${order.id}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product: ${order.product}'),
                  Text('Quantity: ${order.quantity}'),
                  Text('Total: Rs.${order.total.toStringAsFixed(2)}'),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const Delivery_Screen(), // Replace NextScreen with your actual screen
                    ),
                  );
                  // Add order processing logic here
                  // You can update order status, mark as delivered, etc.
                  // For example, you can remove the order from the list
                  //setState(() {
                  //orders.removeAt(index);
                  //});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFC201),
                ),
                child: Text(
                  'Go for delivery',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton.extended(
            onPressed: () {
              // Handle button tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHome()),
              );
              // You can navigate to a different screen, show a dialog, etc.
              print('Back Button Tapped');
            },
            backgroundColor: Color(0xFFFFC201),
            label: Text(
              'Back',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  "John Maxwell",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                accountEmail: Text(
                  "johnmaxwell1234@email.com",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  // You can set a profile picture here
                  backgroundImage: AssetImage("assets/images/deliveryimg.png"),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFFC201),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  // Handle tapping on the "Orders" item in the drawer
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
                  // Handle tapping on the "Orders" item in the drawer
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
                  // Handle tapping on the "Home" item in the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderScreen()),
                  );
                  // You can navigate to the home page or use your logic here
                },
              ),
              ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text("Settings"),
                onTap: () {
                  // Handle tapping on the "Listed" item in the drawer
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
                MaterialPageRoute(builder: (context) => MyEarnings()),
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

class Order {
  final int id;
  final String product;
  final int quantity;
  final double total;

  Order({
    required this.id,
    required this.product,
    required this.quantity,
    required this.total,
  });
}

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruitbox_delivery/screens/authotp.dart';
import 'package:fruitbox_delivery/screens/create_profile.dart';
import 'package:fruitbox_delivery/screens/deliveryscreen.dart';
import 'package:fruitbox_delivery/screens/earningsScreen.dart';
import 'package:fruitbox_delivery/screens/home_screen.dart';
import 'package:fruitbox_delivery/screens/login.dart';
import 'package:fruitbox_delivery/screens/order_history.dart';
import 'package:fruitbox_delivery/screens/order_screen.dart';
import 'package:fruitbox_delivery/screens/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAyWW2ZEu04iXpTf-alBsPISwVrhN39WBg",
      appId: "1:573217921792:android:343506b40a02869e2af1e5",
      messagingSenderId: "573217921792",
      projectId: "fruitbox-4bb62",
    ),
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => const MyLogin(),
      'authotp': (context) => const MyOtp(),
      'create_profile': (context) => Profile(),
      'order_screen': (context) => const OrderScreen(),
      'home_screen': (context) => const MyHome(),
      'deliveryscreen': (context) => const Delivery_Screen(),
      'settings': (context) => MySetting(),
      'order_history': (context) => const OrderHistory(),
      'earningsScreen': (context) => const MyEarnings(),

    },
  ));
}

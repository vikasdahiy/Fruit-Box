import 'package:firebase_auth/firebase_auth.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:flutter/material.dart';
import 'package:fruitbox_delivery/screens/login.dart';
import 'package:pinput/pinput.dart';
import 'package:fruitbox_delivery/screens/create_profile.dart';

import 'login.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({Key? key}) : super(key: key);

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  void navigateToNextScreen() {
    // Use Navigator to push the next screen (replace 'NextScreen' with your actual screen)
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return MyLogin();
      }),
    );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    var code = "";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: Image.asset(
                  'assets/images/deliveryimg.png',
                  width: screenSize.width * 0.8, // Adjust as needed
                  height: screenSize.width * 0.8, // Make it square
                ),
              ),
              Text(
                'Verify Youself',
                style: TextStyle(
                  fontSize: screenSize.width * 0.05, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenSize.width * 0.02, // Responsive spacing
              ),
              Text(
                'Enter the OTP sent',
                style: TextStyle(
                  fontSize: screenSize.width * 0.020, // Responsive font size
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: screenSize.width * 0.04, // Responsive spacing
              ),
              Pinput(
                length: 6,
                //defaultPinTheme: defaultPinTheme,
                //focusedPinTheme: focusedPinTheme,
                //submittedPinTheme: submittedPinTheme,
                //validator: (s) {
                //return s == '2222' ? null : 'Pin is incorrect';
                //},
                //pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onChanged: (value) {
                  code = value;
                },
                //onCompleted: (pin) => print(pin),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: screenSize.width * 0.02, // Responsive spacing
              ),
              SizedBox(
                height: screenSize.width * 0.09, // Responsive height
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: MyLogin.verify, smsCode: code);
                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                      Navigator.pushNamedAndRemoveUntil(
                          context, "create_profile", (route) => false);
                    } catch (e) {
                      print("Wrong OTP");
                    }
                  },
                  child: Text('Verify Phone Number'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 196, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: navigateToNextScreen,
                      child: Text(
                        'Edit Phone number ?',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

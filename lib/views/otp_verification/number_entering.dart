import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cab_user/styles/login_register_otp_style.dart';
import 'package:cab_user/views/otp_verification/otp_screen.dart';

class NumberEnteringScreen extends StatelessWidget {
  const NumberEnteringScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: IconButton(
            onPressed: () {
              Get.to(OtpScreen());
            },
            icon: Icon(Icons.arrow_forward_ios_rounded),
            iconSize: 40,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text("You Get OTP To This Number", style: labelFont),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefix: Text(
                        "+ 91",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Enter Your Mobile Number",
                      fillColor: textfieldColor,
                      filled: true,
                      border: textfieldBorder),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

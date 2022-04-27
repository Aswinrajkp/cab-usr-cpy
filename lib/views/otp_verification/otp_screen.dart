import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:cab_user/styles/login_register_otp_style.dart';
import 'package:cab_user/views/bottom_sheet/searching.dart';
import 'package:cab_user/views/home/home.dart';
import 'package:cab_user/views/home/home_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                child: Text("OTP Verification", style: labelFont),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Your Mobile Number",
                  style: labelFont,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "+91 ----------",
                  style: labelFont,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: OTPTextField(
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 80,
                  style: TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceEvenly,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    Get.to(HomeScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

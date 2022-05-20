import 'package:cab_user/controller/payment_controller.dart';
import 'package:cab_user/views/home/home.dart';
import 'package:cab_user/views/payment/payment_screen.dart';
import 'package:cab_user/views/splash.dart/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentController controller = Get.put(PaymentController());
    return GetBuilder<PaymentController>(
      initState: (state){
        Future.delayed(const Duration(milliseconds: 2400),(){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>SplashScreen()), (route) => false);
        });
      },
      builder: (controller) {
        return Scaffold(
          body: Center(child: Lottie.asset("assets/lottie/heart-pay.json")),
        );
      }
    );
  }
}
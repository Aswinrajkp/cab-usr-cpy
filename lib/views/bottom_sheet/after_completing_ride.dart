import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cab_user/views/bottom_sheet/payment.dart';
import 'package:cab_user/views/home/home_screen.dart';

class AfterCompletingScreen extends StatelessWidget {
  const AfterCompletingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        // onTap: (){
        //           Navigator.of(context).pushReplacement(MaterialPageRoute(
        //               builder: (ctx) => PaymentScreen()));},
        child: Center(
          child: NeumorphicButton(
            pressed: false,
            onPressed: () =>
                Get.off(MainScreen(widget: PaymentBottomScreen(), height: .31,leading: null,)),
            style: NeumorphicStyle(
              border: const NeumorphicBorder(width: 1),
              shape: NeumorphicShape.convex,
              boxShape: NeumorphicBoxShape.beveled(BorderRadius.circular(5)),
            ),
            child: Text(
              "Trip Completed",
              style: GoogleFonts.josefinSans(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

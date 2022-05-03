import 'package:cab_user/views/bottom_sheet/bottom_showing.dart';
import 'package:cab_user/views/navigation/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cab_user/styles/bottom_sheet_style.dart';
import 'package:cab_user/views/bottom_sheet/after_completing_ride.dart';
import 'package:cab_user/views/bottom_sheet/searching.dart';
import 'package:cab_user/views/home/home.dart';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:cab_user/views/widgets/backbutton.dart';

class AfterFindingVehicleScreen extends StatelessWidget {
  const AfterFindingVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("           Your PIN :", style: infomations),
                Text("2123", style: infomations),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Vehicle Number :", style: infomations),
                Text("KL 58 W 331", style: infomations),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                 icon: Icon( Icons.call,),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapScreen()));
                },
                 iconSize:30,
                ),
                NeumorphicButton(
                  pressed: false,
                  onPressed: () => Get.to(
                     HomeScreen()),
                  style: NeumorphicStyle(
                    border: const NeumorphicBorder(width: 1),
                    shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.beveled(BorderRadius.circular(5)),
                  ),
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.josefinSans(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.sms,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => MainScreen(
                              widget: AfterCompletingScreen(),
                              height: .14,
                              leading: BackButtonWidget(),
                            )));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

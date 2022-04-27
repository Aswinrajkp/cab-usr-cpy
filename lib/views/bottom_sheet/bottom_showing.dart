import 'package:cab_user/views/bottom_sheet/searching.dart';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomShowngScreen extends StatelessWidget {
  const BottomShowngScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    MainScreen(widget: SearchingLocation(), height: .60)));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            height: 59,
            width: MediaQuery.of(context).size.width * .79,
            child: Center(
                child: Text(
              "Start Ride",
              style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cab_user/styles/my_rides_style.dart';
import 'package:cab_user/styles/profile_style.dart';
import 'package:cab_user/styles/settings_style.dart';
import 'package:cab_user/views/my_rides/canceled_screen.dart';
import 'package:cab_user/views/my_rides/completed_screen.dart';
import 'package:cab_user/views/widgets/leading_widget.dart';
import 'package:swipe/swipe.dart';

class MyRidesScreen extends StatelessWidget {
  const MyRidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: neumorphicDefaultTheme.baseColor,
        appBar: AppBar(
          leading: LeadingWidget(
            color: Colors.white,
          ),
          title: Text(
            "My Rides",
            style: titleStyle,
          ),
          centerTitle: true,
          backgroundColor: Colors.black54,
          bottom: TabBar(
            indicatorColor: neumorphicDefaultTheme.baseColor,
            indicatorWeight: 3.0,
            labelStyle: labelStyle,
            // indicator: BoxDecoration(
            // // borderRadius: BorderRadius.circular(50),
            // color: neumorphicDefaultTheme.baseColor),
            tabs: [
              Tab(
                text: "Completed Rides",
              ),
              Tab(
                text: "Canceled Rides",
              ),
            ],
          ),
        ),
        body: Swipe(
          onSwipeLeft: () => ZoomDrawer.of(context)!.toggle(),
          onSwipeRight: () => ZoomDrawer.of(context)!.toggle(),
          child: TabBarView(children: [
            CompletedRidesScreen(),
            CancelledRidesScreen(),
          ]),
        ),
      ),
    );
  }
}

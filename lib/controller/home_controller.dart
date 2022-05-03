import 'package:cab_user/helpers/mapbox_handler.dart';
import 'package:cab_user/views/bottom_sheet/bottom_showing.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';
import 'package:cab_user/models/home_drawer/drawer_model.dart';
import 'package:cab_user/views/bottom_sheet/searching.dart';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:cab_user/views/home/menu_screen.dart';
import 'package:cab_user/views/my_rides/my_rides_screen.dart';
import 'package:cab_user/views/profile/profile_screen.dart';
import 'package:cab_user/views/settings/settings_screen.dart';
import 'package:cab_user/views/widgets/leading_widget.dart';

class HomeController extends GetxController {
  MenuItem currentItem = MenuItems.home;

  drawerItemChanging(item) {
    currentItem = item;
    update();
  }

  showingScreen() {
    switch (currentItem) {
      case MenuItems.profile:
        return ProfileScreen();
      case MenuItems.home:
        return MainScreen(
          widget: BottomShowngScreen(),
          height: .12,
          leading: LeadingWidget(
            color: Colors.black,
          ),
        );
      case MenuItems.trips:
        return MyRidesScreen();
      default:
        return SettingsScreen();
    }
  }
}

import 'package:cab_user/requests/vehicle_details_get_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:cab_user/controller/home_controller.dart';
import 'package:cab_user/views/home/menu_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VehicleDetailsServices vehicleController =
        Get.put(VehicleDetailsServices());
    HomeController controller = Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (controller) {
      return ZoomDrawer(
        menuScreen: Builder(builder: (context) {
          return MenuScreen(
              currentItem: controller.currentItem,
              onSelectedItem: (item) {
                controller.drawerItemChanging(item);
                ZoomDrawer.of(context)!.close();
              });
        }),
        mainScreen: controller.showingScreen(),
        style: DrawerStyle.DefaultStyle,
        slideWidth: MediaQuery.of(context).size.width * .30,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
        angle: 0.0,
      );
    });
  }
}

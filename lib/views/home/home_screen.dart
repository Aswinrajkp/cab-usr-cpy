import 'package:cab_user/controller/map_controller.dart';
import 'package:cab_user/requests/profile_get_request.dart';
import 'package:cab_user/requests/vehicle_details_get_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:cab_user/controller/home_controller.dart';
import 'package:cab_user/views/widgets/leading_widget.dart';
import 'package:cab_user/views/widgets/panel_widget.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:swipe/swipe.dart';

mapController getController = Get.put(mapController());

class MainScreen extends StatefulWidget {
  var widget;
  var height;
  var leading;

  MainScreen(
      {Key? key, required this.widget, required this.height,required this.leading})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PanelController panelController = PanelController();
  late CameraPosition initialCameraPosition;
  late MapboxMapController mapboxMapController;
  late Future<Map> modified;
  late String distance;
  late String dropOffTime;
  late Map geometry;
  final List<CameraPosition> _kTripEndPoints = [];
  LatLng point = LatLng(11.8745, 75.3704);


  @override
  void initState() {
    initialCameraPosition =
        CameraPosition(target: getController.currentLocation, zoom: 15);
    // TODO: implement initState
    super.initState();
  }

  onMapCreated(MapboxMapController controller) async {
    this.mapboxMapController = controller;
  }

  onStyleLoadedCallback() async {}

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    VehicleDetailsServices vehicleDetails = Get.put(VehicleDetailsServices());
    ProfileGettingController profile = Get.put(ProfileGettingController());
    return SafeArea(
      child: Scaffold(
        extendBody: true,

        body: Swipe(
            onSwipeLeft: () => ZoomDrawer.of(context)!.toggle(),
            onSwipeRight: () => ZoomDrawer.of(context)!.toggle(),
            child: Stack(
              children: [
                SlidingUpPanel(
                  minHeight: MediaQuery.of(context).size.height * widget.height,
                  controller: panelController,
                  parallaxEnabled: true,
                  parallaxOffset: .5,
                  body: Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: MapboxMap(
                          initialCameraPosition: initialCameraPosition,
                          accessToken:
                              "sk.eyJ1IjoiYXN3aW5yYWprcCIsImEiOiJjbDI3NHBxb2swMzlkM2RwdTZ0MDRqeDdwIn0.s60QCvF9-hyJe_52Gbg6UQ",
                          onMapCreated: onMapCreated,
                          onStyleLoadedCallback: onStyleLoadedCallback,
                          myLocationEnabled: true,
                          myLocationTrackingMode:
                              MyLocationTrackingMode.TrackingGPS,
                          minMaxZoomPreference:
                              const MinMaxZoomPreference(14, 17),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              mapboxMapController.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                      initialCameraPosition));
                            },
                            icon: Icon(Icons.my_location),
                            color: Colors.blue.shade400,
                          )),
                      Positioned(
                          top: 10,
                          left: 10,
                          child: widget.leading,
                          ),
                    ],
                  ),
                  panelBuilder: (controller) =>
                      GetBuilder<HomeController>(builder: (HomeController) {
                    return PanelWidget(
                        controller: controller,
                        panelController: panelController,
                        widget: widget.widget);
                  }),
                ),
              ],
            )),
      ),
    );
  }
}

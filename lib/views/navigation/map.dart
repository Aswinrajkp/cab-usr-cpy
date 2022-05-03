import 'package:cab_user/controller/map_controller.dart';
import 'package:cab_user/helpers/mapbox_handler.dart';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:cab_user/views/navigation/routing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late CameraPosition initialCameraPosition;
  late MapboxMapController mapboxMapController;

  @override
  void initState() {
    initialCameraPosition =
        CameraPosition(target: getCenterCoordinatesForPolyline(getController.geometry), zoom: 15);
    for (String type in ['source', 'destination']) {
      getController.locations.add(CameraPosition(target: getTripLatlng(type)));
    }
    getController.initailizeDirectionResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mapController controller = Get.put(mapController());
    return SafeArea(
      child: Scaffold(

        extendBody: true,
        body: GetBuilder<mapController>(builder: (controller) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: MapboxMap(
              initialCameraPosition: initialCameraPosition,
              accessToken:
                  "sk.eyJ1IjoiYXN3aW5yYWprcCIsImEiOiJjbDI3NHBxb2swMzlkM2RwdTZ0MDRqeDdwIn0.s60QCvF9-hyJe_52Gbg6UQ",
              onMapCreated: controller.onMapCreated,
              onStyleLoadedCallback: controller.onStyleLoadedCallback,
              myLocationEnabled: true,
              myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
              // minMaxZoomPreference: const MinMaxZoomPreference(14, 19),
            ),
          );
        }),
        floatingActionButton: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RoutingScreen()));
        }, icon: Icon(Icons.route)),
      ),
    );
  }
}

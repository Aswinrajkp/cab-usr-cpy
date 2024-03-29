import 'package:cab_user/controller/map_controller.dart';
import 'package:cab_user/helpers/mapbox_handler.dart';
import 'package:cab_user/requests/profile_get_request.dart';
import 'package:cab_user/views/home/home.dart';
import 'package:cab_user/views/login/login.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:location/location.dart';


class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);

  
  mapController getController = Get.put(mapController());

  late CameraPosition initialCameraPosition;
  late MapboxMapController mapboxMapController;

  void initializeLocationAndSave(context, controller) async {
    Location _location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
    }
    getController.locationData = await _location.getLocation();
    getController.currentLocation = LatLng(getController.locationData.latitude!,
        getController.locationData.longitude!);

    getController.currentAddress = (await getParsedReverseGeocoding(
        getController.currentLocation))['place'];
  controller.id == null?
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen())):
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    mapController getController = Get.put(mapController());
    ProfileGettingController profile = Get.put(ProfileGettingController());
    return GetBuilder<mapController>(
        initState: (state) {
          initializeLocationAndSave(context,profile);
        },
        builder: (controller) {
          return EasySplashScreen(
            durationInSeconds: 2,
            loaderColor: Colors.blue.shade400,
            gradientBackground: LinearGradient(colors: [
              Colors.blue.shade400,
              Colors.white,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            logo: const Image(
                image: AssetImage('assets/images/cab booking splash.png')),
            logoSize: 150.0,
            title: Text(
              "Cab Hub",
              style: GoogleFonts.lobster(fontSize: 40),
            ),
          );
        });
  }
}
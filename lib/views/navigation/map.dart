import 'package:cab_user/controller/map_controller.dart';
import 'package:cab_user/helpers/mapbox_handler.dart';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:cab_user/views/navigation/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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

  // @override
  // void initState() {
  //   initialCameraPosition =
  //       CameraPosition(target: getCenterCoordinatesForPolyline(getController.geometry), zoom: 15);
  //   for (String type in ['source', 'destination']) {
  //     getController.locations.add(CameraPosition(target: getTripLatlng(type)));
  //   }
  //   getController.initailizeDirectionResponse();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    mapController controller = Get.put(mapController());
    getController.lastResponseGetting(context);
    return SafeArea(
      child: GetBuilder<mapController>(
        initState: (state){
           initialCameraPosition =
        CameraPosition(target: getCenterCoordinatesForPolyline(getController.geometry), zoom: 15);
    for (String type in ['source', 'destination']) {
      getController.locations.add(CameraPosition(target: getTripLatlng(type)));
    }
    initailizeDirectionResponse();
        } ,
        builder: (getController) {
          return Scaffold(
            appBar: AppBar(title: Text("Navigation",style: TextStyle(color: Colors.black),),centerTitle: true,elevation: 0,backgroundColor: neumorphicDefaultTheme.baseColor,
            leading: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),)),
            body: GetBuilder<mapController>(builder: (controller) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: MapboxMap(
                  initialCameraPosition: initialCameraPosition,
                  accessToken:
                      "sk.eyJ1IjoiYXN3aW5yYWprcCIsImEiOiJjbDI3NHBxb2swMzlkM2RwdTZ0MDRqeDdwIn0.s60QCvF9-hyJe_52Gbg6UQ",
                  onMapCreated: onMapCreated,
                  onStyleLoadedCallback: onStyleLoadedCallback,
                  myLocationEnabled: true,
                  myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
                  // minMaxZoomPreference: const MinMaxZoomPreference(14, 19),
                ),
              );
            }),
            // floatingActionButton: IconButton(onPressed: (){
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RoutingScreen()));
            // }, icon: Icon(Icons.route)),
          );
        }
      ),
    );
  }

  initailizeDirectionResponse()  {
    getController.distance = (getController.lastResponse['distance'] / 1000).toStringAsFixed(1);
    getController.geometry = getController.lastResponse['geometry'];
    print(getController.distance);
    return getController.distance;
  }
   onStyleLoadedCallback() async {
    for (int i = 0; i < getController.locations.length; i++) {
      String iconImage = i == 0 ? 'circle' : 'square';
      await mapboxMapController.addSymbol(SymbolOptions(
        geometry: getController.locations[i].target,
        iconSize: 0.1,
        iconImage: "assets/icon/$iconImage.png",
      ));
      
    }
    addSourceAndLineLayer();
   
  }

  addSourceAndLineLayer() async {
    final fills = {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "id": 0,
          "properties": <String, dynamic>{},
          "geometry": getController.geometry,
        }
      ]
    };
    await mapboxMapController.addSource(
        "fills", GeojsonSourceProperties(data: fills));
    await mapboxMapController.addLineLayer(
        "fills",
        "lines",
        LineLayerProperties(
          lineColor: Colors.indigo.toHexStringRGB(),
          lineCap: "round",
          lineJoin: "round",
          lineWidth: 5,
        ));
  }
  onMapCreated(MapboxMapController controller) async {
    mapboxMapController = controller;
  }
}

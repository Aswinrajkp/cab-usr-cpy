import 'package:cab_user/controller/home_controller.dart';
import 'package:cab_user/controller/map_controller.dart';
import 'package:cab_user/helpers/mapbox_handler.dart';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:cab_user/views/widgets/panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DriverNavigation extends StatefulWidget {
   var widget;
  var height;
  var leading;
   DriverNavigation({ Key? key, required this.widget, required this.height,required this.leading }) : super(key: key);

  @override
  State<DriverNavigation> createState() => _DriverNavigationState();
}

class _DriverNavigationState extends State<DriverNavigation> {
   late CameraPosition initialCameraPosition;
  late MapboxMapController mapboxMapController;
  PanelController panelController = PanelController();

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
            // appBar: AppBar(title: Text("Navigation",style: TextStyle(color: Colors.black),),centerTitle: true,elevation: 0,backgroundColor: neumorphicDefaultTheme.baseColor,
            // leading: IconButton(onPressed: (){
            //   Get.back();
            // }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),)),
            body: GetBuilder<mapController>(builder: (controller) {
              return SlidingUpPanel(
                minHeight: MediaQuery.of(context).size.height * widget.height,
                  controller: panelController,
                  parallaxEnabled: true,
                  parallaxOffset: .5,
                body: Stack(
                  children: 
                    [SizedBox(
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
                    ),
                    // Positioned(
                    //       top: 10,
                    //       left: 10,
                    //       child: widget.leading,
                    //       ),
                  ],
                  
                ),
                panelBuilder: (controller) =>
                      GetBuilder<HomeController>(builder: (HomeController) {
                    return PanelWidget(
                        controller: controller,
                        panelController: panelController,
                        widget: widget.widget);
                  }),
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
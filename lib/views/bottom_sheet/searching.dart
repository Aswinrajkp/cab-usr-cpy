import 'package:cab_user/controller/home_controller.dart';
import 'package:cab_user/controller/map_controller.dart';
import 'package:cab_user/helpers/shared_preferences.dart';
import 'package:cab_user/helpers/socket_io.dart';
import 'package:cab_user/requests/available_vehicle_get_request.dart';
import 'package:cab_user/requests/vehicle_details_get_request.dart';
import 'package:cab_user/styles/bottom_sheet_style.dart';
import 'package:cab_user/views/bottom_sheet/after_confirm.dart';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:cab_user/views/navigation/map.dart';
import 'package:cab_user/views/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SearchingLocation extends StatelessWidget {
  SearchingLocation({Key? key}) : super(key: key);
  VehicleDetailsServices vehicle = VehicleDetailsServices();
  PanelController controller = PanelController();
  ScrollController scrollController = ScrollController();
  TextEditingController pickupController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mapController searchController = Get.put(mapController());
    HomeController homeController = Get.put(HomeController());
     AvailableVehicles availableVehicles = Get.put(AvailableVehicles());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GetBuilder<mapController>(
            builder: (controller) {
              return Column(
                children: [
                  TextFormField(
                    controller: pickupController,
                    onTap: ()=>controller.changeSearchTrue(),
                    onChanged: (value) {
                      searchController.onChangedHandling(value);
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              
                              var location = await searchController
                                  .userCurrentLocationButtonHandler();
                              pickupController.text = location;
                         
                            },
                            icon: Icon(Icons.my_location)),
                        prefixIcon: Icon(Icons.search),
                        hintText: "Enter your Pickup Location",
                        fillColor: textfieldColor,
                        filled: true,
                        border: textfieldBorder),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    onTap: () =>  controller.changeSearchFalse(),
                    onChanged: (value) async {
                      controller.onChangedHandling(value);
                     
                    },
                    controller: destinationController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Enter your Destination",
                        fillColor: textfieldColor,
                        filled: true,
                        border: textfieldBorder),
                  ),
                ],
              );
            }
          ),
          SizedBox(height: 20),
          NeumorphicButton(
            pressed: false,
            onPressed: () async {
              print("starting Searching");
              //   String userId = await IdStoring.getId();
             
            //  connect(location: getController.pickUpLocationForDriver,userId:userId, vehicleId: vehicleId );
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) =>MainScreen(widget: AfterConfirmScreen(), height: .33)));
            //  await getController.lastResponseGetting(context);
              await vehicle.gettingVehicleDetails();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MainScreen(widget: AfterConfirmScreen(), height: .34)));
            },
            style: NeumorphicStyle(
              border: const NeumorphicBorder(width: 1),
              shape: NeumorphicShape.convex,
              boxShape: NeumorphicBoxShape.beveled(BorderRadius.circular(5)),
            ),
            child: Text(
              "Find Vehicle",
              style: GoogleFonts.josefinSans(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          GetBuilder<mapController>(builder: (controller) {
            return searchListView(destinationController, pickupController);
          }),
        ],
      ),
    );
  }
}

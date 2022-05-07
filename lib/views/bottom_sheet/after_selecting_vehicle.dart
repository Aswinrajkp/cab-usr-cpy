import 'package:cab_user/controller/map_controller.dart';
import 'package:cab_user/helpers/shared_preferences.dart';
import 'package:cab_user/helpers/socket_io.dart';
import 'package:cab_user/requests/available_vehicle_get_request.dart';
import 'package:cab_user/requests/available_vehicle_informations.dart';
import 'package:cab_user/views/widgets/vehicle_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cab_user/styles/bottom_sheet_style.dart';
import 'package:cab_user/views/bottom_sheet/after_finding_vehicle.dart';
import 'package:cab_user/views/home/home.dart';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:cab_user/views/widgets/backbutton.dart';
import 'package:get/get.dart';

class AfterSelectingVehicleScreen extends StatefulWidget {
  String vehicleId;
   AfterSelectingVehicleScreen({Key? key,required this.vehicleId}) : super(key: key);

  @override
  State<AfterSelectingVehicleScreen> createState() => _AfterSelectingVehicleScreenState();
}

class _AfterSelectingVehicleScreenState extends State<AfterSelectingVehicleScreen> {

  @override
  void initState() {
   vehicleFinding(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AvailableVehicles availableVehicles = Get.put(AvailableVehicles());
    mapController navigation = Get.put(mapController());
     AvailableVehicleInformation vehicleInformation = Get.put(AvailableVehicleInformation());

    return GetBuilder<AvailableVehicleInformation>(
      builder: (vehicleInformation) {
        return Container(
          child: vehicleInformation.id ==null?
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Finding Vehicle Just Wait", style: findingvehicle),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: NeumorphicProgressIndeterminate(),
              )
            ],
          ):
          VehicleDetailsShowingWidget()
        );
      }
    );
  }

  vehicleFinding(context) async {
                  print("UserId getting working");
                  String userId = await IdStoring.getId();
                  print(getController.pickupLocation);
                  connect(location: getController.pickUpLocationForDriver,userId:userId, vehicleId: widget.vehicleId,pickup: getController.pickupLocation);
               
                  // await Future.delayed(const Duration(seconds: 10),(){
                  //       Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //     builder: (ctx) => MainScreen(
                  //           widget: AfterFindingVehicleScreen(),
                  //           height: .25,
                  //           leading: BackButtonWidget(),
                  //         )));
                  // }
                  //);
                 
                }
}

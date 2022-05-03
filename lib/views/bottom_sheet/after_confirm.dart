import 'package:cab_user/models/get_methords/vehicles_getting.dart';
import 'package:cab_user/requests/available_vehicle_get_request.dart';
import 'package:cab_user/requests/vehicle_details_get_request.dart';
import 'package:cab_user/styles/bottom_sheet_style.dart';
import 'package:cab_user/views/bottom_sheet/after_selecting_vehicle.dart';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:cab_user/views/widgets/backbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AfterConfirmScreen extends StatelessWidget {

  AfterConfirmScreen({Key? key}) : super(key: key);

  List<Vehicles>? vehicles;

  @override
  Widget build(BuildContext context) {
    VehicleDetailsServices vehicleController =
        Get.put(VehicleDetailsServices());
        AvailableVehicles availableVehicles = Get.put(AvailableVehicles());

    return GetBuilder<VehicleDetailsServices>(
        builder: (vehicleController) {
          return ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              var vehicle = vehicleController.jsondata[index];
              return ListTile(
                onTap: ()async { 
                 String vehicleId = await availableVehicles.gettingAvailableVehilces(vehicle["vehicle_name"]);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => MainScreen(
                              widget: AfterSelectingVehicleScreen(vehicleId: vehicleId),
                              height: .18,
                              leading: BackButtonWidget(),
                            )));
            },
                            leading: Image(image: NetworkImage(vehicle['image'])),
                title: Text("${vehicle["vehicle_name"]}",style: vehicleShowingListtileStyle),
                subtitle:  Text(
                  "Avg Speed ${vehicle['speed']}",
                  style: vehicleShowingListtileStyle,
                ),
                trailing: Text(
                  "₹ ${vehicle['charge']}",
                  style: vehicleShowingListtileStyle,
                )
              );
            },
          );
        });
  }
}

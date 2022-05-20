import 'package:cab_user/helpers/socket_io.dart';
import 'package:cab_user/requests/available_vehicle_informations.dart';
import 'package:cab_user/styles/bottom_sheet_style.dart';
import 'package:cab_user/views/bottom_sheet/after_completing_ride.dart';
import 'package:cab_user/views/home/home.dart';
import 'package:cab_user/views/navigation/map.dart';
import 'package:cab_user/views/widgets/backbutton.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleDetailsShowingWidget extends StatelessWidget {
  const VehicleDetailsShowingWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SocketIOController socketIO = Get.put(SocketIOController());
    AvailableVehicleInformation vehicleInformation = Get.put(AvailableVehicleInformation());
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("           Your PIN :", style: infomations,),
                Text(socketIO.pinForDriver, style: infomations),
              
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Vehicle Number :", style: infomations),
                Text(vehicleInformation.details['result']["vehicleNumber"].toString(), style: infomations),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                 icon: Icon( Icons.call,),
                onPressed: (){
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapScreen()));
                },
                 iconSize:30,
                ),
                NeumorphicButton(
                  pressed: false,
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false),
                  style: NeumorphicStyle(
                    border: const NeumorphicBorder(width: 1),
                    shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.beveled(BorderRadius.circular(5)),
                  ),
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.josefinSans(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.sms,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => MapScreen(
                              widget: AfterCompletingScreen(),
                              height: .14,
                              leading: BackButtonWidget(),
                            )));
                  },
                )
              ],
            ),
          ),
        ],
      );
  }
}
import 'package:cab_user/helpers/shared_preferences.dart';
import 'package:cab_user/requests/available_vehicle_informations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

var uInfo;

class SocketIOController extends GetxController {
  late io.Socket socket;

  var checking;
  var driverinfo;
  String pinForDriver = '';

  void socketConnect({
    required vehicleId,
    required location,
    required userId,
    required pickup,
    required location2,
    required distance,
    required dropout,
  }) async {
    String id = await IdStoring.getId();
    print(
        "???????????????????????????????????????????????????????????????????Entered");

    socket = io.io("https://cab-hub1.herokuapp.com/", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

//625b97828ef99bcd4551171f
// 625b97828ef99bcd4551171f

    socket.connect();

    socket.onConnect((_) {
      var message = {
        "_id": vehicleId,
        "driverId": "62833b32eba61517b0ac2d16",
        "location1": location,
        "location2": location2,
        "distance": distance,
        "userId": userId,
        "pickupcordinate": pickup,
        "destinationcordinate": dropout,
      };

      print(
          '?????????????????????????????????????????????????????On connect is working ');
      socket.emit("message", message);

      checking = message;
      print(
          "????????????????????????????????????????????????????????????Emited");
      print("The socket.io data VehicleId:$vehicleId");

      print("The socket.io data location:$location");

      print("The socket.io data userId:$userId");
    });

    socket.on(
        "connect_error",
        (data) => {
              print(
                  "????????????????????????????????????????? this is the error of socket io $data")
            });
    print("=======================Waiting for driver information");
    socket.on('driver_info', (data) {
      print("????????????????????++++++++++++++++++++++++++++${data}");
      driverinfo = data;
       update();
      for (int i = 0; i < 4; i++) {
        pinForDriver += id[i];
      }
      print(pinForDriver);

      uInfo = data;
      AvailableVehicleInformation availableVehicleInformation =
          Get.put(AvailableVehicleInformation());
      // availableVehicleInformation.idAssigning(data);
      availableVehicleInformation.gettingAvailableVehicleDetails(data);
    });

    print("The socket.io data VehicleId:$vehicleId");

    print("The socket.io data location:$location");

    print("The socket.io data userId:$userId");
  }
}

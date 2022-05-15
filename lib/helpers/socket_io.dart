import 'package:cab_user/requests/available_vehicle_informations.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;



class SocketIOController extends GetxController{
  late io.Socket socket;

var checking;

void socketConnect(
    {required vehicleId,
    required location,
    required userId,
    required pickup}) async {
  print("???????????????????????????????????????????????????????????????????Entered");


  socket = io.io("https://cab-hub1.herokuapp.com/", <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });


  socket.connect();

  socket.onConnect((_) {
    var message = {
      "_id": "625b97828ef99bcd4551171f",
      "location": location,
      "userId": userId,
      "cordinates": pickup,
  };


    print('?????????????????????????????????????????????????????On connect is working ');
    socket.emit("message", message);

    checking = message;
    print ("????????????????????????????????????????????????????????????Emited");
    print("The socket.io data VehicleId:$vehicleId");


  print("The socket.io data location:$location");

  print("The socket.io data userId:$userId");

  });

 

  socket.on("connect_error", (data) => {
     print("????????????????????????????????????????? this is the error of socket io $data")
    });

  socket.on('driver_info', (data) {
    AvailableVehicleInformation availableVehicleInformation = Get.put(AvailableVehicleInformation());
    availableVehicleInformation.idAssigning(data);
    availableVehicleInformation.gettingAvailableVehicleDetails(data);
  });

  print("The socket.io data VehicleId:$vehicleId");

  print("The socket.io data location:$location");
  
  print("The socket.io data userId:$userId");
}
}
import 'package:cab_user/requests/available_vehicle_informations.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;



late io.Socket socket;

void connect(
    {required vehicleId,
    required location,
    required userId,
    required pickup}) async {
  print("Entered");
  socket = io.io("http://0d8a-45-116-231-5.ngrok.io", <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });
  socket.connect();
  socket.onConnect((_) {
    var message = {
      "_id": vehicleId,
      "location": location,
      "userId": userId,
      "cordinates": pickup,
  };

    print('On connect is working ');
    socket.emit("message", message);
    print ("Emited");
  });

 

  socket.on("connect_error", (data) => {
     print(" this is the error of socket io $data")
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
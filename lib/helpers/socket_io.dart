import 'package:socket_io_client/socket_io_client.dart' as io;

late io.Socket socket;

void connect(
    {required vehicleId,
    required location,
    required userId,
    required pickup}) async {
  print("Entered");
  socket = io.io("http://f324-103-85-204-229.ngrok.io", <String, dynamic>{
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
  });

 

  socket.on("connect_error", (data) => {print("================${data}")});

  socket.on('driver_info', (data) {
    print("this is the data of driver $data");
  });

  print("The socket.io data VehicleId:$vehicleId");
  print("The socket.io data location:$location");
  print("The socket.io data userId:$userId");
}
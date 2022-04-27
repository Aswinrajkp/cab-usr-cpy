import 'package:socket_io_client/socket_io_client.dart'as io;

late io.Socket socket;

void connect(
  {required vehicleId, required location,required userId}
  )async {
    print("Entered");
  socket = io.io("http://1568-103-85-204-229.ngrok.io", io.OptionBuilder()
      .setTransports(['websocket']) 
      .disableAutoConnect() 
      .build());
       socket.connect();
  var message = {
   "_id" : vehicleId,
   "location" : location,
   "userId" : userId,
  };

 socket.on("connect_error", (data)=>{
  print("================${data}")
});
      socket.emit("message" , message);  
      print(vehicleId);
      print(location);
      print(userId);
}
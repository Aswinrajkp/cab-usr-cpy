import 'package:cab_user/requests/trip_details_get_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cab_user/styles/my_rides_style.dart';
import 'package:cab_user/views/widgets/leading_widget.dart';
import 'package:get/get.dart';

import '../widgets/listTile_widget.dart';

class MyRidesScreen extends StatelessWidget {
  const MyRidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TripDetailsController controller = Get.put(TripDetailsController());
    return Scaffold(
      backgroundColor: neumorphicDefaultTheme.baseColor,
      appBar: AppBar(
        leading: LeadingWidget(
          color: Colors.white,
        ),
        title: Text(
          "My Rides",
          style: titleStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: GetBuilder<TripDetailsController>(builder: (controller) {
        return FutureBuilder<List<dynamic>?>(
            future: controller.historyGetting(),
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if(snapshot.data == null){
                return
                Center(child: Text("No History"),);
              }

              List history = snapshot.data!;

              return ListView.builder(
            physics: ScrollPhysics(),
                itemCount: history.length,
                itemBuilder: (BuildContext context, int index) {
                  var historyDetails = history[index];
                  print(history[index]);

                  return ListileWidget(
                    title: historyDetails['location'],
                    date: historyDetails['date'],
                    amount: Text(
                      "₹200",
                      style: amountStyle,
                    ),
                  );
                },
              );
            });
      }),
    );
  }
}

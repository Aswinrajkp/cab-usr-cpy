import 'package:flutter/material.dart';
import 'package:cab_user/styles/my_rides_style.dart';
import 'package:cab_user/views/widgets/listTile_widget.dart';

class CompletedRidesScreen extends StatelessWidget {
  const CompletedRidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListileWidget(
            title: "From kochi to ernakulam",
            date: "27/2/22",
            amount: Text("₹200", style: amountStyle)),
        ListileWidget(
            title: "From kochi to ernakulam",
            date: "28/2/22",
            amount: Text("₹220", style: amountStyle)),
        ListileWidget(
            title: "From kochi to ernakulam",
            date: "29/2/22",
            amount: Text("₹300", style: amountStyle)),
      ],
    );
  }
}

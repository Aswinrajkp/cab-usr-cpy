import 'package:flutter/material.dart';
import 'package:cab_user/styles/my_rides_style.dart';
import 'package:cab_user/views/widgets/listTile_widget.dart';

class CancelledRidesScreen extends StatelessWidget {
  const CancelledRidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListileWidget(
          title: "From kochi to ernakulam",
          date: "27/2/22",
        ),
        ListileWidget(
          title: "From kochi to ernakulam",
          date: "28/2/22",
        ),
        ListileWidget(
          title: "From kochi to ernakulam",
          date: "29/2/22",
        ),
      ],
    );
  }
}

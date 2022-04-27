import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cab_user/styles/bottom_sheet_style.dart';
import 'package:cab_user/views/bottom_sheet/after_finding_vehicle.dart';
import 'package:cab_user/views/home/home.dart';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:cab_user/views/widgets/backbutton.dart';

class AfterSelectingVehicleScreen extends StatelessWidget {
  const AfterSelectingVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => MainScreen(
                            widget: AfterFindingVehicleScreen(),
                            height: .25,
                            leading: BackButtonWidget(),
                          )));
                },
                child:
                    Text("Finding Vehicle Just Wait", style: findingvehicle)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: NeumorphicProgressIndeterminate(),
          )
        ],
      ),
    );
  }
}

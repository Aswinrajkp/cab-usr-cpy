import 'package:cab_user/styles/bottom_sheet_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class FindingVehicleWidget extends StatelessWidget {
  const FindingVehicleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Finding Vehicle Just Wait", style: findingvehicle),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: NeumorphicProgressIndeterminate(),
              )
            ],
          );
  }
}
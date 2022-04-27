import 'package:flutter/material.dart';
import 'package:cab_user/styles/settings_style.dart';

class SettingsCardWidget extends StatelessWidget {
  Size size;
  final text;
  SettingsCardWidget({Key? key, required this.size, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
          width: size.width,
          height: size.height * .1,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: settingsCard,
              ))),
    );
  }
}

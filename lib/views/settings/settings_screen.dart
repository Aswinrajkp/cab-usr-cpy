import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cab_user/styles/settings_style.dart';
import 'package:cab_user/views/widgets/leading_widget.dart';
import 'package:cab_user/views/widgets/settings_card_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: neumorphicDefaultTheme.baseColor,
      floatingActionButton: Text("Version\n   0.0.1"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Settings", style: settingsTitle),
        leading: const LeadingWidget(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SettingsCardWidget(
                size: size,
                text: "Privacy & Policy",
              ),
              SettingsCardWidget(
                size: size,
                text: "About us",
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

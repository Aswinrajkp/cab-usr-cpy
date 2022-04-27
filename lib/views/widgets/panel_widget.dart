import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cab_user/views/bottom_sheet/searching.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatelessWidget {
  var widget;
  final ScrollController controller;
  final PanelController panelController;
  PanelWidget(
      {Key? key,
      required this.panelController,
      required this.controller,
      this.widget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: ListView(
        controller: controller,
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                height: 5,
                width: 100,
                decoration: BoxDecoration(color: Colors.grey.shade300),
              ),
            ),
          ),
          widget
        ],
      ),
    );
  }
}

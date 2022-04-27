import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class LeadingWidget extends StatelessWidget {
  final color;
  const LeadingWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () => ZoomDrawer.of(context)!.toggle(),
        icon: Icon(Icons.menu),
        color: color,
        iconSize: 30,
      );
}

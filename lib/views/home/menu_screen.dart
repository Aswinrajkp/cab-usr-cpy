import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cab_user/models/home_drawer/drawer_model.dart';

class MenuScreen extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuScreen({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: neumorphicDefaultTheme.baseColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...MenuItems.allItemsInDrawer.map(BuildMenuItem).toList(),
          ],
        ),
      ),
    );
  }

  BuildMenuItem(MenuItem item) => ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selectedTileColor: Colors.black54,
          selected: currentItem == item,
          minLeadingWidth: 20,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () => onSelectedItem(item),
        ),
      );
}

class MenuItems {
  static const profile = MenuItem("Profile", Icons.face);
  static const home = MenuItem("Home", Icons.home);
  static const trips = MenuItem("My Rides", Icons.wallet_giftcard);
  static const settings = MenuItem("Settings", Icons.settings);

  static const allItemsInDrawer = <MenuItem>[
    profile,
    home,
    trips,
    settings,
  ];
}

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cab_user/styles/bottom_sheet_style.dart';
import 'package:cab_user/styles/my_rides_style.dart';
import 'package:cab_user/styles/profile_style.dart';
import 'package:cab_user/views/bottom_sheet/after_selecting_vehicle.dart';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:cab_user/views/widgets/backbutton.dart';
import 'package:swipe/swipe.dart';

class ListileWidget extends StatelessWidget {
  String title = '';
  var func;
  var date;
  var amount;

  ListileWidget(
      {Key? key, required this.title, this.func, this.date, this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swipe(
      onSwipeLeft: () => ZoomDrawer.of(context)!.toggle(),
      onSwipeRight: () => ZoomDrawer.of(context)!.toggle(),
      child: Card(
        color: neumorphicDefaultTheme.baseColor,
        semanticContainer: false,
        elevation: 1.0,
        child: ListTile(
          title: Text(
            title,
            style: GoogleFonts.rubik(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
          ),
          subtitle: Text(date == null ? "" : date, style: dateStyle),
          trailing: amount == null
              ? Text(
                  "Canceled",
                  style: amountStyle,
                )
              : amount,
          onTap: () {
            func;
          },
        ),
      ),
    );
  }
}

// class VehicleShowinListitile extends StatelessWidget {
//   final image;
//   final title;
//   final money;
//   const VehicleShowinListitile({
//     Key? key,
//     required this.image,
//     required this.title,
//     required this.money,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () => Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (ctx) => MainScreen(
//                     widget: AfterSelectingVehicleScreen(),
//                     height: .18,
//                     leading: BackButtonWidget(),
//                   ))),
//       // onTap: (){
//       //   Get.off(MainScreen(widget: AfterSelectingVehicleScreen(), height: .18,leading: BackButtonWidget(),));
//       // },
//       leading: Image(image: NetworkImage(image)),
//       title: Text(title, style: vehicleShowingListtileStyle),
//       trailing: Text(
//         money,
//         style: vehicleShowingListtileStyle,
//       ),
//     );
//   }
// }

class ProfileListTileWidget extends StatelessWidget {
  final title;
  final trailing;
  const ProfileListTileWidget(
      {Key? key, required this.title, required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: profileListtile),
      trailing: Text(
        trailing,
        style: profileListtile,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

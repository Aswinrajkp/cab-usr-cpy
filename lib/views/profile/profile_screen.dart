import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cab_user/controller/home/home_controller.dart';
import 'package:cab_user/controller/profile_controller.dart';
import 'package:cab_user/styles/profile_style.dart';
import 'package:cab_user/views/widgets/leading_widget.dart';
import 'package:cab_user/views/widgets/listTile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: NeumorphicTheme.baseColor(context),
            appBar: AppBar(
              backgroundColor: Colors.black54,
              elevation: 0,
              leading: const LeadingWidget(
                color: Colors.white,
              ),
            ),
            body: Column(
              children: [
                Stack(
                  alignment: Alignment.center,

                  fit: StackFit.loose,
                  // overflow: Overflow.visible,
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        color: Colors.black54,
                      ),
                      height: size.height * .29,
                    ),
                    Positioned(
                        top: 20,
                        left: 20,
                        child: Text(
                          "My\nProfile",
                          style: myProfile,
                        )),
                    Positioned(
                        top: 135,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          color: NeumorphicTheme.baseColor(context),
                          elevation: 10,
                          child: Container(
                            height: size.height * .2,
                            width: size.width * .79,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * .06,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Aswinraj kp",
                                    style: profileTitle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        child: CircleAvatar(
                      radius: size.width * .17,
                      backgroundImage: NetworkImage(
                          "https://static.vecteezy.com/system/resources/thumbnails/002/275/847/small/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg"),
                    )),
                  ],
                ),
                SizedBox(
                  height: size.height * .10,
                ),
                GetBuilder<ProfileController>(builder: (controller) {
                  return NeumorphicButton(
                    pressed: false,
                    onPressed: () => controller.changeDetails(),
                    style: NeumorphicStyle(
                      // border: const NeumorphicBorder(
                      //     width: 1),
                      shape: NeumorphicShape.flat,
                      boxShape:
                          NeumorphicBoxShape.beveled(BorderRadius.circular(5)),
                    ),
                    child: controller.detailsShowing
                        ? Text(
                            "Ride Details",
                            style: GoogleFonts.josefinSans(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )
                        : Text(
                            "My Details",
                            style: GoogleFonts.josefinSans(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                  );
                }),
                SizedBox(
                  height: 5,
                ),
                GetBuilder<ProfileController>(builder: (controller) {
                  return SingleChildScrollView(
                      child: controller.detailsShowing
                          ? Column(
                              children: [
                                ProfileListTileWidget(
                                  title: "Mobile Number",
                                  trailing: "8129524358",
                                ),
                                ProfileListTileWidget(
                                    title: "Email Address",
                                    trailing: "aswinrajk37@gmail.com"),
                                ProfileListTileWidget(
                                    title: "Password", trailing: "*********"),
                                SizedBox(
                                  height: size.height * .10,
                                ),
                                NeumorphicButton(
                                  pressed: false,
                                  onPressed: () => controller.changeDetails(),
                                  style: NeumorphicStyle(
                                    border: const NeumorphicBorder(width: 1),
                                    shape: NeumorphicShape.flat,
                                    boxShape: NeumorphicBoxShape.beveled(
                                        BorderRadius.circular(5)),
                                  ),
                                  child: Text(
                                    "Edit Details",
                                    style: GoogleFonts.josefinSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                ProfileListTileWidget(
                                  title: "Total Expense",
                                  trailing: "₹ 2000",
                                ),
                                ProfileListTileWidget(
                                    title: "Total Trips", trailing: "15"),
                                ProfileListTileWidget(
                                    title: "Completed Trips", trailing: "10"),
                                ProfileListTileWidget(
                                    title: "Cancelled Trips", trailing: "5"),
                              ],
                            ));
                })
              ],
            )));
  }
}

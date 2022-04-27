import 'package:get/state_manager.dart';

class ProfileController extends GetxController {
  bool detailsShowing = true;

  changeDetails() {
    detailsShowing = !detailsShowing;
    update();
  }
}

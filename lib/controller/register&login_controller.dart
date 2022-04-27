import 'package:get/state_manager.dart';

class LoginRegisterController extends GetxController {
  bool alreadyRegister = false;
  bool alreadyLogin = false;
  registerSetting() {
    alreadyRegister = true;
    update();
  }

  loginSetting() {
    alreadyLogin = true;
    update();
  }

  falseState() {
    alreadyLogin = false;
    alreadyRegister = false;
    update();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class IdStoring{
static SharedPreferences? preferences;

  static Future init() async {
    preferences = await SharedPreferences.getInstance();
  }
  
  static Future setId(id) async {
   await preferences!.setString("id", id);
  }

  static Future getId() async {
    return  preferences!.getString("id");
  }
}
// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class UserType {
  void saveUserType(UserDef userType) async {
    var box = await SharedPreferences.getInstance();
    var success = await box.setString("userType", userType.name);
    if (!success) {
      print("Somethig went wrong");
    } else {
      print("Success");
    }
  }

  Future<UserDef?> getUserType() async {
    var box = await SharedPreferences.getInstance();
    var val = box.getString("userType");
    if (val != null) {
      return UserDef.values.byName(val);
    }
    return null;
  }
}

enum UserDef { MR, PD }

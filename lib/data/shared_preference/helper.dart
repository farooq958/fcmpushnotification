import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  //static String sharedPreferenceVerifyKey = "Verify";

  /// saving data to shared preference

  static Future<bool> saveVerificationIdSharedPreference(
      bool? verificationId, String sharedPreferenceVerifyKey) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPreferenceVerifyKey, verificationId!);
  }

  /// fetching data from shared preference

  static Future<bool> getUserEmailSharedPreference(
      String sharedPreferenceVerifyKey) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //debugPrint(preferences.getString(sharedPreferenceVerifyKey).toString());
    return preferences.getBool(sharedPreferenceVerifyKey) ?? false;
  }
}

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_preference/helper.dart';

class SubscribeControllerCubit extends Cubit<Map<String, bool>> {
  SubscribeControllerCubit()
      : super({"OnePlus": false, "Infinix": false, "Samsung": false});
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  checkSubscription() async {
    try {
      final pref = await SharedPreferences.getInstance();
      bool? samsung = pref.getBool("Samsung") ?? false;
      bool? oneplus = pref.getBool("OnePlus") ?? false;
      bool? Infinix = pref.getBool("Infinix") ?? false;
      Map<String, bool> Data = {
        'OnePlus': oneplus,
        'Samsung': samsung,
        'Infinix': Infinix
      };
      //await HelperFunctions.saveVerificationIdSharedPreference(true, topicName);
      //    print({topicName: true}.toString());
      emit(Data);
    } catch (e) {
      print('false');
    }
  }
}

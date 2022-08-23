import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';

import '../shared_preference/helper.dart';

class UnsubscribeControllerCubit extends Cubit<bool> {
  UnsubscribeControllerCubit() : super(true);
  late FirebaseMessaging messaging;
  unsubscribeFromTopic(topicName) {
    try {
      messaging.unsubscribeFromTopic(topicName);
      HelperFunctions.saveVerificationIdSharedPreference(true, topicName);
      emit(false);
    } catch (e) {
      emit(false);
    }
  }
}

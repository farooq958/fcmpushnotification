import 'package:fcmpushnotification/data/cubit/subscribe_controller_cubit.dart';
import 'package:fcmpushnotification/data/cubit/unsubscribe_controller_cubit.dart';
import 'package:fcmpushnotification/view/fcm_push_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('background message ${message.notification!.body}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SubscribeControllerCubit>(
          create: (context) => SubscribeControllerCubit(),
        ),
        BlocProvider<UnsubscribeControllerCubit>(
          create: (context) => UnsubscribeControllerCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.

          primarySwatch: Colors.blue,
        ),
        home: FcmPushNotifier(),
      ),
    );
  }
}

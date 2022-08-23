import 'package:fcmpushnotification/data/shared_preference/helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custoneshape.dart';
import '../data/cubit/subscribe_controller_cubit.dart';

class FcmPushNotifier extends StatefulWidget {
  FcmPushNotifier({Key? key}) : super(key: key);

  @override
  State<FcmPushNotifier> createState() => _FcmPushNotifierState();
}

class _FcmPushNotifierState extends State<FcmPushNotifier> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  bool OnePlus = false;
  bool Infinix = false;
  bool Samsung = false;

  // @override
  // void initState() {
  //   super.initState();
  //   context.read<SubscribeControllerCubit>().checkSubscription();
  //   messaging = FirebaseMessaging.instance;
  //   messaging.getToken().then((value) {
  //     print(value);
  //   });
  //
  //   FirebaseMessaging.onMessage.listen((RemoteMessage event) {
  //     print("message recieved");
  //     print(event.notification!.body);
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: const Text("Notification"),
  //             content: Text(event.notification!.body!),
  //             actions: [
  //               TextButton(
  //                 child: const Text("Ok"),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               )
  //             ],
  //           );
  //         });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double WIDTH = 600;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Fcm Practice")),
      ),

      body: SizedBox(
        height: 500,
        width: 400,
        child: BlocBuilder<SubscribeControllerCubit, Map<String, bool>>(
          builder: (context, state) {
            print(state["OnePlus"]);
            return Column(
              children: [
                const Center(
                    child: Text('List Of Topics ',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      'One Plus ',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      color:
                          state['OnePlus'] as bool ? Colors.grey : Colors.red,
                      onPressed: () async {
                        if (state['OnePlus'] as bool) {
                          context
                              .read<SubscribeControllerCubit>()
                              .checkSubscription();
                          messaging.subscribeToTopic('OnePlus');
                          HelperFunctions.saveVerificationIdSharedPreference(
                              true, 'OnePlus');
                        } else {
                          messaging.unsubscribeFromTopic('OnePlus');
                          HelperFunctions.saveVerificationIdSharedPreference(
                              false, 'OnePlus');
                        }

                        print(state);
                        // OnePlus = state;
                        print(state);
                        //   setState(() {});
                      },
                      child: state['OnePlus'] as bool
                          ? const Text('Unsubscribe')
                          : Text('Subscribe'),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      'Infinix     ',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      color:
                          state['Infinix'] as bool ? Colors.grey : Colors.red,
                      onPressed: () async {
                        context
                            .read<SubscribeControllerCubit>()
                            .checkSubscription();
                        await messaging.subscribeToTopic('Infinix');
                        HelperFunctions.saveVerificationIdSharedPreference(
                            true, 'Infinix');
                        //Infinix = state;
                        // setState(() {});
                      },
                      child: state['Infinix'] as bool
                          ? const Text('Unsubscribe')
                          : const Text('Subscribe'),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      'Samsung',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      color:
                          state['Samsung'] as bool ? Colors.grey : Colors.red,
                      onPressed: () async {
                        context
                            .read<SubscribeControllerCubit>()
                            .checkSubscription();
                        await messaging.subscribeToTopic('Samsung');
                        HelperFunctions.saveVerificationIdSharedPreference(
                            true, 'Samsung');
                        //   Samsung = state;
                      },
                      child: state['Samsung'] as bool
                          ? const Text('Unsubscribe')
                          : const Text('Subscribe'),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
      // body: Center(
      //   child: CustomPaint(
      //     size: Size(
      //         WIDTH,
      //         (WIDTH * 0.625)
      //             .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      //     painter: RPSCustomPainter(),
      //   ),
      // ),
    );
  }

  bool checksubscribe(List<Map<String, bool>> state, String Key) {
    for (var map in state) {
      if (map.containsValue(true) && map.containsKey(Key)) {
        return true;
      }
    }
    return false;
  }
}

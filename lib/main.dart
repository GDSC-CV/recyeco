import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/screen/wrapper.dart';
import 'package:recycle_app/service/auth.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  /*
  final fcmToken = await FirebaseMessaging.instance.getToken();
  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    // TODO: If necessary send token to application server.

    // Note: This callback is fired at each app startup and whenever a new
    // token is generated.
  }).onError((err) {
    // Error getting token.
  });
  */
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().user,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
    /*
    return MaterialApp(
      title: 'Recycle',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Wrapper(),
      debugShowCheckedModeBanner: false,
    );*/
  }
}

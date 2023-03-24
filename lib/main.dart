import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/screen/wrapper.dart';
import 'package:recycle_app/service/auth.dart';
import 'firebase_options.dart';
import 'package:recycle_app/service/notify.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupNotification();
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

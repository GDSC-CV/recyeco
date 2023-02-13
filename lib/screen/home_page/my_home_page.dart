import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/screen/camera/take_picture_screen.dart';
import 'package:recycle_app/screen/home_page/setting_page.dart';
import 'package:recycle_app/screen/home_page/userinfo_widget.dart';
import 'package:recycle_app/service/auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthService _auth = AuthService();

  void pushToCamera(BuildContext context) async {
    final cameras = await availableCameras();
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakePictureScreen(camera: cameras.first),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Take a photo',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushToCamera(context);
        },
        tooltip: 'Take a photo',
        child: const Icon(Icons.camera_alt_rounded),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const userInfo_widget(),
            ListTile(
              title: const Text('User setting'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Provider(
                      create: (context) => userData,
                      builder: (context, child) => Setting_page(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: ElevatedButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.grey[50],
                ),
                child: const Text('log out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:recycle_app/screen/camera/take_picture_screen.dart';
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
            const UserAccountsDrawerHeader(
              //todo
              accountName: Text('User Name'),
              accountEmail: Text('mail@example.com'),
              currentAccountPicture: CircleAvatar(
                child: FlutterLogo(size: 42.0),
              ),
            ),
            ListTile(
              title: const Text('page1'),
              leading: const Icon(Icons.favorite),
              onTap: () {},
            ),
            SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async{
                  await _auth.signOut();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.grey[50],
                ),
                child: Text(
                  'logout'
                ),
              ),
          ],
        ),
      ),
    );
  }
}
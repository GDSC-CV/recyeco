import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:recyeco/models/myuser.dart';
import 'package:recyeco/screen/camera/display_picture_screen.dart';
import 'package:recyeco/service/classifier.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recyeco/tools/experience_system.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
  });

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  //for classifier
  late ClassifierService _classifier;
  late Future _initializeClassifierFuture;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _classifier = ClassifierService();
    _initializeClassifierFuture = _classifier.initialize();
  }

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Take a photo from gallery or camera.',
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Semantics(
            child: FloatingActionButton(
              onPressed: () async {
                try {
                  await _initializeClassifierFuture;

                  final XFile? image = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );

                  var imageBytes = await image!.readAsBytes();
                  img.Image imageInput = img.decodeImage(imageBytes)!;
                  var pred = _classifier.predict(imageInput);
                  if (pred.label != "Other" && pred.score > 0.8)
                    await Experience.userGainExp(userData, 13);

                  if (!mounted) return;

                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(
                        imagePath: image.path,
                        category: pred,
                      ),
                    ),
                  );
                } catch (e) {
                  print(e);
                }
              },
              heroTag: 'image0',
              tooltip: 'Pick Image from gallery',
              child: const Icon(Icons.photo),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () async {
                try {
                  await _initializeClassifierFuture;

                  final XFile? image = await _picker.pickImage(
                    source: ImageSource.camera,
                  );

                  var imageBytes = await image!.readAsBytes();
                  img.Image imageInput = img.decodeImage(imageBytes)!;
                  var pred = _classifier.predict(imageInput);
                  if (pred.label != "Other" && pred.score > 0.8)
                    await Experience.userGainExp(userData, 13);

                  if (!mounted) return;

                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(
                        imagePath: image.path,
                        category: pred,
                      ),
                    ),
                  );
                } catch (e) {
                  print(e);
                }
              },
              heroTag: 'image1',
              tooltip: 'Take a Photo',
              child: const Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
    );
  }
}

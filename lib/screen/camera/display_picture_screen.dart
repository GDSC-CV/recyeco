import 'package:flutter/material.dart';
import 'dart:io';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final String category;

  const DisplayPictureScreen(
      {super.key, required this.imagePath, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      //     body: Image.file(File(imagePath)),
      body: Column(children: [
        Center(
          child: Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 1.6),
            child: Image.file(File(imagePath)),
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        Text(
          category,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ]),
    );
  }
}

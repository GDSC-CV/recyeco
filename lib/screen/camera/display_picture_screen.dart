import 'package:flutter/material.dart';
import 'dart:io';

import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final Category category;

  const DisplayPictureScreen({
    super.key,
    required this.imagePath,
    required this.category,
  });

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
          category.label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Confidence: ${category.score.toStringAsFixed(3)}',
          style: const TextStyle(fontSize: 16),
        ),
      ]),
    );
  }
}

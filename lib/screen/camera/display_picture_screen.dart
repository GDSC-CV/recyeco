import 'package:flutter/material.dart';
import 'dart:io';

import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:image/image.dart' as img;

import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          //onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100,
                        height: 93.4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                  width: 328.1,
                                  height: 100,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  alignment: AlignmentDirectional(0, -1),
                                  child: GradientText(
                                    'Recyeco',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Playfair Display',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 60,
                                    ),
                                    colors: [
                                      Color(0xFF4A38F2),
                                      Color(0xFF3CDAC7)
                                    ],
                                    gradientDirection: GradientDirection.ltr,
                                    gradientType: GradientType.linear,
                                  )),
                            ),
                            Divider(
                              thickness: 2,
                              indent: 60,
                              endIndent: 60,
                              color: Color(0xFF090347),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Your Photo',
                style: GoogleFonts.getFont(
                  'Playfair Display',
                  color: Color(0xFF090347),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Container(
                        width: 100,
                        height: 363.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                          shape: BoxShape.rectangle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(File(imagePath)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                category.label,
                style: GoogleFonts.getFont(
                  'Playfair Display',
                  color: Color(0xFF090347),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: InkWell(
                      onTap: () async {},
                      child: Container(
                        width: 141,
                        height: 62.3,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF4A38F2), Color(0xFF3CDAC7)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(0, -1),
                            end: AlignmentDirectional(0, 1),
                          ),
                          borderRadius: BorderRadius.circular(60),
                          shape: BoxShape.rectangle,
                        ),
                        child: Icon(
                          Icons.replay_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context, true);
                      },
                      child: Container(
                        width: 141,
                        height: 62.3,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF4A38F2), Color(0xFF3CDAC7)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(0, -1),
                            end: AlignmentDirectional(0, 1),
                          ),
                          borderRadius: BorderRadius.circular(60),
                          shape: BoxShape.rectangle,
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

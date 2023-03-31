import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/screen/home_page/friend_page.dart';
import 'package:recycle_app/screen/home_page/setting_page.dart';
import 'package:recycle_app/service/auth.dart';
import 'package:recycle_app/tools/friend_system.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:image/image.dart' as img;
import 'package:recycle_app/screen/camera/display_picture_screen.dart';
import 'package:recycle_app/service/classifier.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/tools/experience_system.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key}) : super(key: key);

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  final AuthService _auth = AuthService();
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 379.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 287.1,
                            height: 67,
                            decoration: BoxDecoration(color: Colors.white),
                            alignment: AlignmentDirectional(0, 1),
                            child: Text(
                              'welcome to',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont(
                                'Playfair Display',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ).animate().fadeIn(duration: Duration(milliseconds: 500)).slideY(),
                          ),
                          Expanded(
                            child: Container(
                              width: 328.1,
                              height: 100,
                              decoration: BoxDecoration(color: Colors.white),
                              child: GradientText(
                                'Recyeco',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Playfair Display',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 60,
                                ),
                                colors: [Color(0xFF4A38F2), Color(0xFF3CDAC7)],
                                gradientDirection: GradientDirection.ltr,
                                gradientType: GradientType.linear,
                              ).animate().fadeIn(duration: Duration(milliseconds: 500)).slideY(),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 328.1,
                              height: 100,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Image.asset(
                                'assets/images/recycle.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ).animate().scale(duration: Duration(milliseconds: 500)).rotate(duration: Duration(milliseconds: 500)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: InkWell(
                        onTap: () async {
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

                            Navigator.of(context).push(
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
                        child: Container(
                          width: 179.8,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF3CDAC7), Color(0xFF4A38F2)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(1, -0.5),
                              end: AlignmentDirectional(-1, 0.5),
                            ),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Icon(
                            // borderColor: Colors.transparent,
                            // borderRadius: 30,
                            // borderWidth: 1,
                            // buttonSize: 80,

                            Icons.photo_camera_outlined,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: Container(
                        width: 299,
                        height: 99.7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Take a Photo',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Playfair Display',
                            color: Color(0xFF090347),
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).animate().shimmer(),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Container(
                        width: 299,
                        height: 99.7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Choose One',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Playfair Display',
                            color: Color(0xFF090347),
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: InkWell(
                        onTap: () async {
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

                            Navigator.of(context).push(
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
                        child: Container(
                          width: 179.8,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF3CDAC7), Color(0xFF4A38F2)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(1, -0.5),
                              end: AlignmentDirectional(-1, 0.5),
                            ),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Icon(
                            Icons.photo_outlined,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).animate().shimmer(),
              Container(
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  color: Color(0x00EEEEEE),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Material(
                          color: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Color(0x1A57636C),
                                  offset: Offset(0, -10),
                                  spreadRadius: 0.1,
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        IconButton(
                          // borderColor: Color(0x00F1F4F8),
                          // borderRadius: 30,
                          // borderWidth: 1,
                          // buttonSize: 60,
                          icon: Icon(
                            Icons.home_outlined,
                            color: Color(0xFF090347),
                            size: 35,
                          ),
                          onPressed: () {
                            // print('IconButton pressed ...');
                          },
                        ),
                        IconButton(
                          // borderColor: Colors.transparent,
                          // borderRadius: 30,
                          // borderWidth: 1,
                          // buttonSize: 60,
                          icon: Icon(
                            Icons.people_outline,
                            color: Color(0xFF090347),
                            size: 35,
                          ),
                          onPressed: () async {
                            await FriendSystem.updateFriend(userData);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => Provider(
                                  create: (context) => userData,
                                  builder: (context, child) =>
                                      const FriendWidget(),
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          // borderColor: Colors.transparent,
                          // borderRadius: 30,
                          // borderWidth: 1,
                          // buttonSize: 60,
                          icon: Icon(
                            Icons.format_list_bulleted,
                            color: Color(0xFF090347),
                            size: 35,
                          ),
                          onPressed: () async {
                            // context.pushNamed('Article');
                          },
                        ),
                        IconButton(
                          // borderColor: Colors.transparent,
                          // borderRadius: 30,
                          // borderWidth: 1,
                          // buttonSize: 60,
                          icon: Icon(
                            Icons.settings_outlined,
                            color: Color(0xFF090347),
                            size: 35,
                          ),
                          onPressed: () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => Provider(
                                  create: (context) => userData,
                                  builder: (context, child) =>
                                      const SettingWidget(),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

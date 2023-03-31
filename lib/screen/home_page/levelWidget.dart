import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/tools/experience_system.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


class LevelWidget extends StatefulWidget {
  const LevelWidget({Key? key}) : super(key: key);

  @override
  _LevelWidgetState createState() => _LevelWidgetState();
}

class _LevelWidgetState extends State<LevelWidget>{

  

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context,listen: true);
    final userRemainexp = Experience.calculate_LastExperience(userData.experiences);
    final expPersent = userRemainexp/10;
    
    
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(),
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
                                decoration: BoxDecoration(
                                  color: Colors.white
                                ),
                                alignment: AlignmentDirectional(0, -1),
                                child: GradientText(
                                  'Level',
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
                                ),
                              ),
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
                        child: CircularPercentIndicator(
                          percent: expPersent,
                          radius: 150,
                          lineWidth: 60,
                          animation: true,
                          progressColor: Color(0xFF5533C1),
                          backgroundColor: Color(0xFFDAF7FD),
                          center: Text(
                            userData.level.toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Lato',
                              color: Color(0xFF12087C),
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          startAngle: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await Future.delayed(
                            const Duration(milliseconds: 1000));
                      },
                      child: Container(
                        width: 141,
                        height: 62.3,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF4A38F2),
                              Color(0xFF3CDAC7)
                            ],
                            stops: [0, 1],
                            begin: AlignmentDirectional(0, -1),
                            end: AlignmentDirectional(0, 1),
                          ),
                          borderRadius: BorderRadius.circular(60),
                          shape: BoxShape.rectangle,
                        ),
                        child: Icon(
                          Icons.share_sharp,
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
                    // borderColor: Colors.transparent,
                    // borderRadius: 30,
                    // borderWidth: 1,
                    // buttonSize: 60,
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                      //context.safePop();
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

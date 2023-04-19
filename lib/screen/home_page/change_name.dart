import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recyeco/service/auth.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:recyeco/models/myuser.dart';
import 'package:recyeco/service/database.dart';
import 'package:recyeco/tools/constants.dart';

class ChangeName_page extends StatefulWidget {
  const ChangeName_page({super.key});

  @override
  State<ChangeName_page> createState() => _ChangeName_pageState();
}

class _ChangeName_pageState extends State<ChangeName_page> {
  final _formKey = GlobalKey<FormState>();
  String _currentName = "";

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
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
                                        'User Name',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                          'Playfair Display',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 60,
                                        ),
                                        colors: [
                                          Color(0xFF6420AB),
                                          Color(0xFF3CDAC7)
                                        ],
                                        gradientDirection:
                                            GradientDirection.ltr,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100,
                            height: 39.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Enter your new user name',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Playfair Display',
                        color: Color(0xFF6420AB),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                      child: TextFormField(
                        initialValue: userData.name,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'New Name',
                          hintStyle: GoogleFonts.getFont(
                            'Playfair Display',
                            color: Color(0xFF635454),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF663BEE),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: GoogleFonts.getFont(
                          'Playfair Display',
                          color: Colors.black,
                        ),
                        validator: (val) =>
                            val!.isEmpty ? 'Please enter a name' : null,
                        onChanged: (val) => setState(() => _currentName = val),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_currentName.isNotEmpty) {
                              await DatabaseService(uid: userData.uid)
                                  .updateUserDataInfo(
                                _currentName,
                                userData.level,
                                userData.experiences,
                              );

                              Navigator.pop(context, _currentName);
                            }
                          }
                        },
                        child: Container(
                          width: 141,
                          height: 62.3,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF6420AB), Color(0xFF3CDAC7)],
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
              ),
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
                    Navigator.pop(context, "");
                  },
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:recyeco/screen/authenticate/forget_password.dart';
import 'package:recyeco/screen/loading.dart';
import 'package:recyeco/tools/constants.dart';
import 'package:recyeco/service/auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SignIn extends StatefulWidget {
  //const SignIn({super.key});

  final Function toggle;
  SignIn({required this.toggle});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(),
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(50, 50, 50, 50),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 50, 0, 0),
                                  child: Container(
                                      width: 100,
                                      height: 99.7,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: GradientText(
                                        'Sign In',
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
                                        gradientDirection:
                                            GradientDirection.ltr,
                                        gradientType: GradientType.linear,
                                      )
                                          .animate()
                                          .fade(
                                              duration:
                                                  Duration(milliseconds: 500))
                                          .slideX(
                                              duration:
                                                  Duration(milliseconds: 500))),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Color(0xFF090347),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 85.3,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 30, 10, 10),
                                  child: TextFormField(
                                    //controller: _model.textController1,
                                    autofocus: true,
                                    obscureText: false,
                                    onChanged: ((value) {
                                      email = value;
                                    }),
                                    decoration: InputDecoration(
                                      hintText: 'account',
                                      hintStyle: GoogleFonts.getFont(
                                        'Playfair Display',
                                        color: Color(0xFF8C7777),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF090347),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF4A38F2),
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
                                    validator: (value) => value!.isEmpty
                                        ? 'Enter an email'
                                        : null,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                      child: TextFormField(
                                        //controller: _model.textController2,
                                        autofocus: true,
                                        obscureText: true,
                                        onChanged: ((value) {
                                          password = value;
                                        }),
                                        decoration: InputDecoration(
                                          hintText: 'password',
                                          hintStyle: GoogleFonts.getFont(
                                            'Playfair Display',
                                            color: Color(0xFF8C7777),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF090347),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF4A38F2),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Playfair Display',
                                          color: Colors.black,
                                        ),
                                        validator: (value) => value!.length < 6
                                            ? 'Enter more than 6 chars'
                                            : null,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.login_rounded,
                                      color: Color(0xFF090347),
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      if (_formkey.currentState!.validate()) {
                                        setState(() {
                                          loading = true;
                                        });
                                        dynamic result = await _auth
                                            .signInwithEmailandPassword(
                                                email, password);
                                        if (result == null) {
                                          setState(() {
                                            error = 'could not sign in';
                                            loading = false;
                                          });
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 20, 10),
                                child: InkWell(
                                  onTap: () async {
                                    widget.toggle();
                                  },
                                  child: Text(
                                    error,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                        'Playfair Display',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 160, 21, 220)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      widget.toggle();
                                    },
                                    child: Text(
                                      'sign up',
                                      style: GoogleFonts.getFont(
                                        'Playfair Display',
                                        color: Color(0xFF090347),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      dynamic result = await _auth.signInAnon();
                                      if (result == null) {
                                        setState(() {
                                          loading = false;
                                          error = 'could not sign in';
                                        });
                                      }
                                    },
                                    child: Text(
                                      'log in as guest',
                                      style: GoogleFonts.getFont(
                                        'Playfair Display',
                                        color: Color(0xFF090347),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          );
  }
}

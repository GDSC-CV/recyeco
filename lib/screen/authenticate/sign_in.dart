// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/screen/authenticate/forget_password.dart';
import 'package:recycle_app/screen/loading.dart';
import 'package:recycle_app/tools/constants.dart';
import 'package:recycle_app/service/auth.dart';

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
            key: _formkey,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: GestureDetector(
                //onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50, 50, 50, 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                              child: Container(
                                width: 100,
                                height: 99.7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    'Sign In',
                                    style: GoogleFonts.getFont(
                                      'Playfair Display',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 10),
                        child: TextFormField(
                          //controller: _model.textController1,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'account',
                            hintStyle: GoogleFonts.getFont(
                              'Playfair Display',
                              color: Color(0xFF8C7777),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFB99D9D),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
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
                          validator: (value) =>
                              value!.isEmpty ? 'Enter an email' : null,
                          onChanged: ((value) {
                            email = value;
                          }),
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
                                decoration: InputDecoration(
                                  hintText: 'password',
                                  hintStyle: GoogleFonts.getFont(
                                    'Playfair Display',
                                    color: Color(0xFFB99D9D),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF8C7777),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
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
                                validator: (value) => value!.length < 6
                                    ? 'Enter more than 6 chars'
                                    : null,
                                onChanged: ((value) {
                                  password = value;
                                }),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.login_rounded,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () async {
                              {
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result =
                                      await _auth.signInwithEmailandPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      error = 'could not sign in';
                                      loading = false;
                                    });
                                  }
                                }
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: InkWell(
                              onTap: () async {
                                widget.toggle();
                              },
                              child: Text(
                                error,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont('Playfair Display',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: InkWell(
                              onTap: () async {
                                widget.toggle();
                              },
                              child: Text(
                                'sign up',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Playfair Display',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Playfair Display',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

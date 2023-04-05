import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recyeco/service/auth.dart';
import 'package:recyeco/tools/constants.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final AuthService _auth = AuthService();
  String email = '';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text('Change Password'),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                Text(
                  "Enter your email and we will send a password reset link.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: inputTextDecoration.copyWith(hintText: 'Email'),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter an email' : null,
                  onChanged: ((value) {
                    email = value;
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      try {
                        await _auth.resetPassword(email);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Check your email!"),
                              );
                            });
                      } on FirebaseAuthException catch (e) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(e.message.toString()),
                              );
                            });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.grey[50],
                  ),
                  child: Text('Reset Password'),
                ),
              ],
            )),
      ),
    );
  }
}

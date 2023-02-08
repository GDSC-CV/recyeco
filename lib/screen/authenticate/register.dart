// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recycle_app/screen/loading.dart';
import 'package:recycle_app/tools/constants.dart';
import 'package:recycle_app/service/auth.dart';

class Register extends StatefulWidget {
  
  final Function toggle;
  Register({required this.toggle});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading?Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Register'),
        elevation: 0,
        actions: [
          TextButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'log in',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              widget.toggle();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 50),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                decoration: inputTextDecoration.copyWith(hintText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Enter an email':null,
                onChanged: ((value) {
                  email = value;
                }),
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: inputTextDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (value) => value!.length<6 ? 'Enter more than 6 chars':null,
                onChanged: ((value) {
                  password=value;
                }),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async{
                  setState(() {
                    loading = true;
                  });
                  if(_formkey.currentState!.validate()){
                    dynamic result = await _auth.registerwithEmailandPassword(email, password);
                    if(result==null){
                      setState(() {
                        loading = false;
                        error = 'please enter a valid email';
                      });
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.grey[50],
                ),
                child: Text(
                  'register'
                ),
              ),
              SizedBox(height: 20),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

const inputTextDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  
  enabledBorder: OutlineInputBorder(
    
    borderSide: BorderSide(
      color: Colors.white,
      width: 2,
      
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.amber,
      width: 2,
    )
  )
);
import 'package:flutter/material.dart';

const textdecoratorinput = InputDecoration(
    hintText: 'Email',
    // the fillcolour defines the backgrounf=d colour
    fillColor: Colors.white,
    filled: true,
    //next to dress the borders
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink, width: 2.0)));

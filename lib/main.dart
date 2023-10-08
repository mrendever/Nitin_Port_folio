import 'package:climato/getData/getinfo.dart';
import 'package:climato/pages/home.dart';
import 'package:climato/pages/loading.dart';
import 'package:climato/pages/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => Location(),
      "/loading" : (context) => get_info(),
    },
  ));
}

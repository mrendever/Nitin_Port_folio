import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Location"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, "/home");
          }, icon: Icon(Icons.home))
        ],),

      body: Container(
        decoration: BoxDecoration(
            color: Colors.lightBlue.shade700
        ),
      ),
    );
  }
}

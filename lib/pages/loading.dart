import 'dart:core';

import 'package:climato/getData/get_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import '../getData/get_data.dart';

class Loading extends StatefulWidget {
   @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late String temperature ;
  late String humidity;
  late String air_speed;
  late String weather;
  late String main;
  late String icon ;
  late String city = "indore";


  void startApp(String city) async
  {
    worker instance = worker(location: city);
    await instance.getData();
   temperature = instance.temp;
   humidity = instance.humidity;
   air_speed = instance.windspeed;
   weather = instance.weather;
   main = instance.main;
   icon = instance.icon;



   Future.delayed(Duration(seconds: 1),(){
   Navigator.pushReplacementNamed(context, "/home",arguments: {
   "Temp_value": temperature,
   "Hum_value" : humidity,
   "air_speed_value": air_speed,
   "weather_value" : weather,
   "main_value" : main,
   "icon_value" : icon,
     "city_value": city,
   }
   );
   });
  }


  @override
  void initState(){



  }

  @override
  Widget build(BuildContext context) {

    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if(search?.isNotEmpty ?? false) // ignore: invalid_null_aware_operator
      {
        city = search!["searchText"];

      }
    startApp(city);


    return Scaffold(


      body: SingleChildScrollView(
        child: Container(height: 800,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff19A7CE),Color(0xffF5EBE0)
               // Color(0xffFFD9C0),Color(0xffCCEEBC)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 190,),
                Image.asset("assests/images/climato.png"),
                Text("By Nitin Yadav",style: TextStyle(color: Colors.blue,fontSize: 20),),
                SizedBox(height: 10,),

            SpinKitWave(
              color: Colors.blue.withOpacity(0.9),
              size: 60.0,itemCount: 5,type: SpinKitWaveType.start,

            )
              ],
            ),
          ),
        ),
      )
    );
  }
}

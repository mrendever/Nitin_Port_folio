import 'dart:core';

import 'package:climato/getData/get_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class get_info extends StatefulWidget {
  @override
  State<get_info> createState() => get_infoState();
}

class get_infoState extends State<get_info> {

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
        body: Container(
          height: 900,
          decoration: BoxDecoration(

              gradient: LinearGradient(
                  colors: [Color(0xff19A7CE),Color(0xffF5EBE0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          child: Center(
            child: SpinKitCircle(
              color: Colors.blue.withOpacity(0.9),
              size: 50,


            ),
          ),
        ),
    );



  }
}

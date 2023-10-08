
import 'dart:math';

import 'package:dynamic_weather_icons/dynamic_weather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../getData/get_data.dart';




class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var Csearch =TextEditingController();



  @override
  Widget build(BuildContext context) {

    //--------------------------------------------------

    Map info = ModalRoute.of(context)!.settings.arguments as Map ;
    String temp = ((info["Temp_value"]).toString()).substring(0,4);
    String icon = info['icon_value'].toString();
    String city = info["city_value"].toString();
    String hum = info["Hum_value"].toString();
    String airspeed = (info["air_speed_value"].toString()).substring(0,4);
    String weather = info["weather_value"].toString();

//--------------------------------------------------------------------

    var cityname = ["Delhi","Mumbai","Indore","Bhopal","Ujjain","Chennai","London"];
    final _random = new Random();
    var R_city = cityname[_random.nextInt(cityname.length)];

    return Scaffold(
     
     body: SafeArea(top: false,
       child: SingleChildScrollView(
         child: Container(
           height: 900,
           decoration: BoxDecoration(

           gradient: LinearGradient(
             colors: [Color(0xff19A7CE),Color(0xffF5EBE0)],
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter
           )
         ),
           child: Column(
             children: [
               SizedBox(height: 50,),
               Container( // search container
                 padding: EdgeInsets.symmetric(horizontal: 0),
                 margin: EdgeInsets.symmetric(vertical: 14,horizontal: 14),
                 decoration: BoxDecoration(
                   color: Color(0xffC4DFDF).withOpacity(0.5),
                   borderRadius: BorderRadius.circular(37)
                   ),
                 child : Row(
                   children: [
                     SizedBox(width: 20,),
                     Expanded(
                       child: TextField(
                         controller: Csearch ,
                         decoration: InputDecoration(
                           hintText: "Search $R_city",
                           hintStyle: TextStyle(
                             fontSize: 20,fontWeight: FontWeight.w900
                           ),
                           border: InputBorder.none
                         ),
                       ),
                     ),
                     GestureDetector(
                       child: Icon(CupertinoIcons.search,size: 30,),
                       onTap: (){
                         if((Csearch.text).replaceAll(" ","") == ""){
                           print("No search");
                         }else{
                           Navigator.pushNamed(context, "/loading",arguments: {
                             "searchText" : Csearch.text
                           }
                           );
                         }

                       },
                     ),
                     SizedBox(width: 30,)
                   ],
                 ),
               ),

               Row( // First container for city
                 children: [
                   Expanded(
                     child: Container(
                       padding: EdgeInsets.all(16),
                       margin: EdgeInsets.symmetric(
                           horizontal: 12,vertical: 1),
                       decoration: BoxDecoration(
                         color: Color(0xffBAD7E9),
                         borderRadius: BorderRadius.circular(37)
                       ),
                       child: Row(
                         children: [
                           Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                           SizedBox(width: 10,),
                           Column(
                             children: [
                               Row(
                                 children: [
                                   Text("$weather",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                   Text(" in",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                 ],
                               ),
                               Text("$city",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))
                             ],
                           )
                         ],
                       )

                     ),
                   ),
                 ],
               ),
               // 2nd container for temperature
               Row(
                 children: [
                   Expanded(
                       child: Container(height: 200,
                         padding: EdgeInsets.all(26),
                         margin: EdgeInsets.symmetric(
                             horizontal: 12,vertical: 12),
                         decoration: BoxDecoration(
                           color: Color(0xff8dd2e3),
                             borderRadius: BorderRadius.circular(37),

                         ),
                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Icon(Icons.thermostat_outlined,size: 30,),
                             Row(mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                               Text("$temp",style: TextStyle(fontSize: 90),),
                               Text("C",style: TextStyle(fontSize: 30))
                             ],)
                           ],
                         )

                       )),
                 ],
               ),
                // 3rd container
               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Expanded(
                     child: Container(height: 200,
                       padding: EdgeInsets.all(26),
                       margin: EdgeInsets.symmetric(
                           horizontal: 12,vertical: 12),
                       decoration: BoxDecoration(
                         color: Color(0xff8dd2e3),
                           borderRadius: BorderRadius.circular(17)

                       ),
                       child: Column(
                         children: [
                           Row(mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Icon(WeatherIcon.getIcon("wi-day-windy"))
                             ],
                           ),
                           SizedBox(height: 15,),
                           Text("$airspeed",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                           Text("Km/h",style: TextStyle(fontSize: 20,))

                         ],
                       )

                     ),
                   ),
                   Expanded(
                     child: Container(
                       height: 200,
                       padding: EdgeInsets.all(26),
                       margin: EdgeInsets.symmetric(
                           horizontal: 12,vertical: 12),
                       decoration: BoxDecoration(
                         color: Color(0xff8dd2e3),
                           borderRadius: BorderRadius.circular(17)

                       ),
                       child:Column(
                         children: [
                           Row(mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Icon(WeatherIcon.getIcon("wi-humidity"))
                             ],
                           ),
                           SizedBox(height: 15,),
                           Text("$hum",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                           Text("%",style: TextStyle(fontSize: 20,))

                         ],
                       )
                     ),
                   ),
                 ],
               ),
               SizedBox(height: 20,),
               Text("Made by Nitin"),
               Text("Data Provided By OpenWeather.org")

             ],
           ),
         ),
       ),
     ),
    );
  }
}

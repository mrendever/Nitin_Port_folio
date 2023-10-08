import 'dart:convert';
import 'package:http/http.dart' as http;
// here we get data from the api
class worker {

  // making constructrer for location
  late String location ;
  worker({required this.location})
  {
    location = this.location;
  }

  late String temp ;
  late String humidity ;
  late String windspeed ;
  late String main ;
  late String weather;
  late String icon;


  // method

   Future <void> getData()
  async{
     // creating try
    try{
      final Url =  Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=d7da5c2437c28622f06c30a3ad94a66c&units=metric" );
      final response = await http.get(Url);
      Map data = jsonDecode(response.body);
      // for temperature
      Map tempData = data['main'];
      double gettemp = tempData["temp"];
      String gethumidity = tempData["humidity"].toString();


      //for weather
      List weather_Data = data['weather'];
      Map weather_Main_Data = weather_Data[0];

      // weather  deatail
      String get_main_des = weather_Main_Data['main'];
      String getweather = weather_Main_Data['description'];

      // wind details
      Map wind = data['wind'];
      double getwind_speed = wind["speed"]/0.27777777;

      //-----------------------------------
      ///-----------------------------------
        icon = weather_Main_Data["icon"].toString();

      // assigning values

      temp  = gettemp.toString() ;
      humidity = gethumidity;
      windspeed = getwind_speed.toString();
      weather = getweather.toString();
      main = get_main_des.toString();


    }catch(e)
    {
      temp  = "NA" ;
      humidity = "NA";
      windspeed = "NA";
      weather = "NA";
      main = "NA";
      icon = "50n";
    }
    // get  data


  }
}

worker instance = worker(location: "Mumbai");


import 'dart:convert';

import 'package:weatherforecast/api/api.dart';
import 'package:weatherforecast/models/current_weather_data.dart';
import 'package:weatherforecast/models/weather_data.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI{
  WeatherData? weatherData ;

  Future<WeatherData>processData(lat,long)async{
    var response = await http.get(Uri.parse(apiURL(lat, long)));
    var jsonString = jsonDecode(response.body);
    WeatherData weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
    return weatherData ;
  }

}


String apiURL(var lat, var long){
  String url ;
  url ="https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&exclude=minutely&appid=$apikey&units=metric";
  return url ;
}
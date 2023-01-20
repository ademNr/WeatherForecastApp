import 'package:weatherforecast/models/current_weather_data.dart';

class WeatherData{
  final WeatherDataCurrent? current ;
  WeatherData([ this.current]);

  WeatherDataCurrent getCurrentWeatherData()=>current! ;
}
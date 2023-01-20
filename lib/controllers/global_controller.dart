

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherforecast/api/fetch_weather.dart';
import 'package:weatherforecast/models/current_weather_data.dart';
import 'package:weatherforecast/models/weather_data.dart';

class GloabalController extends GetxController{

  final RxBool isLoading  =true.obs ;
  final RxDouble lat = 0.0.obs;
  final RxDouble long = 0.0.obs ;

  final weatherData = WeatherData().obs ;

   WeatherData getData(){
    return weatherData.value ;
  }
  //
  RxBool Loading()=> isLoading;
  RxDouble getLat()=> lat ;
  RxDouble getLong()=> long ;


  @override
  void onInit(){
    if(isLoading.isTrue){
      getLocation();
    }
    super.onInit();
  }


  getLocation()async{
    bool serviceEnabled ;
    LocationPermission locPermission ;
      serviceEnabled = await  Geolocator.isLocationServiceEnabled() ;
      if(!serviceEnabled){
        return Future.error("location not enabled");
      }
      // permission status
     locPermission = await Geolocator.checkPermission() ;
      if(locPermission == LocationPermission.deniedForever){
        return Future.error("location permission not enabled ");
      }
      else if(locPermission == LocationPermission.denied){
        //request permission
        locPermission = await Geolocator.requestPermission();
        if(locPermission == LocationPermission.denied){
          return Future.error("location permission not enabled");
        }
      }

      // getting current lat and long
     return await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.best)
     .then((value) {
       lat.value = value.latitude;
       long.value= value.longitude ;
       return  FetchWeatherAPI().processData(value.latitude, value.longitude)
       .then((value) {
         weatherData.value = value ;
         isLoading.value = false ;
       } );
       isLoading.value = false ; 
     });


  }




}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weatherforecast/widgets/current_weather.dart';

import '../controllers/global_controller.dart';
class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GloabalController gloabalController = Get.put(GloabalController(), permanent: true );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("forecast"),
      ),
     body: ListView(
         children: [
           SafeArea(child: CurrentWeather(weatherDataCurrent: gloabalController.getData().getCurrentWeatherData()))
         ],
         ),
    );
  }
}

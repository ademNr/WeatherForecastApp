

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weatherforecast/controllers/global_controller.dart';
import 'package:weatherforecast/screens/details.dart';

import '../widgets/current_weather.dart';
import '../widgets/header_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GloabalController gloabalController = Get.put(GloabalController(), permanent: true );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
     drawer: Drawer(
       child: SafeArea(
         child: Container(
           margin: EdgeInsets.all(20),
           child: Column(
             children: [
               Header(),
               SizedBox(height: 50,),
               Container(
                 height: 70,
                 width: 400,
                 child: RaisedButton(
                   highlightElevation: 2,
                   color: Colors.blue,
                     onPressed: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => const Details()),
                       );

                 },
                     child: Text("Check Weather Details", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),)
                 ),
               ),
               SizedBox(height: 50,),
               Image.asset("lib/assets/weather1.png", scale: 0.5,)
               
               
             ],
           ),
         ),
       ),
     ),
      body:  SafeArea(
        child: Obx(()=> gloabalController.Loading().isTrue? Center(
          child: CircularProgressIndicator(),
        ) : ListView(
          children: [
            const SizedBox(height: 30,),
            // my header city location
            Header(),
            // for current weather ;
            CurrentWeather(
              weatherDataCurrent: gloabalController.getData().getCurrentWeatherData(),
            ),

          ],
        )),
      ),

    );
  }
}

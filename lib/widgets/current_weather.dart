
import 'package:flutter/material.dart';
import 'package:weatherforecast/models/current_weather_data.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent ;
  const CurrentWeather({Key? key, required this.weatherDataCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // temp
        SizedBox(height: 40,),
        Container(
          margin: EdgeInsets.all(20),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(10),
                child: tempWidget()
            ),
          ),
        ),




        //wind speeed / humidity // temp // clouds

        Container(
          margin: EdgeInsets.all(20),
          width: 500,
          



            child:currentWeatherWidget(),

        )


      ],
    );
  }


  Widget tempWidget(){
    return
      Column(
        children:[
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("lib/assets/weather1.png",),
          Container(
            height: 50,
            width: 1,
            color: Colors.grey,
          ),
          Text("${weatherDataCurrent.current.temp}°C", style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600, color: Colors.black),),





        ],
      ),
          Text("${weatherDataCurrent.current.weather![0].description}", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 40, color: Colors.grey[700]),),
        ]

      );

  }

  Widget currentWeatherWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Column(

          children: [
            Image.asset("lib/assets/windspeed.png", scale: 0.7,),
            SizedBox(height: 10,),
            Text("${weatherDataCurrent.current.clouds} % (cloud)", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))

          ],
        ),
        SizedBox(height: 60,),
        Column(

          children: [
            Image.asset("lib/assets/wind.png", scale: 0.7,),
            SizedBox(height: 10,),
            Text("${weatherDataCurrent.current.windSpeed} km/h (windSpeed)", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))

          ],
        ),
        SizedBox(height: 60,),
        Column(

          children: [
            Image.asset("lib/assets/rain.png",  scale:  0.7,),
            SizedBox(height: 10,),
            Text("${weatherDataCurrent.current.humidity} % (humidity)", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),)

          ],
        ),
        SizedBox(height: 60,),

      ],
    );
  }
}



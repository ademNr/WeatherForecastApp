
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../controllers/global_controller.dart';
class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());
  final GloabalController gloabalController = Get.put(GloabalController(), permanent: true );
  @override
  void initState() {
    getAddress(gloabalController.lat.value, gloabalController.long.value);

    super.initState();
  }
  getAddress(lat, long)async{
   List<Placemark> placemark = await placemarkFromCoordinates(lat, long );
   Placemark place = placemark[0];
   setState((){
     city = place.locality! ;
   });



  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // city
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                alignment: Alignment.topLeft,
                child: Text(city, style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),)
            ),
            Icon(Icons.location_on, color: Colors.blue,size: 60,)
          ],
        ),

        //date
        Container(
            margin: EdgeInsets.fromLTRB(30, 0, 50, 0),
            alignment: Alignment.topLeft,
            child: Text(date, style: TextStyle(fontSize: 13, color: Colors.grey[700]), )
        )

      ],
    );
  }
}

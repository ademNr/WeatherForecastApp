class WeatherDataCurrent{
  final Current current ;
  WeatherDataCurrent({required this.current});
  factory WeatherDataCurrent.fromJson(Map<String,dynamic>json)=>
       WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {



  double? temp;

  int? pressure;
  int? humidity;


  int? clouds;
  int? visibility;
  double? windSpeed;

  List<Weather>? weather;

  Current(
      {
        this.temp,

        this.pressure,
        this.humidity,

        this.clouds,
        this.visibility,
        this.windSpeed,

        this.weather});

  Current.fromJson(Map<String, dynamic> json) {

    temp = json['temp'];

    pressure = json['pressure'];
    humidity = json['humidity'];


    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];

    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['temp'] = this.temp;

    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;

    data['clouds'] = this.clouds;
    data['visibility'] = this.visibility;
    data['wind_speed'] = this.windSpeed;

    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}






import 'package:flutter/foundation.dart';
import 'package:weather_app/models/weather_model.dart';

//now i stored all my data provider in this class to modify in any time
// and access this object and put in it the data which i will use
//the class change notifier to be able to know or any one use my app know when the data changing
//by the notifyListeners() func
//and when i know tha data is changed i will rebuild UI and display the new data

class WeatherProvider extends ChangeNotifier {

  WeatherModel? _weatherData;
  String? cityName;

  set weatherData(WeatherModel? weather){
    _weatherData=weather;
    notifyListeners();
  }

  WeatherModel? get weatherData =>_weatherData;



}
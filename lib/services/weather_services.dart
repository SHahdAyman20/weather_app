// we seperated the logic of program to UI to make it reusable
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

//this class will provide the weather services which i will get from internet

class WeatherServices{
  //the method will get weather info
  Future<WeatherModel> getWeather({required String? cityName}) async
  {
    String baseUrl='http://api.weatherapi.com/v1';

    String apiKey='3bf7bc9fbcf848d0af2232641231207';

    Uri url= Uri.parse(
      '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7'
    );
    // this get request which take url of api and send response to you
    http.Response response= await http.get(url);
    // this map will store the data of api in key and value form
    //json decoder for convert the difficult map of string to simple form i can read and display
    Map<String,dynamic> data=jsonDecode(response.body);

    // now i will access the all data which i want from api in object
    WeatherModel weather=WeatherModel.fromJson(data);


    return weather;

  }


}
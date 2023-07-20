//create objects for store Api data
import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';

class WeatherModel{

   String date;
   double temperature;
   double maxTemperature;
   double minTemperature;
   String weatherState;
   double humidity;
   double wind;
   double chanceOfRain;


   WeatherModel({
    required this.date,
    required this.temperature,
    required this.maxTemperature,
    required this.minTemperature,
    required this.weatherState,
    required this.humidity,
    required this.wind,
    required this.chanceOfRain

  });

// 1) named constructor to make things more specific and build data from internet
  // 2) factory constructor fromJson--> we use api to access info from internet to avoid problem of nullable and accessing data cuz we return object
  factory WeatherModel.fromJson(dynamic data){

     var jsonData=data['forecast']['forecastday'][0]['day'];

     return WeatherModel(
         date: data['location']['localtime'],
         temperature: (jsonData['avgtemp_c'] as num?)!.toDouble(),
         maxTemperature: (jsonData['maxtemp_c'] as num?)!.toDouble(),
         minTemperature: (jsonData['mintemp_c'] as num?)!.toDouble(),
         weatherState: jsonData['condition']['text'] ,
         humidity: (jsonData['avghumidity'] as num?)!.toDouble(),
         wind:(jsonData['maxwind_kph'] as num?)!.toDouble(),
         chanceOfRain:( jsonData['daily_chance_of_rain'] as num?)!.toDouble()
     );
   }

   String getImage(){
    if(weatherState=="Sunny" || weatherState=="Clear" ){
      return 'assets/Day Sun.png';
    }

    else if(
    weatherState=="Partly cloudy" ||weatherState=="Cloudy" ||
        weatherState=="Overcast" ||weatherState=="Mist"||
        weatherState=='Thundery outbreaks in nearby' ){
      return 'assets/cloudy.png';
    }

    else if(weatherState=="Patchy rain possible"||weatherState==' Patchy light rain'||
        weatherState=='Light rain'||weatherState=='Moderate rain at times'||
        weatherState=='Moderate rain'|| weatherState=='Light rain shower'||
        weatherState=='Patchy light rain with thunder'||
        weatherState==''){
      return 'assets/Sun cloud mid rain.png';
    }

    else if(weatherState=="Patchy snow possible"||weatherState=="Patchy sleet possible"||
        weatherState=="atchy snow possible"||weatherState=="Patchy freezing drizzle possible"||
        weatherState=='Blowing snow'||weatherState=='Blizzard'||weatherState=='Freezing fog'||
    weatherState=='Freezing drizzle'||weatherState=='Heavy freezing drizzle'||
    weatherState=='Light freezing rain'||weatherState=='Moderate or heavy freezing rain'||
    weatherState=='Light sleet'||weatherState=='Moderate or heavy sleet'||
        weatherState=='Patchy light snow'||weatherState=='Light snow'
        ||weatherState=='Patchy moderate snow'||weatherState=='Moderate snow'||
        weatherState=='Patchy heavy snow'||weatherState=='Heavy snow'||
        weatherState=='Ice pellets'||weatherState=='Light sleet showers'||
        weatherState=='Moderate or heavy sleet showers'||weatherState==''
        ||weatherState=='Light snow showers'||weatherState=='Moderate or heavy snow showers'
        ||weatherState=='Light showers of ice pellets'||
        weatherState=='Moderate or heavy showers of ice pellets'||
        weatherState=='Patchy light snow with thunder'||weatherState=='Moderate or heavy snow with thunder'
    )
    {
      return 'assets/Snow.png';
    }

    else if(weatherState=="Fog"||weatherState=='Patchy light drizzle' ||
     weatherState=='Light drizzle'||weatherState=='Light drizzle'){
      return 'assets/Night Clouds.png';

    }

    else if(weatherState=='Heavy rain at times'||weatherState=='Heavy rain'||
     weatherState=='Moderate or heavy rain shower'||weatherState=='Torrential rain shower'||
     weatherState=='Moderate or heavy rain with thunder'||weatherState==''){
      return 'assets/raining.png';
     }

    else{
      return 'assets/Day Sun.png';
    }
   }


  BoxDecoration getColor() {
    if(weatherState=="Sunny" || weatherState=="Clear" ){
      return BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffefb43d),
            Color(0xff0089be),
            Color(0xff30BCE5),
          ],
        ),
      );
    }else{
      return BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff082654),
            Color(0xff0C43AC),
          ],
        ),
      );
    }

  }

}
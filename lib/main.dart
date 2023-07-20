import 'package:flutter/material.dart';
import 'package:weather_app/pages/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';


void main(){

  //this provides all data which i want to this object 'weather' for all children
  runApp(
      ChangeNotifierProvider(
          child: WeatherApp(),
        create: (context){
          return WeatherProvider();
        },
      )
  );

}
class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

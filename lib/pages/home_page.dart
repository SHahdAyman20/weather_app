import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class HomePage extends StatelessWidget {

  Color color=Color(0xff0A2C63);
  String? cityName;



  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:color ,
      appBar: AppBar(
        toolbarHeight: screenHeight*0.1,
        centerTitle: true,
        title: const Text(
          'Weather ',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xff0A2C63),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: screenWidth,
        padding: EdgeInsets.all(10),
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(90),
                  topRight: Radius.circular(90),
                ),
              ),
        child: Column(
          children: [
            Container(
              height: screenHeight*0.35,
              width: screenWidth*0.5,
              child: Image.asset('assets/weather.png'),
            ),

            TextField(
              onSubmitted: (data) async{
                cityName=data;
                WeatherServices service=WeatherServices();
               WeatherModel weather=
                        await service.getWeather(cityName: cityName);
               //access the data which provider provide
                // now i determine the type of data which i will provide in this tags<>
                //to specify the kind of data
                //now i put the data in weather in weatherData object
               Provider.of<WeatherProvider>(context, listen: false).weatherData=weather;
                Provider.of<WeatherProvider>(context, listen: false).cityName=cityName;
               Navigator.push(
                   context,
                 MaterialPageRoute (
                   builder: (BuildContext context) => SearchPage(),
                 ),
               );
               print(weather);
              },
              decoration: InputDecoration(
                hintText: 'Enter The City Name',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: color,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),

                )
              ),
            ),
            SizedBox(
              height: screenHeight*.04,
            ),
            Text(
              'Discover The Weather of your city',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: color
              ),
            ),

          ],
        ),
            ),
    );
  }
}



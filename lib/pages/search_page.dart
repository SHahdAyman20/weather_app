import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';


class SearchPage extends StatelessWidget {


  LinearGradient rainingGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white.withOpacity(0.8),
      Colors.white.withOpacity(0.8),
     // Color.fromRGBO(8, 33, 76, 1),
      //Color.fromRGBO(6, 111, 192, 0.9),
      //Color.fromRGBO(8, 33, 76, 1),

    ],
  );

  WeatherModel? weatherData;
  String? cityName;


  @override
  Widget build(BuildContext context) {

    weatherData =Provider.of<WeatherProvider>(context).weatherData;
    cityName=Provider.of<WeatherProvider>(context).cityName;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      body:
      weatherData != null ?                  // <<------------------------------
      Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
          right: 8,
          left: 8),
        width: double.infinity,
        height: double.infinity,
          decoration:weatherData!.getColor() ,
        child: Column(
          children: [
         Row(
           children: [
             IconButton(
               icon: Icon(
                   Icons.location_on_outlined,
               size: 35,
               color: Colors.white,),
               onPressed: null,
             ),
             Expanded(
               flex: 1,
               child: Text(
                   cityName!,
                 style: TextStyle(
                   fontSize: 25,
                   color: Colors.white
                 ),
               ),
             ),
             IconButton(
               icon: Icon(
                 Icons.search,
                 size: 30,
                 color: Colors.white,),
               onPressed: () {
                 Navigator.pop(context);
               },
             ),
           ],
         ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20
              ),
              child: Row(
                children: [
                  Text(
                    'Updated on : ${weatherData!.date}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Image(image: AssetImage(
                  weatherData!.getImage()
                ),
                  height: screenHeight*.28,
                  width: screenWidth*.95,
                ),
              ],
            ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${weatherData!.temperature.toInt()}°c ',
                  style: TextStyle(
                      fontSize: 70,
                      color: Colors.white,
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weatherData!.weatherState,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10
                  ),
                  padding: EdgeInsets.all(10),
                  height: screenHeight*0.1,
                  width: screenWidth*0.9,
                  decoration: BoxDecoration(
                    gradient: rainingGradient,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10
                                ),
                                child: Image(
                                  image: AssetImage(
                                      'assets/maxTemp.png'
                                  ),
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '  Max Temp',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff082654),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '  ${weatherData!.maxTemperature.toInt()}°c',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff082654),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10
                                ),
                                child: Image(
                                  image: AssetImage(
                                      'assets/minTemp.png'
                                  ),
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '  Min Temp',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff082654),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '  ${weatherData!.minTemperature.toInt()}°c',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff082654),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
               ],
                  )
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10
                  ),
                  padding: EdgeInsets.all(10),
                  height: screenHeight*0.19,
                  width: screenWidth*0.9,
                  decoration: BoxDecoration(
                      gradient: rainingGradient,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8
                            ),
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/wind.png'
                                  ),
                                  width: 50,
                                  height: 50,

                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Wind',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff082654),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${weatherData!.wind.toInt()} km/h',
                                style: TextStyle(
                                  fontSize: 18,
                                 // fontWeight: FontWeight.bold,
                                  color: Color(0xff082654),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/humidity.png'
                                  ),
                                  width: 40,
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                ' Humidity',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff082654),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${weatherData!.humidity.toInt()}%',
                                style: TextStyle(
                                  fontSize: 18,
                                 // fontWeight: FontWeight.bold,
                                  color: Color(0xff082654),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8
                            ),
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/chance of rain.png'
                                  ),
                                  width: 50,
                                  height: 43,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Chance of \n \t\t\t rain',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff082654),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${weatherData!.chanceOfRain.toInt()}%',
                                style: TextStyle(
                                  fontSize: 18,
                                //  fontWeight: FontWeight.bold,
                                  color: Color(0xff082654),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                )
              ],
            ),
          ],
        )
      )

          :               // <<-----------------
      Container()


    );
  }
}

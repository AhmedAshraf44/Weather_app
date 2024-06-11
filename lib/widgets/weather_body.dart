import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_second/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app_second/main.dart';
import 'package:weather_app_second/models/weather_model.dart';


// ignore: must_be_immutable
class WeatherBody extends StatelessWidget {
  //const
 const WeatherBody({super.key,required this.weather});

  // final
    
   final WeatherModel weather;
   
  @override
  Widget build(BuildContext context) {
     WeatherModel weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel!; 
    return Container(
     decoration: BoxDecoration(
       gradient: LinearGradient(
         colors:[
          getThemeColor(weatherModel.weatherStateName),
           getThemeColor(weatherModel.weatherStateName)[300]!,
           getThemeColor(weatherModel.weatherStateName)[100]!,
         ],
         begin: Alignment.topCenter,
         end: Alignment.bottomCenter 
         ),
     ),
      child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Spacer(
                     flex: 3,
                   ),
                   Text(
                    weather.cityName!,
                    // using with state management of provider ...
                    // Provider.of<WeatherProvider>(context).cityName?? 'Fayoum',
                     style:const TextStyle(
                       fontSize: 32,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   Text(
                 'updated at :  ${weather.date.hour}:${weather.date.minute}',
                     style:const TextStyle(fontSize: 20),
                   ),
                   const Spacer(),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Image.asset(weather.getImage()),
                       Text(
                     '${weather.temp.toInt()}',
                         style:const TextStyle(
                           fontSize: 32,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                     'maxTemp : ${weather.maxTemp.toInt()}',
                     style:const TextStyle(fontSize: 18),
                   ), Text(
                     'minTemp : ${weather.minTemp.toInt()}',
                     style:const TextStyle(fontSize: 18),
                   ),
                         ],
                       )
                     ],
                   ),
                   const Spacer(),
                   Text(
                     weather.weatherStateName,
                     style:const TextStyle(
                       fontSize: 32,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   const Spacer(
                     flex: 4,
                   ),
                 ],
               ),
    );
  }
}


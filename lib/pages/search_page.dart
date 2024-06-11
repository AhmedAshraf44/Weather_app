// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_second/cubits/get_weather_cubit/weather_cubit.dart';



class SearchPage extends StatelessWidget {
String? cityName; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  onChanged: (data){
                    cityName = data ;
                  BlocProvider.of<WeatherCubit>(context).getWeather(cityName: data);
                  },

                  onSubmitted: (data)  async {
                    BlocProvider.of<WeatherCubit>(context).getWeather(cityName: data);

                       // using with state management of provider ...
                  // Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                  // Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
                  Navigator.pop(context);
                  },
                  decoration:  InputDecoration(
                      contentPadding:
                         const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                      suffixIcon: GestureDetector(
                        onTap:()async{
                            BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName??'');

                             // using with state management of provider ...
                  // Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                  // Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
                  Navigator.pop(context);
                        },
                        child:const Icon(Icons.search)),
                      labelText: 'Search',
                      hintText: 'Enter a City Name',
                      border:const OutlineInputBorder()),
                ),
              ),
            ),
    );
  }
}


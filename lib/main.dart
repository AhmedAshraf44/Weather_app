import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_second/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app_second/cubits/get_weather_cubit/weather_state.dart';
import 'package:weather_app_second/pages/home_page.dart';


void main() {
      // 4- provide cubit
  runApp(const  WeatherApp(),);
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<WeatherCubit,WeatherState>(
          builder: (context, state) => MaterialApp (
            theme: ThemeData(
              primarySwatch:
              getThemeColor(BlocProvider.of<WeatherCubit>(context).weatherModel?.weatherStateName,),
            ),
            debugShowCheckedModeBanner: false,
            home:const HomePage(),
          ),
        ),
      ),
    );
  }
}

  MaterialColor getThemeColor(String? weatherStateName)
  { if(weatherStateName == null)
    {
      return  Colors.blue;
    }
    else if(weatherStateName=='Partly Cloudy' || weatherStateName=='Cloudy')
    {
    return Colors.blueGrey;
    }
    else if(weatherStateName=='Patchy snow nearby' || weatherStateName=='Blowing snow'||weatherStateName=='Patchy light snow'||weatherStateName=='Light snow') 
    {return Colors.blue;
    }
    else if(weatherStateName=='Patchy rain nearby' || weatherStateName=='Moderate rain'||weatherStateName=='Light rain' || weatherStateName=='Heavy rain at times'||weatherStateName=='Moderate rain at times'||weatherStateName=='Patchy rain possible'||weatherStateName=='Heavy rain') 
    {return  Colors.blue;}
    else if(weatherStateName=='Clear' || weatherStateName=='Sunny')
    {return Colors.orange;}
        else if(weatherStateName=='Overcast' || weatherStateName=='Mist')
    {return Colors.deepPurple;}
    else 
   { return  Colors.blue;
   }
  }


// using cubits :-

// 1- create state
// 2- create cubit
// 3- create function
// 4- provide cubit
// 5- integrate cubit
// 6- trigger cubit
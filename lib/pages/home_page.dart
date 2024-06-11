import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather_app_second/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app_second/cubits/get_weather_cubit/weather_state.dart';
import 'package:weather_app_second/pages/search_page.dart';
import 'package:weather_app_second/widgets/no_weather_body.dart';
import 'package:weather_app_second/widgets/weather_body.dart';


// ignore: must_be_immutable
class HomePage extends StatelessWidget {
 const HomePage({super.key});

//  void updated()
 //WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
// using with state management of provider ...
  var  weatherData = context.read<WeatherCubit>().weatherModel?.weatherStateName;
    //BlocProvider.of<WeatherCubit>(context).weatherModel?.weatherStateName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: weatherData =='Sunny' ? Colors.orange : Colors.blue,
        actions: [
          IconButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context){
            return SearchPage();
           },) );
          }, icon:const Icon(Icons.search),),
        ],
        title:const Text('Weather App'),
      ),

      // 5- integrate cubit
      body:BlocBuilder<WeatherCubit,WeatherState>(
        builder:(context, state ) {
          if(state is WeatherInitialState)
         {
          return const NoWeatherBody();
          }
          else if (state is WeatherFailureState)
          {
            return const Center(child: Text('oops there is error, try again'));
            
          }else if (state is WeatherSuccessState){
           return WeatherBody(weather: state.weatherModel,);
          }
          else {
           return ModalProgressHUD(inAsyncCall: state is WeatherLoadedState ? true : false ,child:const Center(child: CircularProgressIndicator(),));
          }
        },),
     
      
    );
  }
}

// using cubit : 

// 1- create state
// 2- create cubit
// 3- create function
// 4- provide cubit
// 5- integreate cubit
// 6- triggering cubit
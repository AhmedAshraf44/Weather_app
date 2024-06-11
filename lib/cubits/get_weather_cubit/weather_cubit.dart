import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_second/cubits/get_weather_cubit/weather_state.dart';
import 'package:weather_app_second/models/weather_model.dart';
import 'package:weather_app_second/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> 
{
  WeatherCubit():super(WeatherInitialState());
 
 
 String? cityName; 
WeatherModel? weatherModel;
 void getWeather({required String cityName}) async
 {
  emit(WeatherLoadedState());
  this.cityName = cityName ;
  try {
   weatherModel =await WeatherServices(dio: Dio()).getWeather(cityName: cityName);
   emit(WeatherSuccessState(weatherModel!));
 }catch (e) 
 {
  emit(WeatherFailureState());
 }

 }


}
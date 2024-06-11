import 'package:weather_app_second/models/weather_model.dart';

class WeatherState {}



class WeatherInitialState  extends WeatherState{}

class WeatherLoadedState extends WeatherState {}

class WeatherSuccessState  extends WeatherState{
final WeatherModel weatherModel;
WeatherSuccessState(this.weatherModel);
}


class WeatherFailureState extends WeatherState{}

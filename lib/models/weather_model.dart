class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String? cityName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName,
      required this.cityName});

  factory WeatherModel.fromJson(dynamic data,String cityName) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: DateTime.parse( data['current']['last_updated']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text'],
        cityName: cityName);
  }

  // @override
  // String toString() {
  //   return 'tem = $temp  minTemp = $minTemp  date = $date';
  // }
  
  String getImage()
  {
    if(weatherStateName=='Partly Cloudy' || weatherStateName=='Cloudy')
    {
    return 'assets/images/cloudy.png';
    }
    else if(weatherStateName=='Patchy snow nearby' || weatherStateName=='Blowing snow'||weatherStateName=='Patchy light snow'||weatherStateName=='Light snow') 
    {return 'assets/images/snow.png';}
    else if(weatherStateName=='Patchy rain nearby' || weatherStateName=='Moderate rain'||weatherStateName=='Light rain' || weatherStateName=='Heavy rain at times'||weatherStateName=='Moderate rain at times') 
    {return 'assets/images/rainy.png';}
    else if(weatherStateName=='Clear' || weatherStateName=='Sunny')
    {return 'assets/images/clear.png';}
        else if(weatherStateName=='Overcast' || weatherStateName=='Mist')
    {return 'assets/images/thunderstorm.png';}
    else 
   { return 'assets/images/thunderstorm.png';}
  }

 

}



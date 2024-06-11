// 1- using https request

// import 'dart:convert';
import 'dart:developer';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:weather_app_second/models/weather_model.dart';

// class WeatherServices {
//  WeatherModel? weather;
//         String baseUrl = 'http://api.weatherapi.com/v1';
//     String apiKey = 'e3d38256116d4e58a20171516231908';
//   Future<WeatherModel?> getWeather({required String cityName}) async {
//     Uri url =
//         Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
//     http.Response response = await http.get(url);
//     if(response.statusCode == 200){
//     Map<String, dynamic> data = jsonDecode(response.body);
//     weather =WeatherModel.fromJson(data);
//     return weather;
//     }
//     else
//     {
//       log('${response.statusCode}');
//       throw Exception(
//         'oops there was error, try later');
//     }
//     }
// }



// 2- using Dio request
class WeatherServices {
  final Dio dio;

  WeatherServices({required this.dio});
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'e3d38256116d4e58a20171516231908';

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

      Map<String, dynamic> data = response.data;
    WeatherModel weather = WeatherModel.fromJson(data,cityName);
      return weather;
    } on DioException catch (e) {
      final String errorMessages = e.response?.data['error']['message'] ??
          'oops there was error, try later';
      throw Exception(errorMessages);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was error, try later');
    }
  }
}

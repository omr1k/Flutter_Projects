import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/five_days_data.dart';
import '../Constants/api.dart';
import '../models/weather_response.dart';

class NetworkManger {
  
  static Future<WeatherResponse> getWeatherData(Position position) async {
    var lat = position.latitude.toString();
    var lon = position.longitude.toString();
    var url =
        "https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${Api.weatherAppId}&lang=en&units=metric";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print('================================================');
      print(json);
      print('================================================');
      return WeatherResponse.fromJson(json);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  static Future<WeatherResponse> getWeatherDataByCityName(
      String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&lang=en&appid=${Api.weatherAppId}&units=metric';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print('================================================');
      print(json);
      print('================================================');
      return WeatherResponse.fromJson(json);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  static Future<FiveDaysData> getFiveDaysForecastByPostion(
      Position position) async {
    var lat = position.latitude.toString();
    var lon = position.longitude.toString();

    var url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=${Api.weatherAppId}&lang=en&units=metric';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body); 
      print('==========This is 5 Days From NM By Postion==========');
      print(json);
      print('==========================================');
      return FiveDaysData.fromJson(json);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  static Future<FiveDaysData> getFiveDaysForecastByCityName(
      String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&lang=en&appid=${Api.weatherAppId}&units=metric';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print('================================================');
      print(json);
      print('================================================');
      return FiveDaysData.fromJson(json);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/models/five_days_data.dart';
import 'package:weather_app/models/weather_response.dart';
import 'package:weather_app/services/network_manger.dart';

class WeatherProvider extends ChangeNotifier {
  List<WeatherResponse> weatherData = [];
  List<FiveDaysData> fiveDaysData = [];

  var isError = false;
  var isLoading = false;

  void toggleIsError() {
    isError = !isError;
    notifyListeners();
  }

  void toggleIsloading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void askLocationPermission() async {
    isLoading = true;
    var permissionStatus = await Permission.locationWhenInUse.status;

    if (permissionStatus.isGranted) {
      getCurrentLocation();
    } else if (permissionStatus.isDenied || permissionStatus.isRestricted) {
      // Request location permission
      permissionStatus = await Permission.locationWhenInUse.request();

      if (permissionStatus.isGranted) {
        getCurrentLocation();
        notifyListeners(); // Try getting location again
      } else if (permissionStatus.isDenied) {
        // Permission is denied
        print('Location permission is denied.');
      } else if (permissionStatus.isPermanentlyDenied) {
        // Permission is permanently denied
        print(
            'Location permission is permanently denied. Please enable it in the device settings.');
        await openAppSettings(); // Open app settings to allow the user to enable the permission
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      // Permission is permanently denied
      print(
          'Location permission is permanently denied. Please enable it in the device settings.');
      await openAppSettings(); // Open app settings to allow the user to enable the permission
    }
  }

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      getWeatherDataByLocation(position);
      notifyListeners();
    } catch (e) {
      print('=====Error=====');
      print(e);
    }
  }

  Future<void> getWeatherDataByLocation(Position position) async {
    final response = await NetworkManger.getWeatherData(position);
    weatherData = [response];
    final res = await NetworkManger.getFiveDaysForecastByPostion(position);
    fiveDaysData = [res];
    isLoading = false;
    notifyListeners();
  }

  void getWeatherDataByCity(String city) async {
    try {
      final response = await NetworkManger.getWeatherDataByCityName(city);
      weatherData = [response];
      final res = await NetworkManger.getFiveDaysForecastByCityName(city);
      fiveDaysData = [res];
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('========================== isError => $isError');
      isLoading = false;
      toggleIsError();
    }
  }
}

  // void deleteWeatherData() {
  //   weatherData = [];
  //   notifyListeners();
  // }

  // void add() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   weatherData.add(
  //     WeatherResponse(
  //       coord: Coord(lon: 51.5074, lat: -0.1278),
  //       weather: [
  //         Weather(
  //           id: 800,
  //           main: "Clear",
  //           description: "clear sky",
  //           icon: "01d",
  //         ),
  //       ],
  //       base: "stations",
  //       main: Main(
  //         temp: 15,
  //         feelsLike: 14.55,
  //         tempMin: 14.44,
  //         tempMax: 15.56,
  //         pressure: 1024,
  //         humidity: 45,
  //       ),
  //       visibility: 10000,
  //       wind: Wind(speed: 3.09, deg: 100),
  //       clouds: Clouds(all: 0),
  //       dt: 1649128055,
  //       timezone: 0,
  //       id: 2643743,
  //       name: "LondonOfOmar@@@",
  //       cod: 200,
  //     ),
  //   );
  //   notifyListeners();
  // }

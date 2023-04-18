// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:weather_app/app_colors.dart';
// import 'package:weather_app/widgets/app_spinner.dart';
// import '../models/appProvider.dart';
// import '../services/network_manger.dart';
// import 'package:provider/provider.dart';
// import 'package:geolocator/geolocator.dart';


// class HomeScrrenOld extends StatefulWidget {
//   HomeScrrenOld({super.key});

//   @override
//   State<HomeScrrenOld> createState() => _HomeScrrenOldState();
// }

// class _HomeScrrenOldState extends State<HomeScrrenOld> {
//   // List<WeatherResponse> weatherResponse = [];
//   late Position _currentPosition;

//   @override
//   void initState() {
//     super.initState();
//     askLocationPermission();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //* this line change to color of status bar
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor:
//           AppColors.statusBarColor, // Change the color to your desired color
//     ));
//     return Scaffold(
//       body: SafeArea(
//         child: Expanded(
//           child: Container(
//             decoration: BoxDecoration(gradient: AppColors.backgroundColor),
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 left: 20,
//                 right: 20,
//                 bottom: 10,
//                 top: 25,
//               ),
//               child: Provider.of<AppProvider>(context).weatherD.isEmpty ? AppSpinner() : HomeScreenBody(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void askLocationPermission() async {
//     var permissionStatus = await Permission.locationWhenInUse.status;

//     if (permissionStatus.isGranted) {
//       getCurrentLocation();
//     } else if (permissionStatus.isDenied || permissionStatus.isRestricted) {
//       // Request location permission
//       permissionStatus = await Permission.locationWhenInUse.request();

//       if (permissionStatus.isGranted) {
//         getCurrentLocation(); // Try getting location again
//       } else if (permissionStatus.isDenied) {
//         // Permission is denied
//         print('Location permission is denied.');
//       } else if (permissionStatus.isPermanentlyDenied) {
//         // Permission is permanently denied
//         print(
//             'Location permission is permanently denied. Please enable it in the device settings.');
//         await openAppSettings(); // Open app settings to allow the user to enable the permission
//       }
//     } else if (permissionStatus.isPermanentlyDenied) {
//       // Permission is permanently denied
//       print(
//           'Location permission is permanently denied. Please enable it in the device settings.');
//       await openAppSettings(); // Open app settings to allow the user to enable the permission
//     }
//   }

//   void getCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         _currentPosition = position;
//         print('=====long=====');
//         print(position.longitude);
//         print('=====lat=====');
//         print(position.latitude);
//         getWeatherData();
//       });
//     } catch (e) {
//       print('=====Error=====');
//       print(e);
//     }
//   }

//   Future<void> getWeatherData() async {
//     await Future.delayed(Duration(seconds: 2));
//     final response = await NetworkManger.getWeatherData(_currentPosition);
//     setState(() {
//       Provider.of<AppProvider>(context,listen: false).weatherD = [response];
//     });
//   }
// }

// class HomeScreenBody extends StatelessWidget {
//   const HomeScreenBody({
//     Key? key,
//   }) : super(key: key);

//   Future<void> ff() async {
//     print('sdsdsf');
//   }
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: ()async{
//         await ff();
//       },
//       child: Column(
//         children: [
//           HomeScreenHeader(),
//           // TestW(),
//           // HomeScreenImageWidget(),
//           // HomeScreenWeatherInfoBox()
//           Spacer(),
//         ],
//       ),
//     );
//   }
// }

// class HomeScreenWeatherInfoBox extends StatelessWidget {
//   const HomeScreenWeatherInfoBox({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final now = DateTime.now();
//     final day = now.day;
//     final month = DateFormat('MMMM').format(now);
//     return Expanded(
//       child: Center(
//         child: Container(
//           padding: EdgeInsets.all(18),
//           height: double.infinity,
//           width: double.infinity,
//           decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(20.0),
//               border: Border.all(color: Colors.white.withOpacity(0.6))),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Today, ${day} ${month}',
//                 style: TextStyle(fontSize: 25, color: AppColors.textColor),
//               ),
//               Text(
//                 "${Provider.of<AppProvider>(context).weatherD[0].main.temp}",
//                 style: TextStyle(
//                   color: AppColors.textColor,
//                   fontSize: 100,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//               "${Provider.of<AppProvider>(context).weatherD[0].weather[0].description}",
//                 style: TextStyle(fontSize: 35, color: AppColors.textColor),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               HomeScreenMetricsWidget(
//                 viewIcon: Icons.wind_power,
//                 viewText: 'Wind',
//                 value: "${Provider.of<AppProvider>(context).weatherD[0].wind.speed.toInt()} km/h",
//               ),
//               HomeScreenMetricsWidget(
//                 viewIcon: Icons.water_drop_outlined,
//                 viewText: 'Hum',
//                 value: "${Provider.of<AppProvider>(context).weatherD[0].main.humidity} %",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomeScreenMetricsWidget extends StatelessWidget {
//   const HomeScreenMetricsWidget({
//     super.key,
//     required this.viewIcon,
//     required this.viewText,
//     required this.value,
//   });
//   final IconData viewIcon;
//   final String viewText;
//   final String value;

//   @override
//   Widget build(BuildContext context) {
//    return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Icon(
//                 viewIcon,
//                 size: 27,
//                 color: AppColors.textColor,
//               ),
//           ),
          
//           Expanded(
//             child: Text(
//               viewText,
//               style: TextStyle(fontSize: 20, color: AppColors.textColor),
//               textAlign: TextAlign.left,
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value,
//               style: TextStyle(fontSize: 20, color: AppColors.textColor),
//               textAlign: TextAlign.left,
//             ),
//           ),
//         ],
//       );
  
//   }
// }

// class HomeScreenImageWidget extends StatelessWidget {
//   const HomeScreenImageWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(40),
//       child: Image.network(
//         'https://openweathermap.org/img/wn/${Provider.of<AppProvider>(context).weatherD[0].weather[0].icon}@2x.png',
//         fit: BoxFit.fitHeight,
//       )
//     );
//   }
// }

// class HomeScreenHeader extends StatelessWidget {
//   const HomeScreenHeader({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         FittedBox(
//             fit: BoxFit.contain,
//             child: Icon(
//               Icons.location_on_outlined,
//               size: 30,
//               color: AppColors.textColor,
//             )),
//         SizedBox(
//           width: 10,
//         ),
//         FittedBox(
//           fit: BoxFit.scaleDown,
//           child: Text(
//             "${Provider.of<AppProvider>(context).weatherD[0].name}",
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 30,
//                 color: AppColors.textColor),
//           ),
//         ),
//         Spacer(),
//         FittedBox(
//             fit: BoxFit.contain,
//             child: Icon(
//               Icons.notifications,
//               size: 30,
//               color: AppColors.textColor,
//             )),
//       ],
//     );
//   }
// }

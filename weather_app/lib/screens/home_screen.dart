import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Constants/app_colors.dart';
import 'package:weather_app/widgets/app_chart.dart';
import '../Constants/images.dart';
import '../models/weatherProvider.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/app_spinner.dart';
import 'home_screen_bacground.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double statusBarHeight = 0.0;
  // late Position _currentPosition;

  @override
  void initState() {
    // askLocationPermission();
    Provider.of<WeatherProvider>(context, listen: false)
        .askLocationPermission();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    statusBarHeight = MediaQuery.of(context).padding.top;
    // statusBarHeight = window.viewPadding.top;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: HomeScreenBaseView(statusBarHeight: statusBarHeight),
      ),
    );
  }
}

class HomeScreenBaseView extends StatelessWidget {
  const HomeScreenBaseView({
    super.key,
    required this.statusBarHeight,
  });

  final double statusBarHeight;

  @override
  Widget build(BuildContext context) {
    return Provider.of<WeatherProvider>(context).weatherData.isEmpty
        ? AppSpinner()
        : Stack(
            children: [
              HomeScreenBackground(),
              Padding(
                padding: EdgeInsets.only(
                    top: statusBarHeight + 10.0,
                    bottom: 10.0,
                    left: 10.0,
                    right: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: HomeScreenHeader(),
                        ),
                      ),
                      SliverFillRemaining(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: SingleChildScrollView(
                            child: Provider.of<WeatherProvider>(context,
                                        listen: false)
                                    .isLoading
                                ? Center(
                                    child: SpinKitWave(
                                      color: Colors.white,
                                      size: 70,
                                    ),
                                  )
                                : HomeScreenBody(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Provider.of<WeatherProvider>(context).isError
                  ? InvalidCityDialog()
                  : SizedBox.shrink(),
            ],
          );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('EEEE, MMMM d').format(DateTime.now());
    return SingleChildScrollView(
      child: Column(
        children: [
          // HomeScreenHeader(),
          SizedBox(
            height: 20,
          ),
          Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Provider.of<WeatherProvider>(context)
                              .weatherData[0]
                              .name,
                          style: TextStyle(
                            color: AppColors.iOSDefultBlue,
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          currentDate,
                          style: TextStyle(
                            color: AppColors.iOSDefultBlue,
                            fontSize: 15,
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  Provider.of<WeatherProvider>(context)
                                      .weatherData[0]
                                      .weather[0]
                                      .description,
                                  style: TextStyle(
                                    color: AppColors.iOSDefultBlue,
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  '${Provider.of<WeatherProvider>(context).weatherData[0].main.temp}°C',
                                  style: TextStyle(
                                    color: AppColors.iOSDefultBlue,
                                    fontSize: 40,
                                  ),
                                ),
                                Text(
                                  'min: ${Provider.of<WeatherProvider>(context).weatherData[0].main.tempMin}°C - max: ${Provider.of<WeatherProvider>(context).weatherData[0].main.tempMax}°C',
                                  style: TextStyle(
                                    color: AppColors.iOSDefultBlue,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Lottie.asset(Images.cloudyAnim,
                                    width: MediaQuery.of(context).size.width *
                                        0.3, // set width to 50% of screen width
                                    height: MediaQuery.of(context).size.height *
                                        0.1, // set height to 30% of screen height
                                    reverse: true,
                                    repeat: true,
                                    fit: BoxFit.cover),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  'Wind ${Provider.of<WeatherProvider>(context).weatherData[0].wind.speed} km/h',
                                  style: TextStyle(
                                    color: AppColors.iOSDefultBlue,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Forecast Next 5 Days',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          AppChart(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Forecast Previous 5 Days',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          AppChart(),
        ],
      ),
    );
  }
}

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(
                    "Forecast",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: AppColors.textColor),
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<WeatherProvider>(context, listen: false)
                          .askLocationPermission();
                    },
                    icon: Icon(Icons.location_on),
                    color: AppColors.textColor,
                    iconSize: 30,
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 50,
          child:
              Align(alignment: Alignment.centerRight, child: SearchBarWidget()),
        ),
      ],
    );
  }
}

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool _isExpanded = false;
  final TextEditingController _searchQueryController = TextEditingController();

  @override
  void dispose() {
    _searchQueryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: _isExpanded ? MediaQuery.of(context).size.width / 2 : 50.0,
      height: 50,
      decoration: BoxDecoration(
        // color: Colors.green.withOpacity(0.9),
        borderRadius: BorderRadius.circular(25),
        color: Colors.black.withOpacity(0.2),
        boxShadow: kElevationToShadow[6],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 11),
              child: _isExpanded
                  ? TextField(
                      controller: _searchQueryController,
                      onSubmitted: (value) {
                        setState(() {
                          _isExpanded = false;
                          Provider.of<WeatherProvider>(context, listen: false)
                              .toggleIsloading();
                          print(_searchQueryController.text);
                          Provider.of<WeatherProvider>(context, listen: false)
                              .getWeatherDataByCity(
                                  _searchQueryController.text);
                        });
                      },
                      style: TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey)),
                    )
                  : null,
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            child: InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                  _searchQueryController.clear();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Icon(
                  !_isExpanded ? Icons.search : Icons.close,
                  color: AppColors.textColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}








  // Future<void> getWeatherData() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   final response = await NetworkManger.getWeatherData(_currentPosition);
  //   setState(() {
  //     Provider.of<WeatherProvider>(context, listen: false).weatherData = [
  //       response
  //     ];
  //   });
  // }



  
  // void askLocationPermission() async {
  //   var permissionStatus = await Permission.locationWhenInUse.status;

  //   if (permissionStatus.isGranted) {
  //     getCurrentLocation();
  //   } else if (permissionStatus.isDenied || permissionStatus.isRestricted) {
  //     // Request location permission
  //     permissionStatus = await Permission.locationWhenInUse.request();

  //     if (permissionStatus.isGranted) {
  //       getCurrentLocation(); // Try getting location again
  //     } else if (permissionStatus.isDenied) {
  //       // Permission is denied
  //       print('Location permission is denied.');
  //     } else if (permissionStatus.isPermanentlyDenied) {
  //       // Permission is permanently denied
  //       print(
  //           'Location permission is permanently denied. Please enable it in the device settings.');
  //       await openAppSettings(); // Open app settings to allow the user to enable the permission
  //     }
  //   } else if (permissionStatus.isPermanentlyDenied) {
  //     // Permission is permanently denied
  //     print(
  //         'Location permission is permanently denied. Please enable it in the device settings.');
  //     await openAppSettings(); // Open app settings to allow the user to enable the permission
  //   }
  // }

  // void getCurrentLocation() async {
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);
  //     setState(() {
  //       // _currentPosition = position;
  //       print('=====long=====');
  //       print(position.longitude);
  //       print('=====lat=====');
  //       print(position.latitude);
  //       Provider.of<WeatherProvider>(context, listen: false)
  //           .getWeatherDataByLocation(position);
  //     });
  //   } catch (e) {
  //     print('=====Error=====');
  //     print(e);
  //   }
  // }
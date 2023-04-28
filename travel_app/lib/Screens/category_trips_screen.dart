import 'package:flutter/material.dart';
import 'package:travel_app/Models/trip.dart';
import 'package:travel_app/widgets/trip-item.dart';
import '../app_data.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';
  final List<Trip> availableTrips;

  CategoryTripsScreen(this.availableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final catID = routeArgument['id'];
    categoryTitle = routeArgument['title']!;
    displayTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(catID);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            duration: displayTrips[index].duration,
            imageUrl: displayTrips[index].imageUrl,
            season: displayTrips[index].season,
            tripType: displayTrips[index].tripType,
            // removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }
}



  // const CategoryTripsScreen({super.key, required this.catID, required this.catTitle});
  // final String catID;
  // final String catTitle;
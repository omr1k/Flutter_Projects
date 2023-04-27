import 'package:flutter/material.dart';
import 'package:travel_app/Models/trip.dart';

import '../widgets/trip-item.dart';

class FavoritesScreen extends StatelessWidget {
  // const FavoritesScreen({super.key});
  final List<Trip> favoriteTrips;
  FavoritesScreen(this.favoriteTrips);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return Center(child: Text('ليس لديك اي رحلة في قائمة المفضلة'));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            duration: favoriteTrips[index].duration,
            imageUrl: favoriteTrips[index].imageUrl,
            season: favoriteTrips[index].season,
            tripType: favoriteTrips[index].tripType,
            // removeItem: _removeTrip,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}

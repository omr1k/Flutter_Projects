import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travel_app/Models/trip.dart';
import '../app_data.dart';

class TripDetailScreen extends StatelessWidget {
  // const TripDetailScreen({super.key});
  static const screenRoute = '/trip-detail';
  final Function manageFavorite;
  final Function isFavorite;
  TripDetailScreen(this.manageFavorite, this.isFavorite);

  Widget sectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget listViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedTrip.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            sectionTitle(context, 'الانشطة'),
            listViewContainer(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            sectionTitle(context, 'البرنامج اليومي'),
            listViewContainer(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('يوم ${index + 1}'),
                      ),
                      title: Text(selectedTrip.program[index]),
                    ),
                    Divider()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(tripId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => manageFavorite(tripId),
      ),
    );
  }
}

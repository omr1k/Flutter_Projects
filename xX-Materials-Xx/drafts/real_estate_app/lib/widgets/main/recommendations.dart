import 'package:flutter/material.dart';
import 'package:real_estate_app/const.dart';
import 'package:real_estate_app/models/recommendation.dart';

class Recommendations extends StatelessWidget {
  const Recommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Client Reccommindation',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                demoRecommendations.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: kDefaultPadding),
                  child: RecommendationCard(
                    recommendation: demoRecommendations[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    super.key, required this.recommendation,
  });
  final Recommendation recommendation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.all(kDefaultPadding),
      color: kSecondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(recommendation.image!),
            ),
            title: Text(
              recommendation.name!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text(
              recommendation.source!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Text(
            demoRecommendations[0].text!,
            maxLines: 4,
            style: TextStyle(height: 1.5),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

// children: [
//               List.generate(demoRecommendations.length, (index) => Padding(
//                 padding: const EdgeInsets.only(right: kDefaultPadding),
//                 child: Container(
//                   color: Colors.green,
//                 ),
//               ),
//               ),
//             ],
import 'package:film_fusion/widgets/build_movie_screen.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'build_trendingnow_element.dart';

class trendingNowWidget extends StatelessWidget {
  const trendingNowWidget({super.key, required this.data});
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            top: 10,
            bottom: 5,
          ),
          child: Row(
            children: [
              Text(
                'Trending Now',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                'See more',
                style: TextStyle(
                  color: AppColors.lightGreen,
                  fontSize: 12,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 230,
            child: ListView.builder(
              itemCount: data.trendingNowMovies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BuildMovieScreen(movie: data.trendingNowMovies[index]),
                        ),
                      );
                    },
                    child:
                        BuildTrendingnowElement(movie: data.trendingNowMovies[index]));
              },
            ),
          ),
        ),
      ],
    );
  }
}

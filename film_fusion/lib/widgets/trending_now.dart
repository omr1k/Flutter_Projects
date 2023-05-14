// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:film_fusion/widgets/build_movie_screen.dart';
import 'package:film_fusion/widgets/build_seemore_screen.dart';

import '../constants/app_colors.dart';
import '../models/movie.dart';
import 'build_trendingnow_element.dart';

class trendingNowWidget extends StatelessWidget {
  const trendingNowWidget({
    Key? key,
    required this.movies,
  }) : super(key: key);
  final List<Movie> movies;
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
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuildSeeMoreScreen(),
                    ),
                  );
                },
                child: Text(
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
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 230,
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuildMovieScreen(
                              movie: movies[index]),
                        ),
                      );
                    },
                    child: BuildTrendingnowElement(
                        movie: movies[index]));
              },
            ),
          ),
        ),
      ],
    );
  }
}

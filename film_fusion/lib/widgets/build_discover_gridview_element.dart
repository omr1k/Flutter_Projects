import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/api_constants.dart';
import '../constants/app_colors.dart';
import '../models/movie.dart';
import 'build_movie_screen.dart';

class BuildDiscoverGridViewElement extends StatelessWidget {
  const BuildDiscoverGridViewElement({
    super.key,
    required this.movie,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 180,
          margin: EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BuildMovieScreen(movie: movie),
                  ),
                );
              },
              child: CachedNetworkImage(
                imageUrl: ApiConstants.posterImageBaseUrl + movie.posterPath,
                fit: BoxFit.cover,
                placeholder: (context, url) => SpinKitPouringHourGlassRefined(
                  color: AppColors.lightGreen,
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error), // optional error widget
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          alignment: Alignment.center,
          child: Text(
            movie.originalTitle,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.white,
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
        )
      ],
    );
  }
}

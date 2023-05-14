// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_fusion/widgets/build_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:film_fusion/constants/api_constants.dart';
import 'package:film_fusion/constants/app_colors.dart';
import 'package:film_fusion/models/movie.dart';
import 'package:film_fusion/utils/network_manger.dart';
import 'package:film_fusion/widgets/build_movie_rating_view.dart';

import '../core/movie_notifier.dart';
import '../utils/year_extrctor.dart';

class BuildMovieScreen extends StatelessWidget {
  BuildMovieScreen({Key? key, required this.movie}) : super(key: key);

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CachedNetworkImage(
              imageUrl: ApiConstants.posterImageBaseUrl + movie.backdropPath,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.5,
              fit: BoxFit.cover,
              placeholder: (context, url) => SpinKitPouringHourGlassRefined(
                color: AppColors.lightGreen,
              ),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error), // optional error widget
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColors.darkBlue,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 0.5],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            child: IconButton(
              iconSize: 25,
              icon: Icon(Icons.arrow_circle_left_outlined,
                  color: AppColors.white),
              onPressed: () {
                Navigator.pop(context);
                // add your desired functionality here
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.2,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        extractYearFromDate(movie.releaseDate) +
                            '    Flutter Studios',
                        style: TextStyle(
                            color: AppColors.lightGreen,
                            fontSize: 15,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        movie.title,
                        maxLines: 2,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        movie.overview,
                        maxLines: 2,
                        style: TextStyle(
                          color: AppColors.lightGreen,
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
                      SizedBox(height: 10),
                      Row(
                        children: [
                          BuildMovieRatingView(startSize: 15, fontSize: 10),
                          Spacer(),
                          Consumer<MovieNotifier>(
                              builder: (context, movieNotifier, child) {
                            return IconButton(
                              iconSize: 30,
                              color: movie.isFav ? Colors.red : Colors.white,
                              onPressed: () {
                                Provider.of<MovieNotifier>(context,
                                        listen: false)
                                    .addToFavList(movie);
                              },
                              icon: Icon(movie.isFav
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                            );
                          })
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Trailer 🍿",
                        style: TextStyle(
                          color: AppColors.lightGreen,
                          fontSize: 35,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: FutureBuilder<String>(
                          future: NetworkManager.getMovieTrilerUrl(movie.id),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return BuildVideoPlayer(videoID: snapshot.data!);
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else {
                              return Center(
                                child: SpinKitPouringHourGlassRefined(
                                  color: AppColors.lightGreen,
                                ),
                              );
                            }
                          },
                        ),
                      )
                    ],
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

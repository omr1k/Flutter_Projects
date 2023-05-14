import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_fusion/core/movie_notifier.dart';
import 'package:film_fusion/utils/year_extrctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../constants/api_constants.dart';
import '../constants/app_colors.dart';
import '../widgets/build_movie_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.of<MovieNotifier>(context).faveMovies.length == 0
        ? Center(
            child: Text(
              "No Favorites Movies",
              style: TextStyle(
                color: AppColors.lightGreen,
                fontSize: 20,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                  ),
                ],
              ),
              maxLines: 3,
            ),
          )
        : favScreenBody();
  }
}

class favScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = screenSize.width * 0.0025;
    return SafeArea(
      child: Consumer<MovieNotifier>(
        builder: (context, moviesData, child) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Favorites ❤️",
                    style: TextStyle(
                      color: AppColors.lightGreen,
                      fontSize: screenSize.width * 0.12,
                    fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: textScaleFactor,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuildMovieScreen(
                                    movie: moviesData.faveMovies[index]),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                border: Border.all(
                                  color: AppColors.lightGreen.withOpacity(0.6),
                                  width: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 150,
                                      margin: EdgeInsets.all(5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              ApiConstants.posterImageBaseUrl +
                                                  moviesData.faveMovies[index]
                                                      .posterPath,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              SpinKitPouringHourGlassRefined(
                                            color: AppColors.lightGreen,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons
                                                  .error), // optional error widget
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              moviesData
                                                  .faveMovies[index].title,
                                              style: TextStyle(
                                                color: AppColors.lightGreen,
                                                fontSize: 20,
                                                shadows: [
                                                  Shadow(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    offset: Offset(2.0, 2.0),
                                                    blurRadius: 3.0,
                                                  ),
                                                ],
                                              ),
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                              textScaleFactor: textScaleFactor,
                                            ),
                                            Text(
                                              extractYearFromDate(moviesData
                                                      .faveMovies[index]
                                                      .releaseDate) +
                                                  " Flutter Studios",
                                              style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 13,
                                                shadows: [
                                                  Shadow(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    offset: Offset(2.0, 2.0),
                                                    blurRadius: 3.0,
                                                  ),
                                                ],
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textScaleFactor: textScaleFactor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: moviesData.faveMovies.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

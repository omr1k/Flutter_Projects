// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_fusion/widgets/refresh_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:film_fusion/models/movie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/api_constants.dart';
import '../constants/app_colors.dart';
import '../core/movie_notifier.dart';
import 'build_movie_screen.dart';
import '../utils/random_sentences_generator.dart';
import '../utils/year_extrctor.dart';
import 'build_movie_rating_view.dart';

class BuildMoviesBanner extends StatefulWidget {
  BuildMoviesBanner({Key? key, required this.bannerHight, required this.movies})
      : super(key: key);

  final List<Movie> movies;
  final double bannerHight;

  @override
  State<BuildMoviesBanner> createState() => _BuildMoviesBannerState();
}

class _BuildMoviesBannerState extends State<BuildMoviesBanner> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentPage <
          Provider.of<MovieNotifier>(context, listen: false).movies.length -
              1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieNotifier>(
      builder: (context, moviesData, child) {
        return Stack(
          children: [
            Container(
              height: widget.bannerHight,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.movies.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BuildMovieScreen(movie: widget.movies[index]),
                        ),
                      );
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.center,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.5),
                              ],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.darken,
                          child: CachedNetworkImage(
                            imageUrl: ApiConstants.posterImageBaseUrl +
                                widget.movies[index].backdropPath,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                SpinKitPouringHourGlassRefined(
                              color: AppColors.lightGreen,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error), // optional error widget
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  extractYearFromDate(
                                          widget.movies[index].releaseDate) +
                                      ', Flutter Studios',
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
                                  widget.movies[index].title,
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
                                  getRandomSentence(),
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
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    BuildMovieRatingView(
                                        startSize: 24, fontSize: 10),
                                    Spacer(),
                                    IconButton(
                                      iconSize: 30,
                                      color: widget.movies[index].isFav
                                          ? Colors.red
                                          : Colors.white,
                                      onPressed: () {
                                        Provider.of<MovieNotifier>(context,
                                                listen: false)
                                            .addToFavList(widget.movies[index]);
                                      },
                                      icon: Icon(widget.movies[index].isFav
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.04,
              child: Row(
                children: [
                  RefreshButton(
                    onPressed: () {
                      Provider.of<MovieNotifier>(context, listen: false)
                          .updateAllMovies();
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.6,
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'This App Powered by Flutter',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Container(
                                    height: 80.0,
                                    width: 80.0,
                                    child: Image.network(
                                      'https://logowik.com/content/uploads/images/flutter5786.jpg',
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  TextButton(
                                    onPressed: () {
                                      launchUrl(
                                        Uri.parse(
                                            "https://github.com/omr1k/Flutter_Projects/tree/main/film_fusion"),
                                      );
                                    },
                                    child: Text(
                                      'Check App on Github',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    "By Omar Khattab",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              actions: <Widget>[
                                Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'OK',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.info,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 25,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: moviesData.movies.length > 0 ? 10 : 0,
                    effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        dotColor: AppColors.white,
                        activeDotColor: AppColors.lightGreen),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:film_fusion/constants/app_colors.dart';
import '../core/movie_notifier.dart';
import '../widgets/build_movies_banner.dart';
import '../widgets/trending_now.dart';
import '../widgets/discover_gridview.dart';

const double kpadding = 25.0;

class VodScreen extends StatefulWidget {
  static const screenRoute = '/home_screen';

  @override
  State<VodScreen> createState() => _VodScreenState();
}

class _VodScreenState extends State<VodScreen> {
  @override
  void initState() {
    Provider.of<MovieNotifier>(context, listen: false).getAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double moviesHomeScreenBannerHeight = screenHeight / 2;
    double remainingHeight = screenHeight - moviesHomeScreenBannerHeight;
    return SafeArea(
      top: false,
      bottom: false,
      child: Consumer<MovieNotifier>(
        builder: (context, data, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: [
                BuildMoviesBanner(
                    movies: data.movies,
                    bannerHight: moviesHomeScreenBannerHeight),
                Container(
                  height: data.movies.length == 0
                      ? remainingHeight +
                          MediaQuery.of(context).size.height / 2.2
                      : null,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.2),
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      trendingNowWidget(movies: data.trendingNowMovies),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.18,
                        child: Divider(
                          color: AppColors.lightGreen.withOpacity(0.2),
                        ),
                      ),
                      discoverGridView(movies: data.dicoverMovies)
                    ],
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

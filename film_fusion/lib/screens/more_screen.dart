import 'package:film_fusion/core/movie_notifier.dart';
import 'package:film_fusion/widgets/build_seemore_screen.dart';
import 'package:film_fusion/widgets/build_trendingnow_element.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../widgets/discover_gridview.dart';
import '../widgets/refresh_button.dart';
import '../widgets/trending_now.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<MovieNotifier>(
          builder: (context, data, child) {
            return Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, top: 8),
                    child: Text(
                      "More For You 😊",
                      style: TextStyle(
                        color: AppColors.lightGreen,
                        fontSize: 25,
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
                  ),
                ),
                trendingNowWidget(
                  movies: data.dicoverMovies,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.18,
                  child: Divider(
                    color: AppColors.lightGreen.withOpacity(0.2),
                  ),
                ),
                discoverGridView(movies: data.trendingNowMovies),
              ],
            );
          },
        ),
      ),
    );
  }
}

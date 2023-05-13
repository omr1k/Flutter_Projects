import 'package:film_fusion/models/movie.dart';
import 'package:flutter/material.dart';
import 'build_discover_gridview_element.dart';
import '../constants/app_colors.dart';

class discoverGridView extends StatelessWidget {
  const discoverGridView({
    super.key,
    required this.movies,
  });
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 5
            ),
            child: Row(
              children: [
                Text(
                  'Discover',
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
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: movies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return BuildDiscoverGridViewElement(movie: movies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

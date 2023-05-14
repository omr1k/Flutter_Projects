import 'package:film_fusion/widgets/build_discover_gridview_element.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../core/movie_notifier.dart';

class BuildSeeMoreScreen extends StatelessWidget {
  const BuildSeeMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkBlue,
        extendBody: true,
        body: Provider.of<MovieNotifier>(context).seeMoreMovies.length == 0
            ? Center(
                child: Text(
                  "No Available Movies",
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
            : seeMoreBody());
  }
}

class seeMoreBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    iconSize: 25,
                    icon: Icon(Icons.arrow_circle_left_outlined,
                        color: AppColors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(),
                  Text(
                    "See More 🎬",
                    style: TextStyle(
                      color: AppColors.lightGreen,
                      fontSize: 25,
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
                itemCount:
                    Provider.of<MovieNotifier>(context).seeMoreMovies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 0.5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return BuildDiscoverGridViewElement(
                      movie: Provider.of<MovieNotifier>(context)
                          .seeMoreMovies[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

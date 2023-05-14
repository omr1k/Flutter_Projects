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
    )

        // Consumer<MovieNotifier>(
        //   builder: (context, moviesData, child) {
        //     return Padding(
        //       padding: const EdgeInsets.only(
        //         left: 20,
        //         right: 20,
        //       ),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(top: 10),
        //             child: Text(
        //               "Discover More 🎬",
        //               style: TextStyle(
        //                 color: AppColors.lightGreen,
        //                 fontSize: 25,
        //                 shadows: [
        //                   Shadow(
        //                     color: Colors.black.withOpacity(0.5),
        //                     offset: Offset(2.0, 2.0),
        //                     blurRadius: 3.0,
        //                   ),
        //                 ],
        //               ),
        //               maxLines: 1,
        //               overflow: TextOverflow.ellipsis,
        //               textScaleFactor: textScaleFactor,
        //             ),
        //           ),
        //           Expanded(
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(vertical: 15),
        //               child: ListView.builder(
        //                 itemBuilder: (BuildContext context, int index) {
        //                   return GestureDetector(
        //                     onTap: () {
        //                       Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                           builder: (context) => BuildMovieScreen(
        //                               movie: moviesData.seeMoreMovies[index]),
        //                         ),
        //                       );
        //                     },
        //                     child: Padding(
        //                       padding: const EdgeInsets.only(top: 25),
        //                       child: Container(
        //                         decoration: BoxDecoration(
        //                           color: AppColors.lightGrey,
        //                           border: Border.all(
        //                             color: AppColors.lightGreen.withOpacity(0.6),
        //                             width: 0.1,
        //                           ),
        //                           borderRadius: BorderRadius.circular(15.0),
        //                         ),
        //                         child: ListTile(
        //                           title: Row(
        //                             children: [
        //                               Container(
        //                                 width: 100,
        //                                 height: 150,
        //                                 margin: EdgeInsets.all(5),
        //                                 child: ClipRRect(
        //                                   borderRadius: BorderRadius.circular(10),
        //                                   child: CachedNetworkImage(
        //                                     imageUrl:
        //                                         ApiConstants.posterImageBaseUrl +
        //                                             moviesData
        //                                                 .seeMoreMovies[index]
        //                                                 .posterPath,
        //                                     fit: BoxFit.cover,
        //                                     placeholder: (context, url) =>
        //                                         SpinKitPouringHourGlassRefined(
        //                                       color: AppColors.lightGreen,
        //                                     ),
        //                                     errorWidget: (context, url, error) =>
        //                                         Icon(Icons
        //                                             .error), // optional error widget
        //                                   ),
        //                                 ),
        //                               ),
        //                               Expanded(
        //                                 child: Padding(
        //                                   padding:
        //                                       const EdgeInsets.only(left: 10),
        //                                   child: Column(
        //                                     crossAxisAlignment:
        //                                         CrossAxisAlignment.start,
        //                                     children: [
        //                                       Text(
        //                                         moviesData
        //                                             .seeMoreMovies[index].title,
        //                                         style: TextStyle(
        //                                           color: AppColors.lightGreen,
        //                                           fontSize: 20,
        //                                           shadows: [
        //                                             Shadow(
        //                                               color: Colors.black
        //                                                   .withOpacity(0.5),
        //                                               offset: Offset(2.0, 2.0),
        //                                               blurRadius: 3.0,
        //                                             ),
        //                                           ],
        //                                         ),
        //                                         maxLines: 5,
        //                                         overflow: TextOverflow.ellipsis,
        //                                         textScaleFactor: textScaleFactor,
        //                                       ),
        //                                       Text(
        //                                         extractYearFromDate(moviesData
        //                                                 .seeMoreMovies[index]
        //                                                 .releaseDate) +
        //                                             " Flutter Studios",
        //                                         style: TextStyle(
        //                                           color: AppColors.white,
        //                                           fontSize: 13,
        //                                           shadows: [
        //                                             Shadow(
        //                                               color: Colors.black
        //                                                   .withOpacity(0.5),
        //                                               offset: Offset(2.0, 2.0),
        //                                               blurRadius: 3.0,
        //                                             ),
        //                                           ],
        //                                         ),
        //                                         maxLines: 2,
        //                                         overflow: TextOverflow.ellipsis,
        //                                         textScaleFactor: textScaleFactor,
        //                                       ),
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   );
        //                 },
        //                 itemCount: moviesData.seeMoreMovies.length,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        // ),
        );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/five_days_data.dart';
import '../models/weatherProvider.dart';

class AppChart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            LineSeries<Data, String>(
              dataSource:  Provider.of<WeatherProvider>(context).fiveDaysData[0].list,
              xValueMapper: (Data data, _) => data.dateTime,
              yValueMapper: (Data data, _) => data.temperature,
            ),
          ],
        ),
      ),
    );
  }
}



















// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:weather_app/models/weatherProvider.dart';

// import '../models/five_days_data.dart';

// class AppChart extends StatelessWidget {
//   const AppChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 240,
//       child: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: SfCartesianChart(
//           primaryXAxis: CategoryAxis(),
//           series: <ChartSeries<FiveDaysData, String>>[
//             SplineSeries<FiveDaysData, String>(
//               dataSource: Provider.of<WeatherProvider>(context).fiveDaysData,
//               xValueMapper: (FiveDaysData en, _) => en.,
//               yValueMapper: (FiveDaysData en, _) => en.entries[0].dtTxt,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



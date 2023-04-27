import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/five_days_data.dart';
import '../models/weatherProvider.dart';

class AppChart extends StatelessWidget {
  AppChart({
    super.key,
    required this.whichChart,
  });
  final String whichChart;

  @override
  Widget build(BuildContext context) {
    // Here we using string to conditionally changing the chart it is not best practice but just for UI difference purposes
    if (whichChart == "Real") {
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
                dataSource:
                    Provider.of<WeatherProvider>(context).fiveDaysData[0].list,
                xValueMapper: (Data data, _) => data.dateTime,
                yValueMapper: (Data data, _) => data.temperature,
              ),
            ],
          ),
        ),
      );
    } else {
      List<Data> originalList =
          Provider.of<WeatherProvider>(context).fiveDaysData[0].list;

      List<Data> copiedList = List.from(
        originalList.map(
          (data) => Data(temperature: data.temperature, dateTime: data.dateTime
              // copy other properties here
              ),
        ),
      );
      
      copiedList.forEach(
        (element) {
          element.temperature += 550;
        },
      );
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
                dataSource: copiedList,
                xValueMapper: (Data data, _) => data.dateTime,
                yValueMapper: (Data data, _) => data.temperature,
              ),
            ],
          ),
        ),
      );
    }
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

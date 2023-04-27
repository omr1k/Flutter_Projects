class FiveDaysData {
  final List<Data> list;

  FiveDaysData({required this.list});

  factory FiveDaysData.fromJson(Map<String, dynamic> json) {
    final list = json['list'] as List<dynamic>;
    final finalData = list.map((e) => Data.fromJson(e)).toList();
    return FiveDaysData(list: finalData);
  }
}

class Data {
  num temperature;
  final String dateTime;

  Data({required this.temperature, required this.dateTime});

  factory Data.fromJson(Map<String, dynamic> json) {
    var f = json['dt_txt'].split(' ')[0].split('-')[2];
    var l = json['dt_txt'].split(' ')[1].split(':')[0];
    var fandl = '$f-$l';

    return Data(
      temperature: json['main']['temp'],
      dateTime: '$fandl',
    );
  }
}


























// import 'dart:convert';

// class FiveDaysData {
//   List<WeatherEntry> entries;

//   FiveDaysData({
//     required this.entries,
//   });

//   factory FiveDaysData.fromJson(String jsonStr) {
//     final jsonMap = json.decode(jsonStr);
//     final list = (jsonMap['list'] as List)
//         .map((entryJson) => WeatherEntry.fromJson(entryJson))
//         .toList();
//     return FiveDaysData(
//       entries: list,
//     );
//   }
// }

// class WeatherEntry {
//   num temp;
//   String dtTxt;

//   WeatherEntry({
//     required this.temp,
//     required this.dtTxt,
//   });

//   factory WeatherEntry.fromJson(Map<String, dynamic> json) {
//     return WeatherEntry(
//       temp: json['main']['temp'],
//       dtTxt: json['dt_txt'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'temp': temp,
//         'dt_txt': dtTxt,
//       };
// }

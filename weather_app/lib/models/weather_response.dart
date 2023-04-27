class WeatherResponse {
  Coord? coord;
  List<Weather> weather;
  String? base;
  Main main;
  num visibility;
  Wind wind;
  Clouds clouds;
  num? dt;
  Sys? sys;
  num? timezone;
  num id;
  String name;
  num cod;

  WeatherResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    // required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      coord: Coord.fromJson(json['coord']),
      weather: (json['weather'] as List)
          .map((weatherJson) => Weather.fromJson(weatherJson))
          .toList(),
      base: json['base'] as String,
      main: Main.fromJson(json['main']),
      visibility: json['visibility'] as num,
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'] as num,
      // sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'] as num,
      id: json['id'] as num,
      name: json['name'] as String,
      cod: json['cod'] as num,
    );
  }
}

class Coord {
  num? lon;
  num? lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'] as num,
      lat: json['lat'] as num,
    );
  }
}

class Weather {
  num id;
  String main;
  String description;
  String icon;

  Weather(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'] as num,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );
  }
}

class Main {
  num temp;
  num feelsLike;
  num tempMin;
  num tempMax;
  num pressure;
  num humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'] as num,
      feelsLike: json['feels_like'] as num,
      tempMin: json['temp_min'] as num,
      tempMax: json['temp_max'] as num,
      pressure: json['pressure'] as num,
      humidity: json['humidity'] as num,
    );
  }
}

class Wind {
  num speed;
  num deg;

  Wind({required this.speed, required this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'] as num,
      deg: json['deg'] as num,
    );
  }
}

class Clouds {
  num all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'] as num,
    );
  }
}

class Sys {
  num? type;
  num? id;
  String? country;
  num? sunrise;
  num? sunset;

  Sys(
      {required this.type,
      required this.id,
      required this.country,
      required this.sunrise,
      required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json['type'] as num , 
      id: json['id'] as num, 
      country: json['country'] as String, 
      sunrise: json['sunrise'] as num, 
      sunset: json['sunset'] as num);
  }
}

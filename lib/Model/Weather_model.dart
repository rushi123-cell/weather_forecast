class WeatherModel {
  final double temp;
  final String cityname;
  final String description;
  final String icon;
  final String wind;
  final String humidity;

  WeatherModel(
      {required this.temp,
      required this.cityname,
      required this.description,
      required this.icon,
      required this.wind,
      required this.humidity});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json['main']['temp'],
      cityname: json['name'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      wind: json['wind']['speed'],
      humidity: json['main']['humidity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': cityname,
      'main': {
        'temp': temp,
        'humidity': humidity,
      },
      'weather': [
        {
          'description': description,
          'icon': icon,
        }
      ],
      'wind': {
        'speed': wind,
      }
    };
  }
}

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
      temp: json['list'][0]['main']['temp'],
      cityname: json['list'][0]['name'],
      description: json['list'][0]['weather'][0]['description'],
      icon: json['list'][0]['weather'][0]['icon'],
      wind: json['list'][0]['wind']['speed'],
      humidity: json['list'][0]['main']['humidity'],
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

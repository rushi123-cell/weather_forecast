import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../Model/Weather_model.dart';

class WeatherService {
  final String apikey = "f4c7f75bfdcb13bb079cb2fca5707cb3";

  Future<dynamic> fetchWeather(String city) async {
    final weatherurl =
        "https://api.openweathermap.org/data/2.5/find?q=$city&appid=$apikey&units=metric";

    log("API URL = $weatherurl");

    try {
      final response = await http.get(
        Uri.parse(weatherurl),
      );

      if (response.statusCode == 200) {
        log("Response Status Code = ${response.statusCode}");
        log("Response Body = ${response.body}");
        final decode = jsonDecode(response.body);
        log("Response Body = ${response.body}");
        return WeatherModel.fromJson(decode);
      } else {
        log("Error Status Code = ${response.statusCode}");
        log("Error Body = ${response.body}");
      }
    } catch (e) {
      log("Exception in fetching weather = $e");
      throw Exception("Exception in fetching weather = $e");
    }
  }
}

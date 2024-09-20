import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_practical/Model/Weather_model.dart';
import 'package:weather_practical/Services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  WeatherService _weatherService = WeatherService();
  WeatherModel? _weatherModel;
  String? _errormsg;
  bool _isLoding = false;

  WeatherModel? get weatherModel => _weatherModel;

  String? get errormsg => _errormsg;

  bool get isLoading => _isLoding;

  Future<void> fetchWeather(String city) async {
    _isLoding = true;
    _errormsg = null;
    notifyListeners();

    try {
      _weatherModel = await _weatherService.fetchWeather(city);
      cachedWeather(_weatherModel!);
    } catch (error) {
      _errormsg = errormsg.toString();
      _weatherModel = null;
    }

    _isLoding = false;
    notifyListeners();
  }

  Future<void> loadWeather() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedWeather = prefs.getString('cached_weather');
    if (cachedWeather != null) {
      _weatherModel = WeatherModel.fromJson(
        jsonDecode(cachedWeather),
      );
      notifyListeners();
    }
  }

  Future<void> cachedWeather(WeatherModel weatherModel) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'cached_weather',
      jsonEncode(
        weatherModel.toJson(),
      ),
    );
  }
}

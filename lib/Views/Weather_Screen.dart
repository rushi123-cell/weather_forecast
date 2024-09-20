import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_practical/Repository/weather_provider.dart';
import 'package:weather_practical/Views/widget/weather_card.dart';

class WeatherScreen extends StatelessWidget {
  // const WeatherScreen({super.key});

  TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text(
            "Weather Forecast",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter City",
                  prefixIcon: const Icon(
                    Icons.location_city,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  log("City = ${_cityController.text}");
                  weatherProvider.fetchWeather(_cityController.text);
                },
                child: const Text("Get Weather"),
              ),
              const SizedBox(
                height: 20,
              ),
              weatherProvider.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : weatherProvider.errormsg != null
                      ? WeatherCard(
                          cityname:
                              weatherProvider.weatherModel?.cityname.toString(),
                          temp: weatherProvider.weatherModel?.temp,
                          description: weatherProvider.weatherModel?.description
                              .toString(),
                          icon: weatherProvider.weatherModel?.icon.toString(),
                          wind: weatherProvider.weatherModel?.wind.toString(),
                          humidity:
                              weatherProvider.weatherModel?.humidity.toString(),
                        )
                      : Center(
                          child: Text(weatherProvider.errormsg ?? ""),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}

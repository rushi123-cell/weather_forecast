import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_practical/Repository/weather_provider.dart';
import 'package:weather_practical/Views/Weather_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather Forecast',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: WeatherScreen(),
      ),
    );
  }
}

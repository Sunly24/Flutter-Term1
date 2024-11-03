import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: const Text("Weather Forecast"),
          centerTitle: false,
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WeatherCard(
                  weatherCondition: WeatherCondition.sunny,
                  min: 18,
                  max: 30,
                  dayOfWeek: 'Sun'),
              WeatherCard(
                  weatherCondition: WeatherCondition.rainy,
                  min: 10,
                  max: 20,
                  dayOfWeek: 'Mon'),
              WeatherCard(
                  weatherCondition: WeatherCondition.cloudy,
                  min: 15,
                  max: 26,
                  dayOfWeek: 'Tue'),
              WeatherCard(
                  weatherCondition: WeatherCondition.snowy,
                  min: -2,
                  max: 5,
                  dayOfWeek: 'Wed'),
              WeatherCard(
                  weatherCondition: WeatherCondition.snowy,
                  min: 0,
                  max: 10,
                  dayOfWeek: 'Thu'),
              WeatherCard(
                  weatherCondition: WeatherCondition.rainy,
                  min: 13,
                  max: 10,
                  dayOfWeek: 'Fri'),
              WeatherCard(
                  weatherCondition: WeatherCondition.cloudy,
                  min: 15,
                  max: 35,
                  dayOfWeek: 'Sat')
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final WeatherCondition weatherCondition;
  final double min;
  final double max;
  final String dayOfWeek;

  const WeatherCard({
    super.key,
    required this.weatherCondition,
    required this.min,
    required this.max,
    required this.dayOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              dayOfWeek,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Image.asset(
              weatherCondition.image,
              height: 40,
              width: 40,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 5),
            Text(
              '$min°C - $max°C',
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

enum WeatherCondition {
  sunny(image: 'assets/W4-S1/sunny.png'),
  rainy(image: 'assets/W4-S1/rainny.png'),
  cloudy(image: 'assets/W4-S1/cloudy.png'),
  snowy(image: 'assets/W4-S1/snowy.png');

  final String image;

  const WeatherCondition({required this.image});
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getweathercubit/getweathercubit.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPage();
}

class _WeatherPage extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    Weather weathermodel =
        BlocProvider.of<GetweatherCubit>(context).weatherModel!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [getThemeColor(weathermodel.status), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on),
                Text(
                  weathermodel.cityName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ],
            ),
            Text(
                '    Updated at  ${weathermodel.date.hour}:${weathermodel.date.minute}',
                style: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(164, 0, 0, 0))),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 300,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    '${weathermodel.temp.round()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 120),
                  ),
                  Positioned(
                    top: 75,
                    left: 150,
                    child: Image.network(
                      'https:${weathermodel.image}',
                      fit: BoxFit.fill,
                      height: 140,
                      width: 140,
                    ),
                  ),
                  Positioned(
                    top: 175,
                    left: 80,
                    child: Text(
                      weathermodel.status,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.white,
              ),
              width: 300,
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Max Temp',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${weathermodel.maxTemp.round()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Min Temp',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${weathermodel.minTemp.round()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

// DateTime stringtoDateTime(String value) {
//   return DateTime.parse(value);
// }

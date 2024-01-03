import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getweathercubit/getweathercubit.dart';
import 'package:weather/cubits/getweathercubit/getweatherstates.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetweatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<GetweatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetweatherCubit>(context)
                          .weatherModel
                          ?.status),
                ),
                home: const Home_page(),
              );
            },
          ),
        ));
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Patchy rain possible':
    case 'Patchy light rain ':
    case 'Light rain ':
    case 'Moderate rain ':
      return Colors.blue;
    case 'Patchy snow possible':
    case 'Patchy light snow ':
    case 'Light snow ':
    case 'Moderate snow ':
      return Colors.lightBlue;

    default:
      return Colors.blueGrey;
  }
}

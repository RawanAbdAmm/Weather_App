// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getweathercubit/getweathercubit.dart';
import 'package:weather/models/weather.dart';

Weather? weatherModel;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 24),
        child: TextField(
          onSubmitted: (val) async {
            var getWeathercubit = BlocProvider.of<GetweatherCubit>(context)
                .getWeather(cityName: val);

            Navigator.of(context).pop();
          },
          cursorHeight: 24,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            labelText: 'Search',
            hintText: 'Enter City Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            suffixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}

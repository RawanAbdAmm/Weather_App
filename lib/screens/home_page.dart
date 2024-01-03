import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getweathercubit/getweathercubit.dart';
import 'package:weather/cubits/getweathercubit/getweatherstates.dart';
import 'package:weather/screens/search.dart';
import 'package:weather/widgets/noweather.dart';
import 'package:weather/widgets/weather.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const SearchPage(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetweatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoweatherPage();
          } else if (state is WeatherLoadedState) {
            return  WeatherPage();
          } else {
            return const Center(child:  Text('Opps there was an error',style: TextStyle(fontSize: 25),));
          }
        },
      ),
    );
  }
}

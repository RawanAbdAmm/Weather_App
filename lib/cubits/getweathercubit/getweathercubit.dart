
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getweathercubit/getweatherstates.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/weather_dio.dart';

class GetweatherCubit extends Cubit<WeatherState> {
  // GetweatherCubit(super.InitialState());
  GetweatherCubit() : super(WeatherInitialState());
   Weather? weatherModel;

  getWeather({required String cityName}) async {
    try {
       weatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(cityname: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherfailureState());
    }
  }
}

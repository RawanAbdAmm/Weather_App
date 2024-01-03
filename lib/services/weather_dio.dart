
import 'package:weather/models/weather.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '6e68071a7e86459994995547232412%20';
  WeatherService(this.dio);


  Future<Weather> getCurrentWeather({required String cityname}) async {
    try {//dont have to check the statuscode because of Dio
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityname&days=1');

      Weather weatherModel = Weather.fromjson(response.data);
      return weatherModel;
     
    } on DioException catch (e) {
      final String errmesg=e.response?.data['error']['message']??'Oops there was an error.Try later!!';
     throw Exception(errmesg);
    }catch (e){
      throw Exception('Oops there was an error.Try later!!');
    }


  }
  
}

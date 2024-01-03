class Weather {
  Weather({
    required this.cityName,
    required this.date,
     this.image,
    required this.status,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
  });
  final String cityName;
  final DateTime date;
  final String? image;
  final String status;
  final double temp;
  final double maxTemp;
  final double minTemp;
  factory Weather.fromjson(json) {
    return Weather(
      cityName: json['location']['name'],
      date:DateTime.parse(json['current']['last_updated']) ,
      status: json['forecast']['forecastday'][0]['day']['condition']['text'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'], 
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}

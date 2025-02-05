import 'package:lxp_flutter_dart/services/weather_api_service.dart';

class WeatherRepo {
  final WeatherApiService _weatherApiService = WeatherApiService();
  getWeather() => _weatherApiService.getWeather();
}

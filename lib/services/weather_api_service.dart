import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lxp_flutter_dart/models/weather_models.dart';

// https://open-meteo.com/en/docs
class WeatherApiService {
  final String _baseUrl =
      'https://api.open-meteo.com/v1/forecast?latitude=1.2897&longitude=103.8501&hourly=temperature_2m&forecast_days=1';

  Future<WeatherResult> getWeather() async {
    final response = await http.get(Uri.parse(_baseUrl));
    print(json.decode(response.body)['latitude']);
    return WeatherResult.fromJson(json.decode(response.body));
  }
}

import 'package:flutter/material.dart';
import 'package:lxp_flutter_dart/models/weather_models.dart';
import 'package:lxp_flutter_dart/repositories/weather_repo.dart';

class ApiViewModel extends ChangeNotifier {
  ApiViewModel({required WeatherRepo weatherRepo}) : _weatherRepo = weatherRepo;

  final WeatherRepo _weatherRepo;

  WeatherResult _weatherResult = WeatherResult('', '');
  WeatherResult get weatherResult => _weatherResult;

  void getWeatherSync() {
    _weatherRepo.getWeather().then((value) {
      _weatherResult = value;
      notifyListeners();
    });
  }

  void getWeatherAsync() async {
    _weatherResult = WeatherResult.fromJson(await _weatherRepo.getWeather());
    notifyListeners();
  }
}

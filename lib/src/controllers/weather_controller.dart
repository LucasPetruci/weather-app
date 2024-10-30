import 'package:flutter/material.dart';
import 'package:weather_app/src/model/daily_weather_model.dart';
import 'package:weather_app/src/services/weather_api_service.dart';

import '../model/weather_model.dart';

class WeatherController with ChangeNotifier {
  final WeatherApiService weatherApiService;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  WeatherController({required this.weatherApiService});

  Future<List<dynamic>> getCities(String cityName) async {
    setLoading(true);
    try {
      final response = await weatherApiService.getCities(cityName);
      return response;
    } catch (e) {
      print("Erro ao buscar cidades: $e");
      throw Exception('Erro ao buscar cidades');
    } finally {
      setLoading(false);
    }
  }

  Future<Map<String, dynamic>> getWeatherByCity(String cityId) async {
    setLoading(true);
    try {
      final response = await weatherApiService.getWeatherByCity(cityId);

      final hourlyData = response['hourly']['data'] as List;
      final dailyData = response['daily']['data'] as List;

      if (hourlyData.isEmpty || dailyData.length <= 1) {
        throw Exception('Dados insuficientes disponíveis.');
      }
      final WeatherModel weatherModel = WeatherModel.fromJson(hourlyData.first);
      final List<DailyWeatherModel> dailyWeatherList = dailyData
          .skip(
              1) //skip first element bc it's the same as the first hourly data
          .map((item) => DailyWeatherModel.fromJson(item))
          .toList();

      return {
        'current': weatherModel,
        'daily': dailyWeatherList,
      };
    } catch (e) {
      print("Erro ao buscar clima: $e");
      throw Exception('Erro ao buscar clima');
    } finally {
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    _isLoading = value;
    print('Loading state changed: $isLoading');
    notifyListeners();
  }
}

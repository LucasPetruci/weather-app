import 'package:flutter/foundation.dart';

class WeatherModel {
  //hourly data
  final String hourlyData;
  final String hourlyWeather;
  final int hourlyIcon;
  final double hourlyTemperature;
  final double hourlyWindSpeed;
  final int hourlyCloudCover;
  final double hourlyPrecipitation;

  WeatherModel({
    required this.hourlyData,
    required this.hourlyWeather,
    required this.hourlyIcon,
    required this.hourlyTemperature,
    required this.hourlyWindSpeed,
    required this.hourlyCloudCover,
    required this.hourlyPrecipitation,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      hourlyData: json['date'] ?? '',
      hourlyWeather: json['weather'] ?? 'not_available',
      hourlyIcon: json['icon'] ?? 1,
      hourlyTemperature: json['temperature'] ?? 0.0,
      hourlyWindSpeed: json['wind']['speed'] ?? 0.0,
      hourlyCloudCover: json['cloud_cover']['total'] ?? 0,
      hourlyPrecipitation: json['precipitation']['total'] ?? 0.0,
    );
  }

  @override
  String toString() {
    return '''
    WeatherModel {
      date: $hourlyData,
      weather: $hourlyWeather,
      icon: $hourlyIcon,
      temperature: $hourlyTemperature °C,
      windSpeed: $hourlyWindSpeed km/h,
      cloudCover: $hourlyCloudCover%,
      precipitation: $hourlyPrecipitation mm
    }''';
  }

  static final Map<int, String> weatherIcons = {
    1: 'assets/icons/1.png',
    2: 'assets/icons/2.png',
    3: 'assets/icons/3.png',
    4: 'assets/icons/4.png',
    5: 'assets/icons/5.png',
    6: 'assets/icons/6.png',
    7: 'assets/icons/7.png',
    8: 'assets/icons/8.png',
    9: 'assets/icons/9.png',
    10: 'assets/icons/10.png',
    11: 'assets/icons/11.png',
    12: 'assets/icons/12.png',
    13: 'assets/icons/13.png',
    14: 'assets/icons/14.png',
    15: 'assets/icons/15.png',
    16: 'assets/icons/16.png',
    17: 'assets/icons/17.png',
    18: 'assets/icons/18.png',
    19: 'assets/icons/19.png',
    20: 'assets/icons/20.png',
    21: 'assets/icons/21.png',
    22: 'assets/icons/22.png',
    23: 'assets/icons/23.png',
    24: 'assets/icons/24.png',
    25: 'assets/icons/25.png',
    26: 'assets/icons/26.png',
    27: 'assets/icons/27.png',
    28: 'assets/icons/28.png',
    29: 'assets/icons/29.png',
    30: 'assets/icons/30.png',
    31: 'assets/icons/31.png',
    32: 'assets/icons/32.png',
    33: 'assets/icons/33.png',
    34: 'assets/icons/34.png',
    35: 'assets/icons/35.png',
    36: 'assets/icons/36.png',
  };

  static final Map<String, String> translateWeather = {
    'not_available': 'Não disponível',
    'sunny': 'Ensolarado',
    'mostly_sunny': 'Principalmente ensolarado',
    'partly_sunny': 'Parcialmente ensolarado',
    'mostly_cloudy': 'Principalmente nublado',
    'cloudy': 'Nublado',
    'overcast': 'Encoberto',
    'overcast_w_low_clds': 'Encoberto com nuvens baixas',
    'fog': 'Neblina',
    'light_rain': 'Chuva leve',
    'rain': 'Chuva',
    'psbl_rain': 'Possibilidade de chuva',
    'rain_shower': 'Chuva de banho',
    'tstorm': 'Tempestade',
    'tstorm_shower': 'Tempestade local',
    'light_snow': 'Neve leve',
    'snow': 'Neve',
    'psbl_snow': 'Possibilidade de neve',
    'snow_shower': 'Neve de banho',
    'rain_and_snow': 'Chuva e neve',
    'psbl_rain_and_snow': 'Possibilidade de chuva e neve',
    'fr_rain': 'Chuva congelante',
    'psbl_fr_rain': 'Possibilidade de chuva congelante',
    'hail': 'Granizo',
    'clear': 'Céu limpo',
    'mostly_clear': 'Principalmente limpo',
    'partly_clear': 'Parcialmente nublado',
    'mostly_cloudy_night': 'Principalmente nublado',
    'cloudy_night': 'Nublado',
    'overcast_with_low_clouds_night': 'Encoberto com nuvens baixas',
    'local_thunderstorms_night': 'Tempestades locais',
    'snow_shower_night': 'Neve de banho',
    'rain_and_snow_night': 'Chuva e neve',
  };

  static String getWeatherTranslation(String weather) {
    return translateWeather[weather] ?? 'Não disponível';
  }

  static String getWeatherIcon(int _weatherIconNum) {
    return weatherIcons[_weatherIconNum] ?? 'assets/icons/1.png';
  }
}

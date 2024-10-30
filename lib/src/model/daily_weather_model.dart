class DailyWeatherModel {
  final String day;
  final int icon;
  final int temperature;

  DailyWeatherModel({
    required this.day,
    required this.icon,
    required this.temperature,
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      day: json['day'] ?? '',
      icon: json['icon'] ?? 0,
      temperature: (json['all_day']['temperature'] as num?)?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'DailyWeatherModel(day: $day, icon: $icon, temperature: $temperature°C)';
  }
}

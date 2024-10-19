import 'dart:convert';
import 'package:weather_app/constants.dart';
import 'package:http/http.dart' as http;

class WeatherApiService {
  //get cities names
  Future<List<dynamic>> getCities(String cityName) async {
    final url = Uri.parse(
        'https://www.meteosource.com/api/v1/free/find_places_prefix?text=$cityName&key=$api_key');

    print(url);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final decodeResponse = utf8.decode(response.bodyBytes);
        return jsonDecode(decodeResponse);
      } else {
        throw Exception('Cidade não encontrada: ${response.statusCode}');
      }
    } catch (e) {
      print("Erro ao buscar cidades: $e");
      throw Exception('Erro ao buscar cidades $e');
    }
  }

  //get weather by city
  Future<Map<String, dynamic>> getWeatherByCity(String cityId) async {
    //rota

    final url = Uri.parse(
        'https://www.meteosource.com/api/v1/free/point?place_id=$cityId&sections=all&timezone=UTC&language=en&units=metric&key=$api_key');

    print(url);
    //requisição
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final decodeResponse = utf8.decode(response.bodyBytes);

        return jsonDecode(decodeResponse);
      } else {
        throw Exception('Cidade não encontrada ${response.statusCode}');
      }
    } catch (e) {
      print("Erro ao buscar clima: $e");
      throw Exception('Erro ao buscar clima $e');
    }
  }
}

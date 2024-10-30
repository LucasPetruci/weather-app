import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/components/horizontal_carousel.dart';
import 'package:weather_app/src/components/loading.dart';
import 'package:weather_app/src/components/draggable_scroll.dart';
import 'package:weather_app/src/components/search_bar.dart';
import '../controllers/weather_controller.dart';
import '../model/daily_weather_model.dart';
import '../model/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  WeatherPageState createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {
  String _query = '';
  double _temperature = 0.0;
  String _name = '';
  String _weather = '';
  String _data = '';
  int _weatherIconNum = 0;
  bool isSearching = false;
  double _precipitation = 0.0;
  double _wind = 0.0;
  int _cloudCover = 0;
  List<Map<String, dynamic>> forecastData = [];

  void _performSearch(String query, String name) async {
    if (query.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Digite o nome da cidade.')),
      );
      return;
    }
    setState(() {
      _query = query;
      _name = name;
      isSearching = true;
    });

    final weatherController =
        Provider.of<WeatherController>(context, listen: false);

    try {
      final weatherData = await weatherController.getWeatherByCity(_query);

      final WeatherModel currentWeather = weatherData['current'];
      final List<DailyWeatherModel> dailyWeatherList = weatherData['daily'];

      print('dailyWeatherList: $dailyWeatherList');

      setState(() {
        _data = convertToBrazilianDate(currentWeather.hourlyData);
        _temperature = currentWeather.hourlyTemperature;
        _weather = currentWeather.hourlyWeather;
        _weatherIconNum = currentWeather.hourlyIcon;
        _precipitation = currentWeather.hourlyPrecipitation;
        _wind = currentWeather.hourlyWindSpeed;
        _cloudCover = currentWeather.hourlyCloudCover;

        //next days forecast
        forecastData = dailyWeatherList.map((item) {
          return {
            'dayOfWeek': item.day,
            'imgPath': WeatherModel.getWeatherIcon(item.icon),
            'temperature': item.temperature,
          };
        }).toList();
      });
    } catch (e) {
      print('Erro ao buscar clima: $e');
    }
  }

  String convertToBrazilianDate(String date) {
    final dateParts = date.split('-');
    print('dateParts: $dateParts');
    final day = dateParts[2].split('T')[0];
    return '$day/${dateParts[1]}';
  }

  @override
  Widget build(BuildContext context) {
    print("weather: $_weather");
    print('temperature: $_temperature');
    print('icon num: $_weatherIconNum');
    String iconPath = WeatherModel.getWeatherIcon(_weatherIconNum);
    String weatherTranslated = WeatherModel.getWeatherTranslation(_weather);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6E90F0),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchBar(onQuerySubmitted: _performSearch),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF3C72DC),
                  Color(0xFF6E90F0),
                ],
              ),
            ),
          ),
          Consumer<WeatherController>(
            builder: (context, weatherController, child) {
              if (weatherController.isLoading) {
                return const MyLoading();
              }

              if (isSearching && _weather.isNotEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, top: 24),
                      child: Text(
                        "Hoje, $_data",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        "Agora em $_name",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_temperature.toInt()}',
                              style: GoogleFonts.lato(
                                fontSize: 100,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: Text(
                                '°C',
                                style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              iconPath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    HorizontalCarousel(
                      precipitation: '$_precipitation%',
                      wind: '$_wind km/h',
                      cloudCover: '$_cloudCover%',
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Olá! Bem vindo ao Weather App, para começar, clique no ícone de busca no canto superior direito.',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "A api utilizada é a OpenWeatherMap, então você pode buscar por cidades do mundo inteiro!, porém ela só fornece dados 3 horas após a hora atual.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          MyDraggableScrollable(
            forecastData: forecastData,
          ),
          const Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Text(
              'Desenvolvido por Lucas Petruci © 2024',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

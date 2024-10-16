import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/components/horizontal_carousel.dart';
import 'package:weather_app/src/components/loading.dart';
import 'package:weather_app/src/components/search_bar.dart';
import '../controllers/weather_controller.dart';
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

  void _performSearch(String query, String name) async {
    setState(() {
      _query = query;
      _name = name;
      isSearching = true;
    });

    final weatherController =
        Provider.of<WeatherController>(context, listen: false);

    try {
      final dailyData = await weatherController.getDailyWeather(_query);
      final String originalDate = dailyData?['day'] ?? '';

      String formattedData = convertToBrazilianDate(originalDate);
      setState(() {
        _data = formattedData;
        _temperature = dailyData?['all_day']?['temperature']?.toDouble() ?? 0.0;
        _weather = dailyData?['all_day']?['weather'] ?? 'Unknown';
        _weatherIconNum = dailyData?['all_day']?['icon'] ?? 0;
        _precipitation =
            dailyData?['all_day']?['precipitation']?['total']?.toDouble() ??
                0.0;
        _wind = dailyData?['all_day']?['wind']?['speed']?.toDouble() ?? 0.0;
        _cloudCover = dailyData?['all_day']?['cloud_cover']?['total'] ?? 0;
      });
    } catch (e) {
      print('Erro ao buscar clima: $e');
    }
  }

  String convertToBrazilianDate(String date) {
    final dateParts = date.split('-');
    return '${dateParts[2]}/${dateParts[1]}';
  }

  @override
  Widget build(BuildContext context) {
    print("weather: $_weather");
    print('temperature: $_temperature');
    print('icon num: $_weatherIconNum');
    String iconPath = WeatherModel.getWeatherIcon(_weatherIconNum);
    String weatherTranslated = WeatherModel.getWeatherTranslation(_weather);

    print("path: $iconPath");
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
      body: Container(
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
        child: Consumer<WeatherController>(
          builder: (context, weatherController, child) {
            if (weatherController.isLoading) {
              return const MyLoading();
            }

            if (isSearching && _weather.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hoje, $_data",
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      "Agora em $_name",
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
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
                              '$_temperature',
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
                ),
              );
            } else {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Digite o nome de uma cidade para buscar o clima',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

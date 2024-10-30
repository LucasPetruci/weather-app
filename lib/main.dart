import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import correto
import 'package:provider/provider.dart';
import 'package:weather_app/src/pages/weather_page.dart';
import 'package:weather_app/src/services/weather_api_service.dart';

import 'src/components/scroll_behavior_mofied.dart';
import 'src/controllers/weather_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherController(
            weatherApiService: WeatherApiService(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollBehaviorModified(),
          child: child!,
        );
      },
      home: const WeatherPage(),
    );
  }
}

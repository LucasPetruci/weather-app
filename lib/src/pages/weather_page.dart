import 'package:flutter/material.dart';
import 'package:weather_app/src/components/search_bar.dart';

// Definindo a classe WeatherPage
class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late MySearchBar searchBar;

  @override
  void initState() {
    super.initState();
    searchBar = MySearchBar(
      inBar: false,
      setState: setState,
      onSubmitted: print,
      buildDefaultAppBar: buildAppBar,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Previsão do Tempo'),
      actions: [searchBar.getSearchAction(context)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      body: Center(
        child: const Text('Conteúdo da Página de Clima'),
      ),
    );
  }
}

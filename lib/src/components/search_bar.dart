import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../controllers/weather_controller.dart';

class MySearchBar extends SearchDelegate<String> {
  final Function(String, String) onQuerySubmitted;

  List<Map<String, dynamic>> suggestions = [];

  MySearchBar({
    required this.onQuerySubmitted,
  });

  @override
  String get searchFieldLabel => 'Buscar cidade...';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintStyle: GoogleFonts.lato(
          fontSize: 18,
          color: Colors.white.withOpacity(0.6),
        ),
      ),
    );
  }

//icons
  @override
  List<Widget>? buildActions(BuildContext context) {
    final weatherController = Provider.of<WeatherController>(context);
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: Colors.white),
        onPressed: () {
          query = '';
          suggestions.clear();
          showSuggestions(context);
        },
      ),
      IconButton(
        icon: const Icon(Icons.search, color: Colors.white),
        onPressed: () async {
          final response = await weatherController.getCities(query);
          suggestions = response
              .map((city) => {'id': city['place_id'], 'name': city['name']})
              .toList();
          showSuggestions(context);
        },
      ),
    ];
  }

//close search bar
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final city = suggestions[index];
        final cityName = city['name'];
        final cityId = city['id'];
        return ListTile(
          title: Text(cityName),
          onTap: () {
            query = cityName;
            onQuerySubmitted(cityId.toString(), cityName);
            close(context, cityId.toString());
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final city = suggestions[index];
        final cityName = city['name'];
        final cityId = city['id'];
        return ListTile(
          title: Text(cityName),
          onTap: () {
            query = cityName;
            onQuerySubmitted(cityId.toString(), cityName);
            close(context, cityId.toString());
          },
        );
      },
    );
  }

  @override
  void showResults(BuildContext context) async {
    final weatherController =
        Provider.of<WeatherController>(context, listen: false);
    try {
      final response = await weatherController.getCities(query);
      suggestions = response
          .map((city) => {'id': city['place_id'], 'name': city['name']})
          .toList();
      super.showResults(context);
    } catch (e) {
      print('Error fetching cities: $e');
    }
  }
}

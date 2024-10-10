import 'package:flutter/material.dart';

// Definindo a classe SearchBar
class MySearchBar extends SearchDelegate<String> {
  final List<String> cities = [
    'São Paulo',
    'Rio de Janeiro',
    'Belo Horizonte',
    'Curitiba',
  ];

  MySearchBar({
    required this.inBar,
    required this.setState,
    required this.onSubmitted,
    required this.buildDefaultAppBar,
  });

  final bool inBar;
  final Function setState;
  final Function onSubmitted;
  final Function buildDefaultAppBar;

  @override
  String get searchFieldLabel => 'Buscar cidade...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.blue,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.blue,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final selectedCity = query.isEmpty
        ? 'Nenhuma cidade selecionada.'
        : 'Resultados para: $query';

    return Center(
      child: Text(selectedCity),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? cities
        : cities
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }

  Widget getSearchAction(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        showSearch(context: context, delegate: this);
      },
    );
  }

  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Previsão do Tempo'),
      actions: [getSearchAction(context)],
    );
  }
}

import 'package:flutter/material.dart';

class PokemonSearch extends SearchDelegate<String> {
  final List<String> pokemonName;
  PokemonSearch(@required this.pokemonName);
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: () {}, icon: Icon(Icons.clear));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    //throw UnimplementedError();
    final suggestions = pokemonName.where((name) {
      return name.toLowerCase().contains(query.toLowerCase());
    });
    //throw UnimplementedError();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              suggestions.elementAt(index),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    final suggestions = pokemonName.where((name) {
      return name.toLowerCase().contains(query.toLowerCase());
    });
    //throw UnimplementedError();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              suggestions.elementAt(index),
            ),
          );
        });
  }
}

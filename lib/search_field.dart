import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokemon_book/pages/index_page.dart';
import 'package:pokemon_book/search.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // onTap: () {
                //   showSearch(context: context, delegate: PokemonSearch(pokemonName));
                // },
                decoration: InputDecoration(
                  hintText: 'Search Pokemon',
                  hintStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 25,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

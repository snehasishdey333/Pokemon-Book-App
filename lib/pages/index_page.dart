import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokemon_book/search_field.dart';
import 'package:http/http.dart' as http;

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List PokemonLists = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchPokemons();
  }

  fetchPokemons() async {
    //  print('fetching...');
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    var response = await http.get(url);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['pokemon'];
      // print(items);
      setState(() {
        PokemonLists = items;
        isLoading = false;
      });
    } else {
      setState(() {
        PokemonLists = [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Pokemon Book',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SearchInput(),
          Expanded(child: getBody()),
        ],
      ),
    );
  }

  Widget getBody() {
    // List pokemons = [
    //   '1',
    //   '2',
    // ];
    if (PokemonLists.contains(null) ||
        PokemonLists.isEmpty ||
        isLoading == true) {
      return const Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
    }
    return ListView.builder(
        itemCount: PokemonLists.length,
        itemBuilder: (context, index) {
          return getCard(PokemonLists[index]);
        });
  }

  Widget getCard(index) {
    var pokemonName = index['name'];
    var pokeType = index['type'];
    var pokemonImageUrl = index['img'];
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
          child: ListTile(
            onTap: () {},
            title: Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    image: DecorationImage(
                      image: NetworkImage(
                        pokemonImageUrl.toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pokemonName.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      ('Type: $pokeType'),
                      style: const TextStyle(
                        fontSize: 17,
                        //   fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class PokemonSearch extends SearchDelegate<String> {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
//     // throw UnimplementedError();
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back));
//     //throw UnimplementedError();
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Container();
//     // throw UnimplementedError();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // throw UnimplementedError();
//    // final pokeList = PokemonLists;
//    final suggestions = query.isEmpty ?  : [];
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (content, index) => ListTile(
//           leading: Icon(Icons.arrow_left), title: Text(suggestions[index])),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// * Models
import '/models/pokemons.dart';

// * View Models
import '/viewModels/pokemons_provider.dart';

class HTTPRequest extends StatelessWidget {
  const HTTPRequest({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemons = Provider.of<PokemonsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Request'),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _builderData(snapshot.data as Pokemons);
          } else {
            return const LinearProgressIndicator();
          }
        },
        future: pokemons.fetchPokemons(),
      ),
    );
  }

  Widget _builderData(Pokemons data) {
    return ListView.builder(
      itemCount: data.results.length,
      itemBuilder: (context, index) {
        return _cardPokemon(data.results[index], index + 1);
      },
    );
  }

  Widget _cardPokemon(Result result, int position) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        color: Colors.blue,
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              result.name.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${position}.png'),
          ],
        ),
      ),
    );
  }
}

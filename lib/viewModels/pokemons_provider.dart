import 'package:flutter/material.dart';

// * Controllers
import '/controllers/poke_api.dart';

// * Models
import '/models/pokemons.dart';

class PokemonsViewModel extends ChangeNotifier {
  Future<Pokemons> fetchPokemons() {
    return PokeAPIController.fetchData();
  }
}

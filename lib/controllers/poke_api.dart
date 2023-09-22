import 'dart:convert';

import 'package:http/http.dart' as http;

// * Models
import '/models/pokemons.dart';

class PokeAPIController {
  static Future<Pokemons> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'));
      if (response.statusCode == 200) {
        return Pokemons.fromJson(jsonDecode(response.body));
      } else {
        return Pokemons(
          count: 0,
          next: '',
          previous: null,
          results: [],
        );
      }
    } catch (e) {
      return Pokemons(
        count: 0,
        next: '',
        previous: null,
        results: [],
      );
    }
  }
}

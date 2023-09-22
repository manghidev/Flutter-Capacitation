import 'dart:convert';

import 'package:http/http.dart' as http;

// * Models
import '/models/rick_morty_model.dart';

class RickMortyController {
  static Future<RickMortyModel> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://rickandmortyapi.com/api/character'));
      if (response.statusCode == 200) {
        return RickMortyModel.fromJson(jsonDecode(response.body));
      }

      return RickMortyModel(
        info: Info(
          count: 0,
          pages: 0,
          next: '',
          prev: '',
        ),
        results: [],
      );
    } catch (e) {
      return RickMortyModel(
        info: Info(
          count: 0,
          pages: 0,
          next: '',
          prev: '',
        ),
        results: [],
      );
    }
  }
}

import 'package:flutter/material.dart';

// * Models
import '/models/rick_morty_model.dart';

// * Controllers
import '/controllers/rick_morty_api.dart';

class RickMortyViewModel extends ChangeNotifier {
  Future<RickMortyModel> fetchRickMorty() async {
    return RickMortyController.fetchData();
  }
}

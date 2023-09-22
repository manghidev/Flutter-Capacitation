import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// * Providers
import '/provider_model/increment.dart';
import '/viewModels/pokemons_provider.dart';
import '/viewModels/rick_morty_provider.dart';

// * Pages
// import 'screens/home_page.dart';
//import 'screens/pokemons_screen.dart';
import 'screens/rick_morty_screen.dart';
//import '/screens/animated_container.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.cyan),
      home: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => Increment()),
                ChangeNotifierProvider(create: (_) => PokemonsViewModel()),
                ChangeNotifierProvider(create: (_) => RickMortyViewModel()),
              ],
              child: const RickMortyPage(),
            );
          } else {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }
        },
        future: color(),
      ),
    );
  }

  color() async {
    return Future.delayed(const Duration(milliseconds: 1000), () {
      return '0xFF009FB7';
    });
  }
}

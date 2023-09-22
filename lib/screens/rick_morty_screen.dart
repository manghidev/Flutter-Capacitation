import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// * Models
import '/models/rick_morty_model.dart';

// * View Models
import '/viewModels/rick_morty_provider.dart';

class RickMortyPage extends StatelessWidget {
  const RickMortyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rickMorty = Provider.of<RickMortyViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick & Morty'),
      ),
      body: FutureBuilder(
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return _builderData(snapshot.data as RickMortyModel, context);
          }

          return const LinearProgressIndicator();
        }),
        future: rickMorty.fetchRickMorty(),
      ),
    );
  }

  Widget _builderData(RickMortyModel data, BuildContext context) {
    return RefreshIndicator(
      color: Colors.red,
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      child: _responsive(data, context),
    );
  }

  Widget _responsive(RickMortyModel data, BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > 700) {
      return GridView.builder(
        itemCount: data.results.length,
        itemBuilder: ((context, index) {
          return _cardRickMortyTablet(data.results[index], index + 1);
        }),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: data.results.length,
        itemBuilder: ((context, index) {
          return _cardRickMortyMobile(data.results[index], index + 1);
        }),
      );
    }
  }

  Widget _cardRickMortyMobile(Result result, int position) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        color: Colors.amber,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                result.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 50,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 45,
                backgroundImage: NetworkImage(result.image),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardRickMortyTablet(Result result, int position) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        color: Colors.green,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                result.name,
                style: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 150,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 145,
                backgroundImage: NetworkImage(result.image),
              ),
            )
          ],
        ),
      ),
    );
  }
}

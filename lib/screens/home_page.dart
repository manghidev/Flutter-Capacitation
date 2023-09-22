import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// * Providers
import '/provider_model/increment.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final increment = Provider.of<Increment>(context);

    var color = '0xFF009FB7';

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            const Text('Home'),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Contador ${increment.getCont}',
          style: TextStyle(color: Color(int.parse(color))),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog.adaptive(
                title: const Text('Color'),
                content: Text('quieres salirte'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Si'),
                  ),
                ],
              );
            },
          );
        },
        label: Text('Decrementar'),
        icon: Icon(Icons.remove),
      ),
    );
  }
}

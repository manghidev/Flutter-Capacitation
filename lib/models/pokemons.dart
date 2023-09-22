import 'dart:convert';

Pokemons pokemonsFromJson(String str) => Pokemons.fromJson(json.decode(str));

String pokemonsToJson(Pokemons data) => json.encode(data.toJson());

class Pokemons {
  int count;
  String next;
  dynamic previous;
  List<Result> results;

  Pokemons({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory Pokemons.fromJson(Map<String, dynamic> json) => Pokemons(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String name;
  String url;

  Result({
    required this.name,
    required this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

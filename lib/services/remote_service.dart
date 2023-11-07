import 'package:flutter_pokedex/models/poke_details.dart';
import 'package:flutter_pokedex/models/poke_text.dart';
import 'package:flutter_pokedex/models/pokedex.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Pokemon>?> getPokemons() async {
    var client = http.Client();
    var uri =
        Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=1010&offset=0');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      var data = pokedexFromJson(json);
      return data.results;
    } else {
      throw Exception('PokeAPI not responding');
    }
  }

  Future<PokeDetails> getPokeDetails(id) async {
    var client = http.Client();
    var uri = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return pokeDetailsFromJson(json);
    } else {
      throw Exception('PokeApi not responding');
    }
  }

  Future<String> getPokeText(id) async {
    var client = http.Client();
    var uri = Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      var data = pokeTextFromJson(json);
      for (var i = 0; i < data.flavorTextEntries.length; i++) {
        if (data.flavorTextEntries[i].language.name == 'en') {
          return data.flavorTextEntries[i].flavorText;
        }
      }
      return data.flavorTextEntries[0].flavorText;
    } else {
      throw Exception('PokeAPI not responding');
    }
  }

  Future<List<String?>?> getTypes(pokeDetails) async {
    int typesLength = pokeDetails.types!.length;
    List<String?> types = [];
    for (var i = 0; i < typesLength; i++) {
      types.add(pokeDetails?.types![i].type?.name);
    }
    return types;
  }

  Future<List<String?>?> getAbilities(pokeDetails) async {
    int abilitiesLength = pokeDetails.abilities.length;
    List<String?> abilities = [];
    for (var i = 0; i < abilitiesLength; i++) {
      abilities.add(pokeDetails?.abilities[i].ability?.name);
    }
    return abilities;
  }

  Future<List<dynamic>> getStats(pokeDetails) async {
    int statsLength = pokeDetails.stats.length;
    List stats = [];
    for (var i = 0; i < statsLength; i++) {
      List<Stat> stat = [];
      stat.add(pokeDetails.stats[i]);
      stats.add(stat);
    }
    return stats;
  }

  // Future<List<Uri>?> getPokePic(pokemons) async {
  //   List<Uri> pokepics = [];
  //   int count = 0;
  //   print(pokemons.length);
  //   while (count <= pokemons.length) {
  //     var uri = Uri.parse(
  //         'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${count + 1}.png');
  //     print("${count} + ${uri}");
  //     var response = await http.get(uri);
  //     if (response.statusCode == 200) {
  //       pokepics.add(uri);
  //     } else {
  //       pokepics.add(Uri.parse(
  //           'https://cdn.icon-icons.com/icons2/1369/PNG/512/-broken-image_89881.png'));
  //     }
  //     count++;
  //   }
  //   print(pokepics);
  //   return pokepics;
  // }
}

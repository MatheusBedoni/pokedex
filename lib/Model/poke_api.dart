import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:pokedex_app/Model/pokemon.dart';
import 'package:pokedex_app/Model/pokemon_obj.dart';

const baseUrl = "https://pokeapi.co/api/v2";


class PokeApi{
  static Future<List<Results>> getPokemonList() async {

    var header = {"Accept":"application/json"};
    var url ='$baseUrl/pokemon?limit=200';

    var response = await http.get(url,headers:header);
    if (response.statusCode == 200) {
      var jsonresponse = json.decode(response.body);
      var pokemon =  Pokemon.fromJson(jsonresponse);
      return pokemon.results;
    } else {
      throw Exception('Failed to load post'+response.body);
    }

  }

  static Future<PokemonObj> getPokemonObj(String url) async {

    var header = {"Accept":"application/json"};

    var response = await http.get(url,headers:header);
    if (response.statusCode == 200) {
      var jsonresponse = json.decode(response.body);
      var pokemon =  PokemonObj.fromJson(jsonresponse);
      return pokemon;
    } else {
      throw Exception('Failed to load post'+response.body);
    }

  }

  static String getImg(int id)  {
   return 'https://pokeres.bastionbot.org/images/pokemon/$id.png';
  }
}
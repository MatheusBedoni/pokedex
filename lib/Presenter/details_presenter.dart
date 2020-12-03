

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/Model/GetX/poke_obj_get.dart';
import 'package:pokedex_app/Model/database_helper.dart';
import 'package:pokedex_app/Model/poke_api.dart';
import 'package:pokedex_app/Model/pokemon_obj.dart';
import 'package:pokedex_app/View/home_page.dart';



class DetailsView {
  Future<bool> getPokemonObj(String url) async {}
  String getPokemonImg()  {}
  void navegarHomesPage(BuildContext context) {}
  Future<int> insert({String nome, String url, int idPokemon,BuildContext context}) async{}
}

class DetailsPresenter  implements DetailsView {
  PokemonObj pokemonObj = new PokemonObj();
  var pokemonObjController = Get.put(PokemonObjController());
  final dbHelper = DatabaseHelper.instance;


  DetailsPresenter() {}


  @override
  void navegarHomesPage(BuildContext context) {
    Navigator.pushReplacement(
      context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 100),
        pageBuilder: (_, __, ___) => HomePage()),
    );
  }

  @override
  Future<bool> getPokemonObj(String url) async {
    return pokemonObjController.getPokemonObj(url);
  }




  @override
  Future<int> insert({String nome, String url, int idPokemon,BuildContext context}) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnNome : nome,
      DatabaseHelper.columnUrl  : url,
      DatabaseHelper.columnIdPokemon  : idPokemon,
    };
    final id = await dbHelper.insert(row);
    navegarHomesPage(context);
    return id;
  }

   String getNoNullText(String text){
    if(text != null){
      return text;
    }
    return '';
  }

  @override
  String getPokemonImg() {
    return PokeApi.getImg(pokemonObjController.pokemonObj.id);
  }

}
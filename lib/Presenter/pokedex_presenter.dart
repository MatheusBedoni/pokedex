

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/Model/GetX/pokedex_sqlite_get.dart';
import 'package:pokedex_app/Model/database_helper.dart';
import 'package:pokedex_app/Model/poke_api.dart';
import 'package:pokedex_app/View/home_page.dart';


class PokedexPageView {
  Future<bool>  getPokedex()async {}
  void deletePokemon(int id) {}
  void navegarHomePage(BuildContext context) {}
}

class PokedexPagePresenter implements PokedexPageView {
  var pokemonObjController = Get.put(PokemonSqliteController());
  final dbHelper = DatabaseHelper.instance;

  PokedexPagePresenter() {}

  /// Busca os dados no banco, baseado na data informada pelo user
  @override
  Future<bool> getPokedex() async {
   return pokemonObjController.getPokedexList();
  }

  @override
  void deletePokemon(int id) {
    dbHelper.delete(id);
    getPokedex();
  }

  @override
  String getPokemonImg(int id) {
    return PokeApi.getImg(id);
  }



  @override
  void navegarHomePage(BuildContext context) {
    Navigator.pushReplacement(
      context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 100),
        pageBuilder: (_, __, ___) => HomePage()),
    );
  }

}
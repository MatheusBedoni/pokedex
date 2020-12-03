import 'package:flutter/material.dart';
import 'package:pokedex_app/Model/GetX/poke_getx.dart';
import 'package:pokedex_app/Model/pokemon.dart';
import 'package:pokedex_app/View/details_page.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/View/pokedex_list.dart';



class HomeView {
  void navegarDetailsPage(BuildContext context,String query) {}
  Future<bool> getPokemonList()async {}
  void navegarPokedexPage(BuildContext context) {}

  }

class HomePresenter  implements HomeView {
  final editNamePokemon = TextEditingController();
  var resultsList = new List<Results>();
  var searchListItems = new List<Results>();
  var pokemonController = Get.put(PokemonController());

  String searchText = "";
  bool isSearch =false;


  HomePagePresenter() {

  }


  @override
  void navegarDetailsPage(BuildContext context,String query) {
    Navigator.pushReplacement(
      context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 100),
        pageBuilder: (_, __, ___) => DetailsPage(query: query,)),
    );
  }
  @override
  void navegarPokedexPage(BuildContext context) {
    Navigator.pushReplacement(
      context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 100),
        pageBuilder: (_, __, ___) => PokedexPage()),
    );
  }

  @override
  Future<bool> getPokemonList()async {
    return pokemonController.search();
  }

}
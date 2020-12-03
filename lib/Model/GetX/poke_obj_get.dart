
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex_app/Model/poke_api.dart';
import 'package:pokedex_app/Model/pokemon_obj.dart';

class PokemonObjController extends GetxController {
  PokemonObj pokemonObj = new PokemonObj();

  bool getPokemonObj(String url){

    PokeApi.getPokemonObj(url).then((results) {
      try {
        pokemonObj = results;
        update();
        return true;

      }catch(e){
        return false;
      }
    });

  }
}

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex_app/Model/poke_api.dart';
import 'package:pokedex_app/Model/pokemon.dart';

class PokemonController extends GetxController {
  List<Results> pokemon;

  bool search(){
    PokeApi.getPokemonList().then((results) {
      try {
        pokemon = results;
        update();
        return true;
      }catch(e){
        return false;
      }
    });

 }
}

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex_app/Model/database_helper.dart';
import 'package:pokedex_app/Model/pokemon_sqlite.dart';

class PokemonSqliteController extends GetxController {
  List<PokemonSqlite> listPokedex = new List<PokemonSqlite>();
  final dbHelper = DatabaseHelper.instance;

  Future<bool> getPokedexList() async {
    final allpokemons = await dbHelper.query();
    listPokedex = allpokemons.map((model) => PokemonSqlite.fromMap(model)).toList();
    update();
    return true;
  }
}
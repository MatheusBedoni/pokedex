class PokemonSqlite {
  int id = 0;
  String nome = "";
  String url = "";
  int idPokemon = 0;


  PokemonSqlite({
    this.id,
    this.nome,
    this.url,
    this.idPokemon

  });


  PokemonSqlite.fromMap(Map<String, dynamic> json) {
    id = json['_id'];
    nome = json['nome'];
    url = json['url'];
    idPokemon = json['idpokemon'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'url': url,
      'idpokemon':idPokemon
    };
  }
}
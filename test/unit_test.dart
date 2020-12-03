// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/Presenter/details_presenter.dart';
import 'package:pokedex_app/Presenter/home_presenter.dart';
import 'package:pokedex_app/Presenter/pokedex_presenter.dart';



void main() {
  DetailsPresenter detailsPresenter = new DetailsPresenter();
  HomePresenter homePresenter = new HomePresenter();
  PokedexPagePresenter pokedexPresenter = new PokedexPagePresenter();

  test('testar requisiçao que traz o pokemon', () async {


    bool flag = await detailsPresenter.getPokemonObj('https://pokeapi.co/api/v2/pokemon/2/');

    expect(flag, true);
  });
  test('testar requisiçao que traz a lista de pokemons', () async {


    bool flag = await homePresenter.getPokemonList();

    expect(flag, true);
  });

  test('testar requisiçao que a imagem de cada pokemon', () async {

    String flag = await pokedexPresenter.getPokemonImg(2);

    expect(flag, 'https://pokeres.bastionbot.org/images/pokemon/2.png');
  });

  test('testar requisiçao que a lista da pokedex', () async {

    bool flag = await pokedexPresenter.getPokedex();

    expect(flag, true);
  });




}

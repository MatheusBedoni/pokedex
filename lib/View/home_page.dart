import 'package:flutter/material.dart';
import 'package:pokedex_app/Model/pokemon.dart';
import 'package:pokedex_app/Presenter/home_presenter.dart';
import 'package:pokedex_app/Widgets/banner_widget.dart';
import 'package:pokedex_app/Widgets/edit_text_widget.dart';
import 'package:pokedex_app/Widgets/title_widget.dart';
import 'package:pokedex_app/constants.dart';




class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
   HomePresenter homePresenter;

  @override
  void initState() {
    super.initState();
    homePresenter = new HomePresenter();
    homePresenter.getPokemonList();

  }

  @override
  void dispose() {
    super.dispose();
  }

  ListenerController() {
    homePresenter.editNamePokemon.addListener(() {
      if (homePresenter.editNamePokemon.text.isEmpty) {
        setState(() {
          homePresenter.isSearch = false;
          homePresenter.searchText = "";
        });
      } else {
        setState(() {
          homePresenter.isSearch = true;
          homePresenter.searchText = homePresenter.editNamePokemon.text;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    ListenerController();
    return Scaffold(
      body:Container(
        decoration:Constants.decorationBackground,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TitleWidget(title:"Qual pokemon você está procurando?"),
          EditTextWidget(hint: 'Busque um pokemon pelo nome',size: MediaQuery
              .of(context)
              .size.width / 1.3,color:Colors.white ,controller: homePresenter.editNamePokemon,),
            homePresenter.isSearch ?
            searchListView():
            GestureDetector(
              onTap: (){
                homePresenter.navegarPokedexPage(context);
              },
              child:BannerWidget(title: 'Minha pokedex',assetImage: 'imagens/pokeball.svg',)
            )



          ],
        ),
      ),
    );
  }

  Widget searchListView() {
    if(homePresenter.pokemonController.pokemon != null){
      homePresenter.searchListItems = new List<Results>();
      for (int i = 0; i < homePresenter.pokemonController.pokemon.length; i++) {
        var item = homePresenter.pokemonController.pokemon[i];

        if (item.name.toLowerCase().contains(homePresenter.searchText.toLowerCase())) {
          homePresenter.searchListItems.add(item);
        }
      }
      return _searchAddList();
    }else{
      Container();
    }

  }

  Widget _searchAddList() {

    return new Container(
      child: new ListView.builder(
          shrinkWrap: true,
          itemCount: homePresenter.searchListItems.length,
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
              onTap:(){
                homePresenter.navegarDetailsPage(context, homePresenter.searchListItems[index].url);
              },
              child:Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left:20,right:17,top: MediaQuery
                      .of(context)
                      .size
                      .height /70,bottom:10
                  ),
                  child: Text(homePresenter.searchListItems[index].name,
                    style: TextStyle(
                      fontFamily: 'SF-Compact-Display',
                      color:  Color(0xFFFFFFFF),
                      fontSize:  MediaQuery.of(context).size.width/25,
                    ),
                  ),
                ),
              )
            ) ;
          }),
    );
  }


}





import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/Model/GetX/pokedex_sqlite_get.dart';
import 'package:pokedex_app/Presenter/pokedex_presenter.dart';
import 'package:pokedex_app/Widgets/text_widget.dart';
import 'package:pokedex_app/Widgets/title_widget.dart';
import 'package:pokedex_app/constants.dart';
import 'package:get/get.dart';



class PokedexPage extends StatefulWidget {

  @override
  PokedexPageState createState() => PokedexPageState();
}

class PokedexPageState extends State<PokedexPage> with TickerProviderStateMixin {
  PokedexPagePresenter pokedexPresenter;

  @override
  void initState() {
    super.initState();
    pokedexPresenter = new PokedexPagePresenter();
    pokedexPresenter.getPokedex();
    BackButtonInterceptor.add(myInterceptor);

  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    pokedexPresenter.navegarHomePage(context);
    return true;
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Constants.backgroundColor,

          elevation: 0.0,
          leading:IconButton(
            onPressed: (){
              pokedexPresenter.navegarHomePage(context);
            },
            color:  Colors.white,
            icon: Icon(Icons.arrow_back),
          )
      ),
      body:Container(
        decoration:Constants.decorationBackground,
        child:GetBuilder<PokemonSqliteController>(
            builder: (_) =>
                pokedexPresenter.pokemonObjController.listPokedex.length > 0?
          GridView.count(
              crossAxisCount: 3,
              children: List.generate(pokedexPresenter.pokemonObjController.listPokedex.length, (index) {
                return  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery
                                    .of(context)
                                    .size
                                    .height /60,left: MediaQuery
                                .of(context)
                                .size
                                .width /60
                            ),
                            child:  Container(
                                height:  MediaQuery
                                    .of(context)
                                    .size
                                    .height /20,
                                width:MediaQuery
                                    .of(context)
                                    .size
                                    .width /10,
                                decoration: BoxDecoration(
                                  border: Border.all (width: 0, color:Colors.white),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(75)
                                  ),
                                ),
                                child:Image.network(pokedexPresenter.getPokemonImg(pokedexPresenter.pokemonObjController.listPokedex[index].idPokemon))
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 2,
                          right:2 ,
                          child:IconButton(
                            onPressed: (){
                              pokedexPresenter.deletePokemon(pokedexPresenter.pokemonObjController.listPokedex[index].id);
                            },
                            color:  Colors.white,
                            icon: Icon(Icons.delete),
                          ) ,
                        )
                      ],
                    ),

                    TextWidget(title:pokedexPresenter.pokemonObjController.listPokedex[index].nome),

                  ],
                );
              }),
            ):TextWidget(title:'Você ainda não salvou pokemon'),
        ),
      ),
    );
  }




}





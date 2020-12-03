
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/Model/GetX/poke_obj_get.dart';
import 'package:pokedex_app/Presenter/details_presenter.dart';
import 'package:pokedex_app/Widgets/text_widget.dart';
import 'package:pokedex_app/Widgets/title_widget.dart';
import 'package:pokedex_app/constants.dart';



class DetailsPage extends StatefulWidget {
  var query;

  DetailsPage({Key key,this.query}) : super(key: key);
  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> with TickerProviderStateMixin {

  DetailsPresenter detailsPresenter = new DetailsPresenter();

  @override
  void initState() {
    super.initState();
    detailsPresenter.getPokemonObj(widget.query);
    BackButtonInterceptor.add(myInterceptor);

  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    detailsPresenter.navegarHomesPage(context);
    return true;
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
            detailsPresenter.navegarHomesPage(context);
          },
          color:  Colors.white,
          icon: Icon(Icons.arrow_back),
        )
      ),
      body:Stack(
        children: <Widget>[
          Container(
            decoration:Constants.decorationBackground,
            child:
            GetBuilder<PokemonObjController>(
                builder: (_) => detailsPresenter.pokemonObjController.pokemonObj.id != null?
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery
                                .of(context)
                                .size
                                .height /60,right: MediaQuery
                            .of(context)
                            .size
                            .width /30,left:10
                        ),
                        child:  Container(
                          height:  MediaQuery
                              .of(context)
                              .size
                              .height /10,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width /5,
                          decoration: BoxDecoration(
                              border: Border.all (width: 5, color:Colors.white),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(75)
                              ),
                          ),
                          child:Image.network(detailsPresenter.getPokemonImg())
                        ),
                      ),
                    ),
                    TextWidget(title:'${detailsPresenter.pokemonObjController.pokemonObj.name}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextWidget(title: 'weight: ${detailsPresenter.pokemonObjController.pokemonObj.weight}',),
                        TextWidget(title: 'height: ${detailsPresenter.pokemonObjController.pokemonObj.height}',)
                      ],
                    ),
                    TextWidget(title: 'Type',),
                    SizedBox(
                        height:  MediaQuery
                            .of(context)
                            .size
                            .height /10,
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,

                          itemBuilder: (_,int index)=>TextWidget(title: '${detailsPresenter.pokemonObjController.pokemonObj.types[index].type.name}',),//RaisedButton

                          itemCount: detailsPresenter.pokemonObjController.pokemonObj.types.length,
                        )
                    ),
                    TextWidget(title: 'Stats',),
                    SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height /5,
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,

                          itemBuilder: (_,int index)=>Column(
                            children: <Widget>[
                              TextWidget(title: '${detailsPresenter.pokemonObjController.pokemonObj.stats[index].stat.name}',),
                              TextWidget(title: '${detailsPresenter.pokemonObjController.pokemonObj.stats[index].baseStat}',),
                            ],
                          ),

                          itemCount: detailsPresenter.pokemonObjController.pokemonObj.stats.length,
                        )
                    )

                  ],
                ):
                Container()
            ),


          ),
          Positioned(
            bottom: 20,
            left:MediaQuery
                .of(context)
                .size
                .width /2.5,
            child:GestureDetector(
              onTap: (){
                detailsPresenter.insert(nome: detailsPresenter.pokemonObjController.pokemonObj.name,url:widget.query,idPokemon:detailsPresenter.pokemonObjController.pokemonObj.id,context: context );
              },
              child:Hero(
                tag:'pokedex',
                child: SvgPicture.asset(
                  'imagens/pokeball.svg',
                  width:  MediaQuery
                      .of(context)
                      .size
                      .width /13,
                  height:  MediaQuery
                      .of(context)
                      .size
                      .height /13,

                ),
              )
            )
          )
        ],
      )
    );
  }


}





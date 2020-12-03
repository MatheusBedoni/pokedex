import 'package:flutter/material.dart';
import 'package:pokedex_app/constants.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  TitleWidget({this.title});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery
                .of(context)
                .size
                .height / 50,top: MediaQuery
            .of(context)
            .size
            .height / 15,bottom:  MediaQuery
            .of(context)
            .size
            .height / 50
        ),

        child: Text(title,
          style: TextStyle(
            fontFamily: Constants.fontFamily,
            fontWeight: FontWeight.bold,
            color:  Color(0xFFfff9f9),
            fontSize:  MediaQuery.of(context).size.height/30,
          ),
        ),
      ),
    );
  }

}
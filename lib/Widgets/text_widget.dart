import 'package:flutter/material.dart';
import 'package:pokedex_app/constants.dart';

class TextWidget extends StatelessWidget {
  final String title;
  TextWidget({this.title});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery
                .of(context)
                .size
                .width / 30,top: MediaQuery
            .of(context)
            .size
            .height / 30,bottom:  MediaQuery
            .of(context)
            .size
            .height / 50,
          right: MediaQuery
              .of(context)
              .size
              .width / 30,
        ),

        child: Text(title,
          style: TextStyle(
            fontFamily: Constants.fontFamily,
            fontWeight: FontWeight.bold,
            color:  Color(0xFFfff9f9),
            fontSize:  MediaQuery.of(context).size.height/65,
          ),
        ),
      ),
    );
  }

}
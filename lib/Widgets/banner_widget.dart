
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/constants.dart';

class BannerWidget extends StatelessWidget{
  final String title;
  final String assetImage;
  BannerWidget({this.title,this.assetImage});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery
                .of(context)
                .size
                .height / 20,left: MediaQuery
            .of(context)
            .size.height / 80
        ),

        child: Container(
            width: MediaQuery.of(context).size.width/2.40,
            height: MediaQuery.of(context).size.height/5,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                )
            ),
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery
                            .of(context)
                            .size
                            .height / 30,left: 20,bottom:MediaQuery
                        .of(context)
                        .size
                        .height / 50
                    ),
                    child:SvgPicture.asset(
                      assetImage,
                      width:  MediaQuery
                          .of(context)
                          .size
                          .height / 13,
                      height:  MediaQuery
                          .of(context)
                          .size
                          .width / 13,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height / 50,left: 20,bottom:MediaQuery
                          .of(context)
                          .size
                          .height / 50
                      ),

                      child: Text(title,
                        style: TextStyle(
                            color:Colors.black,
                            fontSize: MediaQuery.textScaleFactorOf(context) * 16,
                            fontFamily: Constants.fontFamily
                        ),
                      ),
                    ),
                  ),

                ]
            )
        ),
      ),
    )
    ;

  }


}
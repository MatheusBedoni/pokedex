import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditTextWidget extends StatelessWidget{
  final String hint;
  final double size;
  final Color color;
  final TextEditingController controller ;


  EditTextWidget({this.hint,this.size,this.color,this.controller});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
            top: 5,left: MediaQuery
            .of(context)
            .size.height / 80,right: MediaQuery
            .of(context)
            .size.height / 100
        ),

        child:  Container(
          width: size,
          padding: EdgeInsets.only(
              left: 16, right: 16, bottom: 4
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(20)
            ),
            color:  color,
          ),
          child: TextField(
            controller: controller,
            inputFormatters: [
              LengthLimitingTextInputFormatter(150),
            ],
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: new TextStyle(color: Colors.black,fontSize: MediaQuery.textScaleFactorOf(context) * 11),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,

            ),
          ),
        ),
      ),
    );
  }

}
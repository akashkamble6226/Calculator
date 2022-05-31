import 'package:calculator/my_colors.dart';
import 'package:flutter/material.dart';


class SingleOperator extends StatelessWidget {
  const SingleOperator({Key? key, required this.operatorName, required this.onTapped,this.isClr = false, this.onDoubleTap,required this.isWhiteColor}) : super(key: key);

  final String operatorName;
  final void Function(dynamic opr) onTapped;
  final bool isClr;
  final bool isWhiteColor;

  // this function is not mandatory
  final void Function()? onDoubleTap;



  @override
  Widget build(BuildContext context) {

   


    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
        color: isWhiteColor ? mainWhiteColor : mainDarkColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () => onTapped(operatorName),
          onLongPress:() => isClr ? onDoubleTap!() : null,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child:  Container(
             width: isClr ? screenWidth / 1.5:screenWidth * 0.13,
            height:isClr ? screenHeight * 0.07:screenHeight * 0.07,
            color: Colors.transparent,
            child: Center(
              child: Text(
                operatorName,
                style:   TextStyle(
                 color: isWhiteColor ? numPadBackColor : mainWhiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ));


  }
}

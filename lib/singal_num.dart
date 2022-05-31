import 'package:calculator/my_colors.dart';
import 'package:flutter/material.dart';


class SingleNum extends StatelessWidget {
  const SingleNum({Key? key, required this.digitName, required this.onTapped, this.isZero = false, required this.isWhiteColor})
      : super(key: key);

  final int digitName;
  final void Function(int? val) onTapped;
  final bool isZero;
  final bool isWhiteColor;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
         color: isWhiteColor ? mainWhiteColor : mainDarkColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () => onTapped(digitName),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: isZero ? screenWidth / 1.5:screenWidth * 0.13,
            height:isZero ? screenHeight * 0.07:screenHeight * 0.07,
            color: Colors.transparent,
            child: Center(
              child: Text(
                '$digitName',
                style:  TextStyle(
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

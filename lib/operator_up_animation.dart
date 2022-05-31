import 'dart:async';

import 'package:flutter/material.dart';

class AnimateOperands extends StatefulWidget {
  //  AnimateOperands({Key? key, this.operand1, this.operand2, this.operat}) : super(key: key, required this.operand1, required this.operand2, required this.operat, required this.isWhiteTheme);

  const AnimateOperands({
    Key? key,
    required this.operand1,
    required this.operand2,
    required this.operat,
    required this.isWhiteTheme,
    required this.isEqualToClicked,
    // required this.isSingleCalCycleCompleted
  }) : super(key: key);

  final int? operand1;
  final int? operand2;
  final dynamic operat;

  final bool isWhiteTheme;
   final bool isEqualToClicked;
  // final bool isSingleCalCycleCompleted;

  @override
  State<AnimateOperands> createState() => _AnimateOperandsState();
}

class _AnimateOperandsState extends State<AnimateOperands>
    with SingleTickerProviderStateMixin {
  late final Animation<Offset> offset;

  late final AnimationController _operandAnimationController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _operandAnimationController.dispose;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _operandAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 503));

    offset = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -0.4))
        .animate(_operandAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.operand1 !=null && widget.operand2 !=null && widget.operat !=null) {
      _operandAnimationController.forward();
      Timer(const Duration(milliseconds: 503), () {
         _operandAnimationController.reverse();
  
});


      
    }

    

    
  
   

    
    return SlideTransition(
      position: offset,
      child: operandsAndOperator(),
    );
  }

  Widget operandsAndOperator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          widget.operand1 != null ? widget.operand1.toString() : 0.toString(),
          style: TextStyle(
            color: widget.isWhiteTheme ? Colors.grey : Colors.white,
            fontSize: 25,
          ),
        ),

        // operator

        if (widget.operat != null)
          Text(
            ' '+widget.operat.toString()+' ',
            style: TextStyle(
              color: widget.isWhiteTheme ? Colors.grey : Colors.white,
              fontSize: 25,
            ),
          ),

        if (widget.operand2 != null)
          Text(
            widget.operand2.toString(),
            style: TextStyle(
              color: widget.isWhiteTheme ? Colors.grey : Colors.white,
              fontSize: 25,
            ),
          ),

        const SizedBox(
          width: 5,
        ),
      ],
    );
  }

  
}

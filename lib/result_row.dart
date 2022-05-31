import 'package:flutter/material.dart';

class ResultRow extends StatefulWidget {
  const ResultRow(
      {Key? key,
      required this.operand1,
      required this.operand2,
      required this.operat,
      required this.result,
      required this.divideResult,
      required this.isEqualToClicked,
      required this.isWhiteTheme})
      : super(key: key);

  final int? operand1;
  final int? operand2;
  final dynamic operat;
  final int? result;
  final double? divideResult;
  final bool isWhiteTheme;
  final bool isEqualToClicked;

  @override
  State<ResultRow> createState() => _ResultRowState();
}

class _ResultRowState extends State<ResultRow>
{
  

 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

 
  }

  @override
  Widget build(BuildContext context) {
   
    return  resultRow();
    
  }

  Widget resultRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      widget.operat != '/' && widget.operand1 != null && widget.operand2 != null
          ? Text(
              widget.result != null ? widget.result.toString() : 0.toString(),
              style: TextStyle(
                  color: widget.isWhiteTheme ? Colors.grey : Colors.white,
                  // little bit confused here
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          : Text(
              widget.divideResult != null
                  ? widget.divideResult.toString()
                  : 0.toString(),
              style: TextStyle(
                  color: widget.isWhiteTheme ? Colors.grey : Colors.white,
                  // little bit confused here
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
      const SizedBox(
        width: 5,
      ),
    ]);
  }



}

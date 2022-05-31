import 'package:calculator/operator_up_animation.dart';
import 'package:calculator/result_row.dart';
import 'package:flutter/material.dart';


import 'my_colors.dart';
import 'singal_num.dart';
import 'singal_operator.dart';

//****Top View of Structure of Code****//
// UI
// Widgets 
// Functions


class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // createDigits();
  }

  int? operand1;
  int? operand2;
  dynamic operat;
  int? result;
  double? divideResult;
  bool isWhiteTheme = false;
  bool isEqualToClicked = false;
  

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: Container(
        color: isWhiteTheme ? mainWhiteColor : mainDarkColor,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            changeThemeRow(screenWidth),
            SizedBox(
              height: screenHeight * 0.2,
            ),
            operandsOperatorResultRow(),
            numpad(screenWidth),
          ],
        ),
      ),
    ));
  }

  Widget changeThemeRow(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 0.29,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: isWhiteTheme ? numPadBackColor : faintMainDarkColor),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isWhiteTheme = !isWhiteTheme;
                  });
                },
                icon: Icon(Icons.sunny,
                    color: isWhiteTheme ? Colors.white : Colors.grey),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isWhiteTheme = !isWhiteTheme;
                    });
                  },
                  icon: Icon(Icons.dark_mode,
                      color: !isWhiteTheme ? Colors.white : Colors.grey)),
            ]),
          ),
        ),
      ],
    );
  }

  Widget operandsOperatorResultRow() {
    return Column(
      children: [
        AnimateOperands(
          operand1: operand1,
          operand2: operand2,
          operat: operat,
          isWhiteTheme: isWhiteTheme,
          isEqualToClicked: isEqualToClicked,
        ),
        const SizedBox(
          height: 10,
        ),
        ResultRow(
          operand1: operand1,
          operand2: operand2,
          operat: operat,
          result: result,
          divideResult: divideResult,
          isEqualToClicked: isEqualToClicked,
          isWhiteTheme: isWhiteTheme,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  

  Widget numpad(double screenWidth) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
            color: isWhiteTheme ? numPadBackColor : faintDark,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SingleOperator(
                      onTapped: (opr) {
                        clearLastDigit();
                      },
                      isWhiteColor: isWhiteTheme,
                      onDoubleTap: () {
                        clearAll();
                      },
                      operatorName: 'CLR',
                      isClr: true,
                    ),

                    const SizedBox(
                      width: 5,
                    ),

                    // Spacer(),

                    SingleOperator(
                      operatorName: '/',
                      onTapped: (opr) {
                        assigOperator(opr);
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SingleNum(
                      digitName: 7,
                      onTapped: (int? val) {
                        assignValues(val);
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    SingleNum(
                      digitName: 8,
                      onTapped: (int? val) {
                        assignValues(val);
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    SingleNum(
                      digitName: 9,
                      onTapped: (int? val) {
                        assignValues(val);
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    SingleOperator(
                      operatorName: '*',
                      onTapped: (opr) {
                        assigOperator(opr);
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SingleNum(
                      digitName: 4,
                      onTapped: (int? val) {
                        assignValues(val);
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    SingleNum(
                      digitName: 5,
                      onTapped: (int? val) {
                        assignValues(val);
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    SingleNum(
                      digitName: 6,
                      onTapped: (int? val) {
                        assignValues(val);
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    SingleOperator(
                      operatorName: '-',
                      onTapped: (opr) {
                        assigOperator(opr);
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SingleNum(
                      digitName: 1,
                      onTapped: (int? val) {
                        assignValues(val);
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    SingleNum(
                      digitName: 2,
                      onTapped: (int? val) {
                        assignValues(val);
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    SingleNum(
                      digitName: 3,
                      onTapped: (int? val) {
                        assignValues(val);
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    SingleOperator(
                      operatorName: '+',
                      onTapped: (opr) {
                        assigOperator(opr);
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SingleNum(
                      digitName: 0,
                      onTapped: (int? val) {
                        assignValues(val);
                      },
                      isWhiteColor: isWhiteTheme,
                      isZero: true,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SingleOperator(
                      operatorName: '=',
                      onTapped: (opr) {
                        // trying to make the operate1 ,operat and operand2 null and also making the boolean of isequal to clicked true
                        chnageTheOperands();
                        performAction();
                      },
                      isWhiteColor: isWhiteTheme,
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }



// once equal to clicked then I need to change the operands
  void chnageTheOperands() {
    setState(() {
      isEqualToClicked = true;
      operand1 = result;
      operand2 = null;
      operat = null;
       
    });

    
  }

  void assigOperator(dynamic newOperator) {
    setState(() {
      // only assign operator when you dont have any operator assigned
      if (newOperator != '=' && operand1 != null) {
        operat ??= newOperator;
      }
    });
  }

  void assignValues(int? val) {
    //if operator is null it means first value is not yet finished of entering
    if (operat == null) {
      // if operand1 is null then only assigne the value 0
      operand1 ??= 0;
      String? initialValue = operand1?.toString();
      String? valueEnterdByUser = val?.toString();
      String? convertedValue = initialValue! + valueEnterdByUser!;

      setState(() {
        operand1 = int.parse(convertedValue);
      });
    } else {
      //  for the operand 2

      if (operand1 != null && operat != null) {
        operand2 ??= 0;
        String? initialValue = operand2?.toString();
        String? valueEnterdByUser = val?.toString();
        String convertedValue = initialValue! + valueEnterdByUser!;

        setState(() {
          operand2 = int.parse(convertedValue);
        });
      }
    }

    // to make the calculation dynamic without pressing equal to
    if (operand1 != null && operand2 != null && operat != null) {
      performAction();
    }
  }

  void performAction() {
    int operationResult = 0;

    if (operat != '/') {
      switch (operat) {
        case '+':
          operationResult = operand1! + operand2!;
          break;

        case '-':
          operationResult = operand1! - operand2!;
          break;

        case '*':
          operationResult = operand1! * operand2!;
          break;
      }

      setState(() {
        result = operationResult;
      });
    } else {
      setState(() {
        // used diffrent variable for divide result
        divideResult = operand1! / operand2!;
      });
    }

    // if(isEqualToClicked)
    // {
    //   isEqualToClicked = false;
    // }
  }

  void clearAll() {
    setState(() {
      operand1 = null;
      operand2 = null;
      operat = null;
      result = 0;
      divideResult = null;
    });
  }

  void clearLastDigit() {
    //to clear the operator
    if (operand1 != null && operand2 == null && operat != null) {
      setState(() {
        operat = null;
      });

      return;
    }

    // to clear the operand 1
    if (operand1 != null && operat == null && operand2 == null) {
      double val = operand1! / 10;

      setState(() {
        operand1 = val.toInt();
        // print(operand1);
      });
    }

    // to clear the operand 2
    if (operand1 != null && operat != null && operand2 != null) {
      double val = operand2! / 10;

      setState(() {
        operand2 = val.toInt();
        performAction();
      });
    }

    // making operand2 null
    if (operand1 != null && operat != null && operand2 == 0) {
      setState(() {
        //  operat = oper;
        operand2 = null;
      });
    }
  }
}

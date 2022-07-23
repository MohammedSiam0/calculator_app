import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '0';
  String finalResult = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String opr = '';

  Widget CustomButton(String txtButton, Color backgroundColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () {
        buttonPressed(txtButton);
      },
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(25),
            bottomEnd: Radius.circular(25),
            bottomStart: Radius.circular(25),
            topEnd: Radius.circular(25),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      ),
      child: Text(
        txtButton,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: txtColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('آلة حاسبة '),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: AlignmentDirectional.center,
              height: 100,
              padding: EdgeInsets.all(10),
              color: Colors.grey.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$finalResult',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 50),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomButton(
                  'AC',
                  Colors.blue,
                  Colors.white,
                ),
                CustomButton('+/-', Colors.blue, Colors.white),
                CustomButton('%', Colors.blue, Colors.white),
                CustomButton('/', Colors.blue, Colors.white),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomButton('1', Colors.indigoAccent, Colors.white),
                CustomButton('2', Colors.indigoAccent, Colors.white),
                CustomButton('3', Colors.indigoAccent, Colors.white),
                CustomButton('*', Colors.blue, Colors.white),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomButton('4', Colors.indigoAccent, Colors.white),
                CustomButton('5', Colors.indigoAccent, Colors.white),
                CustomButton('6', Colors.indigoAccent, Colors.white),
                CustomButton('+', Colors.blue, Colors.white),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomButton('7', Colors.indigoAccent, Colors.white),
                CustomButton('8', Colors.indigoAccent, Colors.white),
                CustomButton('9', Colors.indigoAccent, Colors.white),
                CustomButton('-', Colors.blue, Colors.white),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: CustomButton('0', Colors.indigoAccent, Colors.white),
                ),
                SizedBox(width: 20),
                CustomButton('.', Colors.indigoAccent, Colors.white),
                SizedBox(width: 20),
                CustomButton('=', Colors.blue, Colors.white),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void buttonPressed(String btnVal) {
    if (btnVal == 'AC') {
      result = '0';
      finalResult = '0';
      num1 = 0.0;
      num2 = 0.0;
      opr = '';
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == '*' ||
        btnVal == '/') {
      num1 = double.parse(result);
      opr = btnVal;
      finalResult = '0';
      result = result + btnVal;
    } // End First else if
    else if (btnVal == '.') {
      if (finalResult.contains('.')) {}
    } else if (btnVal == '+/-') {
      if (finalResult.contains('-')) {
        result.toString().substring(1);
        finalResult = result;
      } else {
        result = '-'+ result;
        finalResult = result;
      }
    } else if (btnVal == '&') {
      num2 = double.parse(result);
      finalResult = (num2 / 100).toString();
    } else if (btnVal == '=') {
      num2 = double.parse(result);
      if (opr == '+') {
        finalResult = (num1 + num2).toString();
      }
      if (opr == '-') {
        finalResult = (num1 - num2).toString();
      }

      if (opr == '*') {
        finalResult = (num1 * num2).toString();
      }
      if (opr == '/') {
        finalResult = (num1 / num2).toString();
      }}
      else {
      finalResult = finalResult + btnVal;
     }
    setState(() => result = double.parse(finalResult).toString());
  } // End ButtonPreessed

}

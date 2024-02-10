import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Myhomepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Myhomepage extends StatefulWidget {
  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  late var firstNum;
   late var secondNum;
   String history="";
   String textToDisplay="";
   String res="";
   String operation="";
  late  Function callback;
  bool flag = false;
  void btnOnClick(String btnValue){
    print(btnValue);
    if(btnValue == "AC"){
      textToDisplay="";
      firstNum = 0;
      secondNum =0;
      history = "";
      res="";
    }
    else if(btnValue == "+" || btnValue == "-" || btnValue == "×" || btnValue == "÷"|| btnValue =="%")
      {
        bool hasDecimalPoint = textToDisplay.contains('.');
        firstNum = hasDecimalPoint ? double.parse(textToDisplay) : int.parse(textToDisplay);
        res="";
        operation=btnValue;
      }
    else if(btnValue == "=")
      {
        bool hasDecimalPoint = textToDisplay.contains('.');
        secondNum = hasDecimalPoint ? double.parse(textToDisplay) : int.parse(textToDisplay);

        if(operation=="+")
        {
          res=(firstNum+secondNum).toString();
          history=firstNum.toString() +operation.toString() + secondNum.toString();
        }
        if(operation=="-")
        {
          res=(firstNum - secondNum).toString();
          history=firstNum.toString() +operation.toString() + secondNum.toString();
        }
        if(operation=="×")
        {
          res=(firstNum*secondNum).toString();
          history=firstNum.toString() +operation.toString() + secondNum.toString();
        }
        if(operation=="÷")
        {
          res=(firstNum/secondNum).toStringAsFixed(2);
          history=firstNum.toString() +operation.toString() + secondNum.toString();
        }
        if(operation=="%")
        {
          res=(firstNum%secondNum).toString();
          history=firstNum.toString() +operation.toString() + secondNum.toString();
        }
        //flag = false;
      }
    else{
      if(btnValue == ".")
        {
          if(res.contains(".")==false){
            res= (textToDisplay + btnValue).toString();
            //flag =true;
          }
        }
      else {
        if(res.endsWith(".")){
          String val = res + btnValue;
          res = double.parse(val).toStringAsFixed(2);
        }
        else{
          bool hasDecimalPoint = textToDisplay.contains('.');
          res= hasDecimalPoint ? double.parse(textToDisplay + btnValue).toStringAsFixed(2) :int.parse(textToDisplay + btnValue).toString();
        }
      }
    }
    setState(() {
      textToDisplay = res;
    });


  }
  Widget calcButton(String btnTxt, Color btnColor, Color txtColor,Function callback) {
    return Container(
      width: 85.0, // Set a fixed width
      height: 85.0, // Set a fixed height
      child: ElevatedButton(
        child: Text(
          btnTxt,
          style: TextStyle(
            fontSize: 35,
            color: txtColor,
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(CircleBorder()),
          backgroundColor: MaterialStateProperty.all(btnColor),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.all(19.0), // Adjust the padding as needed
          ),
        ),
        onPressed: (){
          callback(btnTxt);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 6.6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  child: Text(
                    history,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(color: Color(0x66ffffff), fontSize: 40),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  child: Text(
                    textToDisplay,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 60),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
              child: Divider(
                thickness: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton("AC", Colors.grey[400]!, Colors.black,btnOnClick),
                  calcButton("+/-",Colors.grey[400]!, Colors.black,btnOnClick),
                  calcButton("%", Colors.grey[400]!, Colors.black,btnOnClick),
                  calcButton("\u00F7", Colors.amber[700]!, Colors.white,btnOnClick),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton("7",Colors.grey[850]!, Colors.white,btnOnClick),
                  calcButton("8", Colors.grey[850]!, Colors.white,btnOnClick),
                  calcButton("9", Colors.grey[850]!, Colors.white,btnOnClick),
                  calcButton("\u00D7", Colors.amber[700]!, Colors.white,btnOnClick),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton("4",Colors.grey[850]!, Colors.white,btnOnClick),
                  calcButton("5", Colors.grey[850]!, Colors.white,btnOnClick),
                  calcButton("6", Colors.grey[850]!, Colors.white,btnOnClick),
                  calcButton("-", Colors.amber[700]!, Colors.white,btnOnClick),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton("1",Colors.grey[850]!, Colors.white,btnOnClick),
                  calcButton("2", Colors.grey[850]!, Colors.white,btnOnClick),
                  calcButton("3", Colors.grey[850]!, Colors.white,btnOnClick),
                  calcButton("+", Colors.amber[700]!, Colors.white,btnOnClick),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Container(
                width:  174.0, // Set a fixed width
                height: 80.0, // Set a fixed height
                child: ElevatedButton(
                  child: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
                    backgroundColor: MaterialStateProperty.all(Colors.grey[850]),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.fromLTRB(30,20,122,20), // Adjust the padding as needed
                    ),
                  ),
                  onPressed: () {
                    btnOnClick("0");
                  },
                ),
              ),
                  calcButton(".", Colors.grey[850]!, Colors.white,btnOnClick),
                  calcButton("=", Colors.amber[700]!, Colors.white,btnOnClick),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
dynamic text ='0';
double numOne = 0;
double numTwo = 0;

dynamic result = '';
dynamic finalResult = '';
dynamic opr = '';
dynamic preOpr = '';
// void calculation(btnText) {
//
//
//   if(btnText  == 'AC') {
//     text ='0';
//     numOne = 0;
//     numTwo = 0;
//     result = '';
//     finalResult = '0';
//     opr = '';
//     preOpr = '';
//
//   } else if( opr == '=' && btnText == '=') {
//
//     if(preOpr == '+') {
//       finalResult = add();
//     } else if( preOpr == '-') {
//       finalResult = sub();
//     } else if( preOpr == 'x') {
//       finalResult = mul();
//     } else if( preOpr == '/') {
//       finalResult = div();
//     }
//
//   } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {
//
//     if(numOne == 0) {
//       numOne = double.parse(result);
//     } else {
//       numTwo = double.parse(result);
//     }
//
//     if(opr == '+') {
//       finalResult = add();
//     } else if( opr == '-') {
//       finalResult = sub();
//     } else if( opr == 'x') {
//       finalResult = mul();
//     } else if( opr == '/') {
//       finalResult = div();
//     }
//     preOpr = opr;
//     opr = btnText;
//     result = '';
//   }
//   else if(btnText == '%') {
//     result = numOne / 100;
//     finalResult = doesContainDecimal(result);
//   } else if(btnText == '.') {
//     if(!result.toString().contains('.')) {
//       result = result.toString()+'.';
//     }
//     finalResult = result;
//   }
//
//   else if(btnText == '+/-') {
//     result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
//     finalResult = result;
//
//   }
//
//   else {
//     result = result + btnText;
//     finalResult = result;
//   }
//
//
//   setState(() {
//     text = finalResult;
//   });
//
// }
//
//
// String add() {
//   result = (numOne + numTwo).toString();
//   numOne = double.parse(result);
//   return doesContainDecimal(result);
// }
//
// String sub() {
//   result = (numOne - numTwo).toString();
//   numOne = double.parse(result);
//   return doesContainDecimal(result);
// }
// String mul() {
//   result = (numOne * numTwo).toString();
//   numOne = double.parse(result);
//   return doesContainDecimal(result);
// }
// String div() {
//   result = (numOne / numTwo).toString();
//   numOne = double.parse(result);
//   return doesContainDecimal(result);
// }
//
//
// String doesContainDecimal(dynamic result) {
//
//   if(result.toString().contains('.')) {
//     List<String> splitDecimal = result.toString().split('.');
//     if(!(int.parse(splitDecimal[1]) > 0))
//       return result = splitDecimal[0].toString();
//   }
//   return result;
// }
//
// }
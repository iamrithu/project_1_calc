import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(children: [
        Expanded(
            child: Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        )),
        Row(
          children: [
            outLineButton('9'),
            outLineButton('8'),
            outLineButton('7'),
            outLineButton('+'),
          ],
        ),
        Row(
          children: [
            outLineButton('6'),
            outLineButton('5'),
            outLineButton('4'),
            outLineButton('-'),
          ],
        ),
        Row(
          children: [
            outLineButton('3'),
            outLineButton('2'),
            outLineButton('1'),
            outLineButton('*'),
          ],
        ),
        Row(
          children: [
            outLineButton('C'),
            outLineButton('0'),
            outLineButton('='),
            outLineButton('/'),
          ],
        ),
      ]),
    );
  }

  Widget outLineButton(String value) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(25.0),
        ),
        onPressed: () => clickButtonValue(value),
        child: Text(
          value,
          style: const TextStyle(fontSize: 35.0, color: Colors.black),
        ),
      ),
    );
  }

  late String res, text = '';
  late double firstNum, secondNum;
  late String opp;

  void clickButtonValue(String val) {
    if (val == 'C') {
      res = "";
      text = "";
    } else if (val == '+' || val == '-' || val == '*' || val == '/') {
      firstNum = double.parse(text);
      opp = val;
      res = '';
    } else if (val == '=') {
      secondNum = double.parse(text);
      switch (opp) {
        case "+":
          res = (firstNum + secondNum).toString();
          break;
        case "-":
          res = (firstNum - secondNum).toString();

          break;
        case "*":
          res = (firstNum * secondNum).toString();

          break;
        case "/":
          res = (firstNum / secondNum).toString();

          break;
      }
    } else {
      res = int.parse(text + val).toString();
    }

    setState(() {
      text = res;
    });
  }
}

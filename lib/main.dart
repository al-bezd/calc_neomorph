import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:function_tree/function_tree.dart';

double width = 0;
double height = 0;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String expression = '';
  num result = 0.0;
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          //backgroundColor: Colors.grey[200],
          body: Builder(
        builder: (context) {
          width = MediaQuery.of(context).size.width;
          height = MediaQuery.of(context).size.height;
          return WillPopScope(
            onWillPop: () async {
              if (expression != '') {
                back();
                return false;
              } else {
                return true;
              }
            },
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    alignment: AlignmentDirectional.center,
                    child: Neumorphic(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Container(
                            child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                alignment: AlignmentDirectional.centerEnd,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: Text(
                                        expression,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[500]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: Text(
                                        '${fetchResult(result)}',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.grey[500]),
                                      ),
                                    ),
                                  ],
                                )))),
                  ),
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Neumorphic(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Container(
                            width: width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  5,
                                  (y) => Row(
                                        children: List.generate(
                                            4, (x) => fetchButton('$y$x')),
                                      )),
                            ))),
                  )
                ],
              ),
            ),
          );
        },
      )),
    );
  }

  fetchButton(String coord) {
    String title = '';
    void Function() onPressed = () {};

    switch (coord) {
      case '00':
        onPressed = () {
          expression = '';
          result = 0;
          setState(() {});
        };
        title = 'AC';

        break;
      case '01':
        title = '(';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };

        break;
      case '02':
        title = ')';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '03':
        title = '/';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '10':
        title = '7';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '11':
        title = '8';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '12':
        title = '9';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '13':
        title = '*';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '20':
        title = '4';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '21':
        title = '5';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '22':
        title = '6';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '23':
        title = '+';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '30':
        title = '1';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '31':
        title = '2';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '32':
        title = '3';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '33':
        title = '-';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '40':
        title = '.';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '41':
        title = '0';
        onPressed = () {
          expression = expression + title;
          setState(() {});
        };
        break;
      case '42':
        title = 'Back';
        onPressed = back;
        break;
      case '43':
        title = '=';
        onPressed = () {
          try {
            result = expression.interpret();
          } catch (e) {
            result = double.infinity;
          }

          setState(() {});
        };

        break;
    }

    return Expanded(
      child: NeumorphicButton(
        margin: EdgeInsets.all(8),
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: title == 'Back'
            ? Center(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.grey[700],
                ),
              )
            : Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
      ),
    );
  }

  fetchResult(res) {
    if (res == null) {
      return '';
    }
    if (res.toString().split('.').last == '0') {
      res = res.ceil();
    }
    return res;
  }

  back() {
    try {
      expression = expression.substring(0, expression.length - 1);
    } catch (e) {
      expression = '';
    }

    setState(() {});
  }
}

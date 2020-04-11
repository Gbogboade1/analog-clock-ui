import 'package:flutter/material.dart';
import 'dart:math' as m;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 11;
  double _width = 0;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width / 1.2;
    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      _width = MediaQuery.of(context).size.height - 64;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellowAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: _width,
                height: _width,
                child: Stack(
                  children: <Widget>[
                    Stack(
                      children: List<Widget>.generate(
                        30,
                        (int i) {
                          return _inBetween(i, m.pi * i / 30);
                        },
                      ),
                    ),
                    Positioned.fill(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.grey.withOpacity(0.4),
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        value: _count / 12,
                        strokeWidth: 32,
                      ),
                    ),
                    Stack(
                      children: List<Widget>.generate(
                        4,
                        (int i) {
                          List<Alignment> _alignmentList = [
                            Alignment.topCenter,
                            Alignment.centerLeft,
                            Alignment.centerRight,
                            Alignment.bottomCenter
                          ];
                          List<String> _text = [
                            "12",
                            "9",
                            "3",
                            "6",
                          ];
                          return _numberText(_text[i], _alignmentList[i]);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: _width / 7 - 2,
                          bottom: _width / 7 - 2,
                          left: _width / 3.5,
                          right: _width / 3.5),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            right: 0,
                            child: _numberTextSmaller("1"),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: _numberTextSmaller("11"),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: _numberTextSmaller("5"),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: _numberTextSmaller("7"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: _width / 7,
                          right: _width / 7,
                          top: (_width / 3.5) - 2,
                          bottom: (_width / 3.5) - 2),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            right: 0,
                            child: _numberTextSmaller("2"),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: _numberTextSmaller("10"),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: _numberTextSmaller("4"),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: _numberTextSmaller("8"),
                          ),
                        ],
                      ),
                    ),
                    _innerText(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () {
                        if (_count < 12) {
                          setState(() {
                            _count += 1;
                          });
                        }
                      },
                      icon: Icon(Icons.arrow_upward),
                      label: Text("")),
                  FlatButton.icon(
                    onPressed: () {
                      if (_count > 0) {
                        setState(() {
                          _count -= 1;
                        });
                      }
                    },
                    icon: Icon(Icons.arrow_downward),
                    label: Text(""),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _numberText(String _figure, Alignment _alignment) {
    return Align(
      alignment: _alignment,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          _figure,
          style:
              Theme.of(context).textTheme.display1.apply(color: Colors.black),
        ),
      ),
    );
  }

  Widget _numberTextSmaller(String _figure) {
    return Text(
      _figure,
      style: Theme.of(context).textTheme.body1.apply(color: Colors.black),
    );
  }

  Widget _innerText() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$_count",
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .apply(color: Colors.black, fontWeightDelta: 2),
              ),
              TextSpan(
                text: "Hr",
                style: Theme.of(context)
                    .textTheme
                    .body2
                    .apply(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _inBetween(int id, double _angle) {
    double _width = 0;

    switch (id) {
      case 5:
      case 10:
      case 20:
      case 25:
        _width = 6;
        break;
      case 0:
      case 15:
        _width = 1;
        break;
      default:
        _width = 3;
    }
    return Align(
      alignment: Alignment.center,
      child: Transform.rotate(
        angle: _angle,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 2,
                width: _width,
                child: Container(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 2,
                width: _width,
                child: Container(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

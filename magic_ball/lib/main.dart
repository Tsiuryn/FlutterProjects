import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BallPage(),
  )
);

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  var numberOfBall = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Center(
          child: Text(
              'Ask Me Anything'
          ),
        ),
      ),
      body: Center(
        child: Expanded(
          child: FlatButton(
            onPressed: randomNumberOfABall,
            child: Image.asset('images/ball$numberOfBall.png'),
          ),
        ),
      ),
    );
  }

  void randomNumberOfABall(){
    setState(() {
      numberOfBall = Random().nextInt(5) + 1;
    });
  }
}






import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(child: Text('First')),
        ),
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/280478.jpg'),
                backgroundColor: Colors.red,
              ),
              Text('Alex TS',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text(
                'Flutter developer',
                style: TextStyle(
                    fontFamily: 'Source',
                    color: Colors.teal[100],
                    fontSize: 25.0),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  height: 200.0,
                  color: Colors.red[900],
                ),
              ),
              Card(
                  color: Colors.white,
                  shadowColor: Colors.green,
                  margin: EdgeInsets.symmetric(vertical: 10.0,
                      horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone_android,
                      color: Colors.teal,
                    ),
                    title: Text('+375 44 545 87 88',
                      style: TextStyle(
                          color: Colors.teal[400],
                          fontFamily: 'Source',
                          fontSize: 20.0
                      ),
                    ),
                  )
              ),
              Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0,
                      horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                    title: Text('dsfj@dksjf.com',
                      style: TextStyle(
                          color: Colors.red[400],
                          fontFamily: 'Source',
                          fontSize: 20.0
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}


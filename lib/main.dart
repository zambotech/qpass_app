import 'package:flutter/material.dart';
import 'package:qpass_app/hex.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Color(hexColor('#FF5A6F')),
        accentColor: Color(0xfffff5f5),
        fontFamily: 'Inter',
        textTheme: TextTheme(
          body1: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Inter',
            color: Colors.red[300],
          ),
        ),
      ),
      home: MyHomePage(title: 'QPass App'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0)),
            Image(
              image: AssetImage("assets/zc_seal.png"),
              height: MediaQuery.of(context).size.height / 3,
              alignment: Alignment.center,
            ),
            Container(
                margin: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height / 11,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Control number',
                  ),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Inter',
                  ),
                )),
            Container(
              margin: EdgeInsets.only(
                left: 20.0,
                top: 0.0,
                right: 20.0,
                bottom: 20.0,
              ),
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 11,
              child: RaisedButton(
                child: Text(
                  'Verify QR Pass',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Inter',
                  ),
                ),
                color: Color(hexColor('#FF5A6F')),
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
          padding: EdgeInsets.all(20.0),
          color: Theme.of(context).accentColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Made by '),
              InkWell(
                  child: Text(
                    'ZamboTech Community',
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 18.0),
                  ),
                  onTap: () =>
                      launch('https://www.facebook.com/zamboangatech')),
            ],
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

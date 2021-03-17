import 'dart:io';
import 'package:flutter/material.dart';

class birthdayPerson {
  static String birthdayPersonName;
  static String currentBirthdayPhoto = 'assets/default.jpg';
  static var numberOfBirthdayPhotos;
  static String birthdayMessage;
  static DateTime birthdayDate;
  static String birthdayMusic;
  static String backgroundImage;

  static String loadImages(counter) {
    currentBirthdayPhoto = 'assets/$counter.jpg';
  }
}

void main() {
  //To personalize the app just change the data of birthdayPerson object.

  birthdayPerson.birthdayPersonName = 'Mamãe';
  birthdayPerson.birthdayMessage =
      'Muitos anos de vida, muita saúde e muita paz!';
  birthdayPerson.birthdayDate = DateTime.parse('2020-23-03');
  birthdayPerson.numberOfBirthdayPhotos = 10;
  birthdayPerson.birthdayMusic = 'sound.mp3';
  birthdayPerson.backgroundImage = 'assets/background.gif';

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Birthday',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
          title: "Feliz Aniversário, ${birthdayPerson.birthdayPersonName}!"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 1;

  void _incrementCounter() {
    setState(() {
      if (counter <= birthdayPerson.numberOfBirthdayPhotos) {
        birthdayPerson.loadImages(counter);
        print(birthdayPerson.currentBirthdayPhoto);
        counter++;
      } else {
        print('Out of Bonds');
        counter = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String birthdayPersonPhotos = 'assets/1.jpg';

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('${birthdayPerson.backgroundImage}'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              birthdayPerson.birthdayMessage,
              textScaleFactor: 2.0,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Image(
              image: AssetImage('${birthdayPerson.currentBirthdayPhoto}'),
              height: 450,
              width: 350,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.arrow_forward),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

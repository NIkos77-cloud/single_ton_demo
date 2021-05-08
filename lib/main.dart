import 'package:flutter/material.dart';

// What if i told you give me a one good name to whom you can contact anytime in your life span?
// No matter what happen with you, that one person always stand by your side.

// I am not sure about your personal life but trust me, i am sure as hell about your programming life
// and you need that one divine creature when you build up large scale application.
// In our case, our soulmate is SINGLETON.

// What happen when you create multiple instace of the same class?
// your answer could be, `then each instance has different data, now tell me what's the point?`

// the point is, that's not a case with singleton class.

// No matter where are you, india or australia, one screen or another, whenever you call singleton, they will be there for you with
// whatever you gave them before.

// No matter how many instance you create for this class, data will be the same.

// Basically singleton provide us the global point to access data through out the app. (That's what everyone say on internet)
// and believe me, it's far better than declaring a global variable.

// This is singleton class
class HandleData {
  static final HandleData _handleData = HandleData._internal();
  Map<String, dynamic> _userData = <String, dynamic>{};

  Map<String, dynamic> get userData => _userData;

  // Like any other class this is your constructor ⬇
  // But wait.....,  why there is a word declared as a "factory"? 🤔
  // what on earth is that?

  // well, This "factory" method allow you to override new logic that comes with any class
  // when you tried to instantiate it. Google it for more info.
  factory HandleData() {
    return _handleData;
  }

  void setUserData(String key, dynamic value) {
    _userData[key] = value;
  }

  HandleData._internal() {
    print('This method call first when you initialied this class');
  }
}

void main() {
  // first instance
  final setUserName = HandleData();

  // second instance
  final setUserName2 = HandleData();
  print(setUserName.userData); // null

  // set data with first instance
  setUserName.setUserData('topic', 'Singleton');

  // set data with second instance
  setUserName2.setUserData('tech', 'Flutter');

  print(setUserName.userData); // {'topic': 'Singleton', 'tech': 'Flutter'}
  print(setUserName2.userData); // {'topic': 'Singleton', 'tech': 'Flutter'}
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Singleton',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Singletone'),
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
  void _incrementCounter() {
    final setUserName = HandleData();
    print(setUserName.userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You should check debug console.',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Global',
        child: Icon(Icons.public),
      ),
    );
  }
}

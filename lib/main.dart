import 'package:flutter/material.dart';
import 'package:scoped_example/changeName.dart';
import 'package:scoped_example/models/user.dart';
import 'package:scoped_model/scoped_model.dart';


void main() => runApp(MyApp(user: User(),));

class MyApp extends StatelessWidget {
  // add user model instance
  final User user;
  // Create constructor for user
  const MyApp({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<User>(
      model: user,
      child: MaterialApp(
        title: 'Flutter Scoped Model',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.amber,
          buttonColor: Colors.amberAccent,
          accentColor: Colors.amber
        ),
        home: MyHomePage(title: 'Flutter Scoped Model'),
      ),
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ScopedModelDescendant<User>(
          builder: (context, child, model) {
            return Text(model.name, style: TextStyle(fontSize: 30.0),);
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditNamePage())),
        tooltip: 'Increment',
        child: Icon(Icons.edit),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_example/models/user.dart';

class EditNamePage extends StatefulWidget {
  _EditNamePageState createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Name'),
      ),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: ScopedModelDescendant<User>(
          builder: (context, child, model) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${model.name}',
                  style: TextStyle(fontSize: 25.0),
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: model.name,
                  ),
                ),
                RaisedButton(
                  child: Text('Update Name'),
                  onPressed: () {
                    model.changeName(_nameController.text);
                    setState(() {
                      _nameController.text = '';                      
                    });
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('name changed to ${model.name}'))
                    );
                  }
                )
              ],
            );
          },
        )
      ),
    );
  }
}
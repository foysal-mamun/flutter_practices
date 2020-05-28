import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'Form Validation';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Homepage(title: appTitle),
    );
  }
}

class Homepage extends StatelessWidget {
  final String title;
  Homepage({ Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: MyForm(title: title),
    );
  }
}

class MyForm extends StatefulWidget {
  final String title;

  MyForm({ Key key, this.title}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode;
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myController.addListener(_printPassword);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    myController.dispose();
    super.dispose();
  }

  void _printPassword() {
    print('Password: ${myController.text}');
  }

  Future showValue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(myController.text)
        );
      }
    );
  }

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter you username'
            ),
            validator: (value) {
              if(value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            onChanged: (text) {
              print('User name: $text');
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter password'
            ),
            focusNode: myFocusNode,
            controller: myController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if(_formKey.currentState.validate()) {
                  Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Press'),
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () => { myFocusNode.requestFocus()},
              child: Text('focus to password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () { return showValue(context); },
              child: Text('Get value')
            ),
          )
        ],
      )
    );
  }
}
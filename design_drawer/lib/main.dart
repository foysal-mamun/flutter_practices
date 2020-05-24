import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle)
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  _MyHomePage createState() => _MyHomePage(title: title);
}

class _MyHomePage extends State<MyHomePage> {
  final String title;
  String body = '';

  _MyHomePage({this.title});

  void changeBody(String text) {
    setState(() {
      body = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: [
            Text(body),
            SnackBarPage()
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Hearer'),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                changeBody('Item 1');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                changeBody('Item 2');
                Navigator.pop(context);
              },
            ),
            SnackBarListTile()
          ],
        )
      ),

    );
  }
}

class SnackBarListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Item 3'),
      onTap: () {
        final snackbar = SnackBar(
          content: Text('Drawer Snackbar'),
          action: SnackBarAction(
            label: 'Close', 
            onPressed: () {

            }
          ),

        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}
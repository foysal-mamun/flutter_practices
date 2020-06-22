import 'package:flutter/material.dart';
import 'MySecondPage.dart';

class MyHomePage extends StatefulWidget {

  MyHomePage({ Key key, this.counter, this.incrementCounter, this.decrementCounter }) : super(key: key);

  final int counter;
  final ValueChanged<void> incrementCounter;
  final ValueChanged<void> decrementCounter;
  
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _onPressed() {
    widget.incrementCounter(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times: '),
            Text(
              widget.counter.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
            RaisedButton(
              child: Text('Next Screen'),
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => MySecondPage(
                      widget.decrementCounter,
                      counter: widget.counter
                    )
                  )
                );
              }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
  
}
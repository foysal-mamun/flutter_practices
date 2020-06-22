import 'package:flutter/material.dart';

class MySecondPage extends StatefulWidget {
  MySecondPage(this.decrementCounter, {Key key, this.counter}) : super(key: key);

  final int counter;
  final ValueChanged<void> decrementCounter;

  _MySecondPageState createState() => new _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  
  void onPressed() {
    widget.decrementCounter(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times: '),
            Text(widget.counter.toString(), style: Theme.of(context).textTheme.headline1,),

          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        tooltip: 'Decrement',
        child: Icon(Icons.indeterminate_check_box),
        backgroundColor: Colors.red,
      ),
    );
  }
}
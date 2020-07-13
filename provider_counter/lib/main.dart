import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Counter(),
    child: MyApp(),
  ));
}

class Counter extends ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<Counter>(context, listen: false).increment(),
        tooltip: 'Incremetn',
        child: Icon(Icons.add),
      ),
    );
  }
}

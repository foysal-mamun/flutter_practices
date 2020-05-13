import 'package:flutter/material.dart';
import 'dart:collection';

class ByExampleDemos extends StatelessWidget {
	static const String demoName = 'By Example';
  	static const String routeName = '/by_example/by_example';

  	@override
  	Widget build(BuildContext context) {
  		return Scaffold (
  			appBar: AppBar(
  				title: Text(ByExampleDemos.demoName)
  			),
        body: GridContainer()
  		);
  	}
}

class GridContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: GridView.extent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        children: <Widget>[

          customRaisedButton( context: context, label: 'Hello World', callback: () => print('Hello World!!!') ),
          
          customRaisedButton( context: context, label: 'Value', callback: () {
            print("dart" + " Lang");
            print("1+1=${1+1}");
            print("0.7/0.3=${0.7/0.3}");
            print(true && false);
            print(false || true);
            print(!true);
          }),

          customRaisedButton(context: context, label: 'Variables', callback: () {
            var a = "initial";
            print(a);

            num i = 10;
            print(i);

            final num c = 99;
            print(c);
            //c = 10;

            const double d = 44.00;
            print(d);
            //d = 10;
          }),

          customRaisedButton(context: context, label: 'For Loop', callback: (){
            print('C type for loop');
            for (var i = 0; i < 3; i++) {
              print(i);
            }

            print('For IN');
            var c = [1,2,3];
            for (var i in c) {
              print(i);
            }

            print('for each');
            var cbs = [];
            for (var i = 6; i < 8; i++) {
              cbs.add(() => print(i));
            }
            cbs.forEach((c) => c());
          }),

          customRaisedButton(context: context, label: 'If/Else', callback: () {

            if(7%2 != 0) {
              print('Odd');
            } else {
              print('Even');
            }

            var isAlive = true;
            var monday = isAlive ? 'doctor' : null;
            print('Monday Appointment: $monday');

          }),

          customRaisedButton(context: context, label: 'Null Aware Opt', callback: () {

              var monday = 'doctor';
              var tuesday;
              var next = tuesday ?? monday;
              print('Next Appointment: $next');

              next = null;
              var wendnesday = 'xyz';
              next ??= wendnesday;
              print('Next Appointment: $next');

              String thursday = 'abc';
              var length = thursday?.length;
              print('length: $length');
          }),

          customRaisedButton(context: context, label: 'While/do while', callback: () {

            var i = 0;
            while(i++ < 2) {
              print('while $i');
            }

            var j = 5;
            do {
              print('dowhile $j');
            } while( j-- > 1);

          }),

          customRaisedButton(context: context, label: 'Switch', callback: () {

            var piece = 'knight';
            switch(piece) {
              case 'bishop':
                print('diagonal');
                break;
              case 'knight':
                print('L-shape');
                break;
              default:
                print('checkmate');
            }

            piece = 'queen';
            switch(piece) {
              case 'queen':
              case 'bishop':
                print('diagonal');
                break;
            }

          }),

          customRaisedButton(context: context, label: 'Exceptions', callback: () {

            var p = new Potato(7);
            
            try {
              p.peel();  
            } on FoodSpoiledError catch(_) {
              print('nope nope nope');
            }

            try {
              throw('potato');
            } catch (_) {
              print('caught a flying potato');
            }

            //p.peel();
            //print('not reched');

          }),

          customRaisedButton(context: context, label: 'List', callback: () {

            var list = new List(3);
            list[0] = 'a';
            list[1] = 'b';
            list[2] = 'c';
            print(list);

            var growable = new List();
            growable.addAll(['grow', 'able']);
            print(growable);

            var list2 = ['also', 'growable'];
            list2.add('42');
            print(list2);

            var list3 = [47, 3, 25];
            try {
              for (var item in list3) {
                if(item<10) {
                  list3.remove(item);
                }
              }
            } catch(e) {
              print(e);
            }
            print(list3);

          }),

          customRaisedButton(context: context, label: 'Map', callback: (){

            var colors = new Map();
            colors['blue'] = false;
            colors['red'] = true;
            print(colors);

            var shapes = {
              'square': false,
              'triangle': true
            };
            print(shapes);

            for (var key in shapes.keys) print(key);
            for (var value in shapes.values) print(value);

          }),

          customRaisedButton(context: context, label: 'Set', callback: (){

            var medals = new Set();
            medals.add('gold');
            medals.add('silver');
            medals.add('bronze');
            print(medals);

            medals.add('gold');
            print('has gold? ${medals.contains('gold')}');
            print('has platinum? ${medals.contains('platinum')}');

            var meals = new Set.from(['breakfast', 'lunch', 'dinner']);
            print(medals.union(meals));
            print(medals.lookup('gold'));
            print(medals.lookup('platinum'));
            print(medals.difference(meals));

            for (var item in medals) {
              print(item);
            }

          }),

          customRaisedButton(context: context, label: 'Queue', callback: () {

            var q = new Queue.from([300, 200, 100, 500]);
            print(q.takeWhile((i) => i > 100 ));

            while(q.first > 100) {
              q.removeFirst();
            }
            print(q);

          }),

          customRaisedButton(context: context, label: 'Function', callback: () {

            yell(str) => str.toUpperCase();
            List lines(String str) {
              return str.split('\n');
            }

            const poem = '''
            the wren
            Earns his living
            Noiselessly.''';

            var poemLines = lines(poem);
            print(poemLines);

            print(yell(poemLines.first));

            var whisper = (str) => str.toLowerCase();
            print(poemLines.map(whisper).last);

          }),

        ]
      )
    );
  }

  Widget customRaisedButton({ BuildContext context, String label, VoidCallback callback }) {

    return RaisedButton(
      child: Text(label),
      onPressed: callback
    );

  }
}

class FoodSpoiledError extends StateError {
  FoodSpoiledError(String msg) : super(msg);
}

class Potato {
  int age;
  Potato(this.age);

  String peel() {

    if(age > 4) {
      throw new FoodSpoiledError('Your patato is spoiled.');
    }

    return 'peeled';
  }
}
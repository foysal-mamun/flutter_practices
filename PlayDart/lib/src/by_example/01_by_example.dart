import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'dart:io';
import '../cuslibs/utils.dart' as utils;

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

          customRaisedButton(context: context, label: 'Optoinal Params', callback: () {

            String yell(String str, [bool exclaim = false]) {
              var result = str.toUpperCase();
              if(exclaim) result = result + '!!!';

              return result;
            }

            String whisper(String str, {bool mysteriously: false}) {

              var result = str.toLowerCase();
              if(mysteriously) result = result + '...';

              return result;
            }

            print(yell('Foysal '));
            print(yell('Foysal ', true));
            print(whisper('Mamun '));
            print(whisper('Mamun ', mysteriously: true));

          }),

          customRaisedButton(context: context, label: 'Lexical Scope', callback: () {

            var functions = [];
            for(var i = 0; i < 2; i++) {
              functions.add(() => i);
            }

            functions.forEach((fn) => print(fn()));

          }),

          customRaisedButton(context: context, label: 'Function Types', callback: () {

            bool positive(int n) => n >= 0;
            bool lessThan100(int n) => n < 100;

            bool bothValid(int n, Validator v1, Validator v2) {
              return v1(n) && v2(n);
            }

            print( bothValid(10, positive, lessThan100) );

          }),

          customRaisedButton(context: context, label: 'Unused Variables', callback: () {

            for(var i in new Iterable.generate(1)) {
              print('not usesing "i"');
            }

            for(var _ in new Iterable.generate(1)) {
              print('no warn');
            }

          }),

          customRaisedButton(context: context, label: 'Constants', callback: () {

            const name = 'greg';
            print(name);

            const Rectangle bounds = const Rectangle(0, 0, 5, 5);
            print(bounds);

          }),

          customRaisedButton(context: context, label: 'Final', callback: () {

            //final String name = 'Foysal';
            //try {
            //  name = 'Mamun';
            //} catch (e) {
            //  print(e);
            //}

          }),

          customRaisedButton(context: context, label: 'Static', callback: () {

            //var p = new Potato();
            print(Potato.amount);
            print(Potato.getAmount());
          }),

          customRaisedButton(context: context, label: 'Classes', callback: () {

            var origin = new Position1()
              ..x = 0
              ..y = 0;
            print("${origin.x}, ${origin.y}");

            var other = new Position1()
              ..x = -5
              ..y = 6;
            print('${other.x}, ${other.y}');
            print(origin.distanceTo(other));

          }),

          customRaisedButton(context: context, label: 'Constructors', callback: () {

            print(new Position(30, 40));
            print(new Position.atOrigin());
            print(new Position.fromMap({ 'x': 4, 'y': 100}));

          }),

          customRaisedButton(context: context, label: 'Initializer Lists', callback: () {

            print(new Position2(1, 2));

          }),

          customRaisedButton(context: context, label: 'Getters and Setters', callback: () {

            var p = new Position3(10, 20);
            print(p._x);
            p.x = 20;
            print(p._x);
            print(p.z);

          }),
          customRaisedButton(context: context, label: 'Inheritance', callback: () {

            var dog = new Dog('Barry');
            var pika = new Pikachu();

            [dog, pika].forEach((a) => print('${a.name} have been release: ${a.noise}') );
          }),
          customRaisedButton(context: context, label: 'Mixins', callback: () {

            var origin = new Position4()
              ..x = 0
              ..y = 0;

            var square = new SquareView()
              ..x = 5
              ..y = 5
              ..width = 10
              ..height = 10;

              print(square.distanceTo(origin));
              print(square.area);

          }),
          customRaisedButton(context: context, label: 'Libraries', callback: () {

            print(utils.shout('Foysal'));
            print(utils.whisper('Mamun'));
          }),
          customRaisedButton(context: context, label: 'Futures', callback: () {

            //onReady.then((String status) {
            //  print(status);
            //});

          }),
          customRaisedButton(context: context, label: 'Streams', callback: () {

            new Stream.fromIterable([1,3,5]).listen((i) {

              print(i);

            });

            new Stream.periodic(new Duration(milliseconds: 300)).take(3).listen((_) {
              print('s2');
            });

          }),
          customRaisedButton(context: context, label: 'Iterators', callback: () {

            var iter = [1,2,3].iterator;
            while(iter.moveNext()) {
              print(iter.current);
            }

          }),
          customRaisedButton(context: context, label: 'Iterables', callback: () {

            var set = new Set()..add('1')..add(2);
            for(var num in set) {
              print(num);
            }

          }),
          customRaisedButton(context: context, label: 'Https', callback: () {

            //var server = await HttpServer.bind(InternetAddress.ANY_IP_V4, 8777);
            //print('serving on port ${server.port}');

          }),
          customRaisedButton(context: context, label: 'Unused', callback: () {}),
          customRaisedButton(context: context, label: 'Unused', callback: () {}),
          customRaisedButton(context: context, label: 'Unused', callback: () {}),
          customRaisedButton(context: context, label: 'Unused', callback: () {}),

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

  Future get onReady {

    var dur = new Duration(seconds: 1);
    var oneSecond = new Future.delayed(dur);

    return oneSecond.then((_) {
      return 'loaded';
    });
  }
}

class SquareView extends Square with Position4 {
  
}

class Position4 {
  int x;
  int y;

  double distanceTo(Position4 other) {
    var dx = other.x - x;
    var dy = other.y - y;

    return sqrt( dx*dx + dy*dy);
  }
}

class Square {
  int width;
  int height;

  int get area => width * height;
}

abstract class Animal {
  String name;

  Animal(this.name);

  String get noise;
  
}

class Dog extends Animal {
  Dog(String name) : super(name);

  String get noise => 'bark';
}

class Pikachu implements Animal {
  String name = 'Pikachu';
  String get noise => 'pika';
}

class Position3 {
  int _x;
  int _y;

  Position3(this._x, this._y);

  void set x(int val) {
    _x = val;
  }

  double get z => sqrt(_x);
}

class Position2 {
  final int x;
  final int y;
  final double z;

  Position2(x, y) : this.x = x, this.y = y, z = sqrt(x+y);

  String toString() => '[$x, $y, $z]';
}

class Position1 {
  int x;
  int y;

  double distanceTo(Position1 other) {

    var dx = other.x - x;
    var dy = other.y - y;

    return sqrt(dx * dx + dy * dy);
  }
}

class Position {
  int x;
  int y;

  Position(this.x, this.y);

  Position.atOrigin() {
    x = 0;
    y = 0;
  }

  factory Position.fromMap(Map m) {
    return new Position(m['x'], m['y']);
  }

  String toString() => "[$x, $y]";

  double distanceTo(Position other) {

    var dx = other.x - x;
    var dy = other.y - y;

    return sqrt(dx * dx + dy * dy);
  }
}

typedef Validator = bool Function(int n);

class FoodSpoiledError extends StateError {
  FoodSpoiledError(String msg) : super(msg);
}

class Potato {
  int age;
  static int amount = 10;

  Potato(this.age);
  

  String peel() {

    if(age > 4) {
      throw new FoodSpoiledError('Your patato is spoiled.');
    }

    return 'peeled';
  }

  static int getAmount() => amount;
}
import 'dart:math';

import 'package:characters/characters.dart';
import 'package:flutter/material.dart';

class BasicFeatures extends StatelessWidget {
  
  static const String demoName = 'Basic Features';
  static const String routeName = '/basic/basic_features';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(BasicFeatures.demoName),
      ),
      body: GridContainer(),
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
          customRaisedButton(context: context, label: 'Integer Var', callback: () {
            var aNumber = 43;
            displayOutput(context, 'The number is $aNumber.');
          }),
          customRaisedButton(context: context, label: 'Dynamic Var', callback: () {
            dynamic _dynamic = 'This is dynamic variable';
            displayOutput(context, _dynamic);
          }),
          customRaisedButton(context: context, label: 'String Var', callback: () {
            String name = 'Foysal 123';
            displayOutput(context, name);
          }),
          customRaisedButton(context: context, label: 'Play with final', callback: () {
            final firstName = 'Foysal';
            final String lastName = 'Mamun';
            // firstName += ' - '; 
            displayOutput(context, '$firstName $lastName');
          }),
          customRaisedButton(context: context, label: 'Play with const', callback: () {
            const bar = 1000000;
            const double atm = 1.01325 * bar;
            // firstName += ' - '; 
            displayOutput(context, 'Standard atmosphere $atm of $bar Unit of pressure');
          }),
          customRaisedButton(context: context, label: 'Turn a String to Number', callback: () {
            var one = int.parse('1');
            print('one == 1 => ${one == 1}');

            var onePointOne = double.parse('1.1');
            print('onePointone == 1.1 => ${onePointOne == 1.1}');

            String oneAsString = 1.toString();
            print('oneAsString == \'1\' => ${oneAsString == '1'}');

            String piAsString = 3.14159.toStringAsFixed(2);
            print('PiAsString == 3.12 => ${piAsString == '3.14'}');

          }),
          customRaisedButton(context: context, label: 'Play with String', callback: () {
            var s1 = 'String' ' concatenation ' "works even over line breaks";
            print('String concat 1 => $s1');

            var s2 = '''
            you can 
            create multi-line 
            strings like 
            this one.
            ''';
            print('String concat 2 => $s2');

            var s3 = """
            double qoutation 
            also works
            """;
            print('String multi line => $s3');

            var s4 = r'In a raw string. \n not even...';
            print('Row String => $s4');
          }),
          customRaisedButton(context: context, label: 'Play with Boolean', callback: () {
            var fullName = '';
            print(fullName.isEmpty);
          }),
          customRaisedButton(context: context, label: 'Play with Lists', callback: () {
            var list = [1,2,3];
            print('length = ${list.length}');
            print('First element = ${list[0]}');

            var list2 = [0, ...list];
            print('By Spread op => ${list2.length}');

            var listofStrings = [
              '#0',
              for ( var i in list) '#$i'
            ];
            print(listofStrings);
          }),
          customRaisedButton(context: context, label: 'Play with Sets', callback: () {
            var chars = {'a', 'b', 'c'};
            print(chars);

            var eles = <String>{};
            eles.add('d');
            eles.addAll(chars);
            print(eles);
          }),
          customRaisedButton(context: context, label: 'Play with Maps', callback: () {
            var gifts = {
              'first': 'partridge',
              'second': 'turtledoves',
              'fifth': 'golden rings'
            };
            print(gifts);

            var nobleGases = {
              2: 'helium',
              10: 'neon',
              18: 'argon'              
            };
            print(nobleGases);

            var nums = Map();
            nums[0] = 0;
            nums[1] = 1;
            print(nums);

            gifts['fourth'] = 'calling birds';
            print(gifts);

          }),
          customRaisedButton(context: context, label: 'Runes and grapheme clusters', callback: () {
            var hi = 'Hi 🇩🇰';
            print(hi);
            print(hi.characters.last);
          }),
          customRaisedButton(context: context, label: 'Functions', callback: () {
            print('typed function => ${doMultiply(2)}');
            print('without typed function => ${doMultiply1(2)}');
            print('arrow function => ${doMultiply2(2)}');
            print('named param function => ${namedParamFun(a: 1, b: 3)}');
            print('required param function => ${requiredParamFun(a: 1, b: 5)}');
            print('Positional params call 1 => ${say('bob', 'Howdy')}');
            print('Positional params call 2 => ${say('bob', 'Howdy', 'iphone')}');
            print('default ParamV alues call 1 => ${defaultParamValues(a: 1, b: 6)}');
            print('default ParamV alues call 2 => ${defaultParamValues(b: 10)}');
            print('default value for positoinal params => ${say1('foysal', 'hi')}');

            var list = [1,2,3];
            print('Functions as first-class objects');
            list.forEach(printElement);
            var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
            print(loudify('Foysal'));

            print('Lexical closures || Function type');
            var add2 = makeAdder(2);
            print('add 2 3 => ${add2(3)}');
          }),
          customRaisedButton(context: context, label: 'For Loops', callback: () {
            forLoops();
          }),
          customRaisedButton(context: context, label: 'Assert', callback: () {
            testAssert();
          }),
          customRaisedButton(context: context, label: 'Classes', callback: () {
            testClasses();
          }),
          customRaisedButton(context: context, label: 'Generics', callback: () {
            testGenerics();
          })
        ],
      ),
    );
  }

  Widget customRaisedButton({BuildContext context, String label, VoidCallback callback}) {
    return RaisedButton(
      child: Text(label),
      onPressed: callback
    );
  }

  void displayOutput(BuildContext context, dynamic content) {
    print(content);
    showCustomSnackBar(context, content);
  }

  void showCustomSnackBar(BuildContext context, dynamic content) {
    final snackbar = SnackBar(
      content: Text(content),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  int doMultiply(int aNum) {
    return aNum * aNum;
  }

  doMultiply1(aNum) {
    return aNum * aNum;
  }

  int doMultiply2(aNum) => aNum * aNum;

  int namedParamFun({ int a, int b }) {
    return a + b;
  }

  int requiredParamFun({ int a, @required int b }) {
    return a + b;
  }

  String say(String from, String msg, [String device]) {
    var result = '$from says $msg';
    return device != null ? '$result with a $device' : result;
  }

  int defaultParamValues({int a = 1, int b = 2}) {
    return a + b;
  }

  String say1(String from, String msg, [String device = 'iphone']) {
    return '$from saya $msg ${device != null ? 'with $device' : ''}';
  }

  void printElement(int e) {
    print(e);
  }

  Function makeAdder(num addBy) {
    return (num i) => addBy + i;
  }

  void forLoops() {
    var message = StringBuffer('Dart is fun');
    for(var i = 0; i < 5; i++) {
      message.write('!');
    }
    print(message);

    var callbacks = [];
    for(var i = 0; i < 2; i++ ) {
      callbacks.add( () => print('-$i'));
    }
    callbacks.forEach((c) => c());

    var collection = [1,2,3];
    for(var x in collection) {
      print(x);
    }
  }

  void testAssert() {

    try {
      assert(10 < 9, '10 < 9');
      assert(10 == 10, '10 == 10');
    } catch (e) {
      print('$e');
    }
    
    print('testing assert');
    assert(5 == 5);
  }

  void testClasses() {
    var point = Point(1, 3);
    point.x = 4;
    print('unnamed constructor x = ${point.x}, y = ${point.y}');

    var p1 = Point.origin();
    print('named constructor, x = ${p1.x}, y = ${p1.y}');

    var emp = Employee.fromJson({});
    (emp as Person).fristName = 'foysal';
    print(emp.fristName);

    var p2 = Point.initializ(2, 2);
    print(p2.disFromOrigin);

    var p3 = Point.redirecting(5);
    print('redirecting constructor, x = ${p3.x}, y = ${p3.y}, disFromOrigin = ${p3.disFromOrigin}');

    var logger = Logger('UI');
    logger.log('Button clicked');

    var logger1 = Logger('UI');
    logger1.log('Button clicked');

    var rect = Rectangle(3, 4, 20, 15);
    print('rect left = ${rect.left}');
    print('rect right = ${rect.right}');
    rect.right = 12;
    print('rect left = ${rect.left}');
    print('rect right = ${rect.right}');

    var effctiveDoer = EffetiveDoer();
    effctiveDoer.doSomething();

    print(greetBob(Person1('Kathy')));
    print(greetBob(Imposter()));

    
    print(Color1.red);

    List<Color1> colors = Color1.values;
    print(colors);

    var pp1 = Point1(2, 2);
    var pp2 = Point1(4, 4);
    print( Point1.distanceBetween(pp1, pp2) );

  }

  String greetBob(Person1 person) => person.greet('Bob');

}


enum Color1 {red, green, blue}

class Point {
  num x;
  num y;
  num z = 0;
  num disFromOrigin;

  Point(this.x, this.y);

  Point.origin() {
    x = 0;
    y = 0;
  }

  Point.initializ(this.x, this.y) : disFromOrigin = sqrt(x*x + y*y);

  Point.redirecting(num x) : this.initializ(x, 4);

}

class Person {
  String fristName;

  Person.fromJson(Map data) {
    print('In person');
  }
}

class Employee extends Person with Musical {
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('In Employee');
    entertainMe();
  }
}

class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    print(_cache);
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  Logger._internal(this.name);

  void log(String msg) {
    if(!mute) print(msg);
  }
}

class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;
  set right(num value) => left = value - width;
}

abstract class Doer  {
  void doSomething();
}

class EffetiveDoer extends Doer {
  @override
  void doSomething() {
    print('abstract');  // TODO: implement doSomething
  }
}

class Person1 {
  final _name;

  Person1(this._name);

  String greet(String who) => 'Hello, $who, I am $_name.';
} 

class Imposter implements Person1 {
  get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

mixin Musical {

  void entertainMe() {
    print('Playing Piano');
  }
}

class Point1 {
  num x, y;

  Point1(this.x, this.y);

  static num distanceBetween(Point1 a, Point1 b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;

    return sqrt(dx * dx + dy * dy);

  }
}

void testGenerics() {

  var names = List<String>();
  names.addAll(['a', 'b', 'c']);

  var names1 = <String>['s', 'k', 'l'];
  var uniqueNames = <String>{'s', 'k', 'l'};
  var pages = <String, String>{
    'index.html': 'Home Page',
    'robots.txt': 'Hints for web robots',
  };
  // names.add(1);
}

abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}
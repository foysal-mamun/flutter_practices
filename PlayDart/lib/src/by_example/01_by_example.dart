import 'package:flutter/material.dart';

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
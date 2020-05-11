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
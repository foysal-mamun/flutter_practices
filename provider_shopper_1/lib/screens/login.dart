import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(80.00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome'),
              TextFormField(),
              TextFormField(),
              SizedBox(
                height: 80,
              ),
              RaisedButton(
                onPressed: null,
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<Album> _futureAlbum;
  
  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delete Data Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Delete Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
                if(snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${snapshot.data?.title ?? 'Deleted'}'),
                      RaisedButton(
                        child: Text('Delete data'),
                        onPressed: () {
                          setState(() {
                            _futureAlbum = deleteAlbum(snapshot.data.id.toString());
                          });
                        }
                      )
                    ],
                  );
                } else if(snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class Album {
  final int id;
  final String title;

  Album({ this.id, this.title });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title']
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if(response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }

}

Future<Album> deleteAlbum(String id) async {
  final http.Response response = await http.delete(
    'https://jsonplaceholder.typicode.com/albums/$id',
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8'
    }
  );

  if (response.statusCode == 200 ) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to delete album');
  }
}
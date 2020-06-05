import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking fetch data',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networking fetch data'),
      ),
      body: Center(
        child:  MyAlbum(),
      ),
    );
  }
}

class MyAlbum extends StatefulWidget {

  @override
  _MyAlbum createState() => _MyAlbum();
}

class _MyAlbum extends State<MyAlbum> {
  Future<Album> futureAlbum;
  
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return Text(snapshot.data.title);
        } else if(snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return CircularProgressIndicator();
      }
    );
  }

  Future<Album> fetchAlbum() async {
    final res = await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if(res.statusCode == 200) {
      return Album.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({ this.userId, this.id, this.title });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title']
    );
  }
}


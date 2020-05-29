import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  final String title = 'InkWell Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: MyHomePage(title: title)
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  final String title;

  MyHomePage({ Key key, this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: Center(
        child: Column(
          children: [
            MyButton(),
            MyTabButton(),
            Expanded(
              child: MyAppState(),
            ),
            Expanded(child: MyImageNet() ),
            Expanded(child: MyImageFade() ),
            Expanded(child: MyImageCache() ),
          ],
        )
      ),
    );
  }
}

class MyImageCache extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => CircularProgressIndicator(),
      imageUrl: 'https://picsum.photos/250?image=9'
    );
  }
}

class MyImageNet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Image.network('https://picsum.photos/250?image=652');
  }
}

class MyImageFade extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage, 
      image: 'https://picsum.photos/250?image=9'
    );
    // Image.network('https://picsum.photos/250?image=9');
  }
}

class MyAppState extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppState> {

  final items = List<String>.generate(20, (index) => "Item ${index+1}");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          key: Key(item), 
          child: ListTile(title: Text('$item')),
          background: Container(color: Colors.red, child: Text('deleting'),),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });

            Scaffold.of(context).showSnackBar(SnackBar(content: Text('$item Dismissed')));
          },
        );
      }
    );
  }
}

class MyTabButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Text('My Tap button'),
      ),
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('My tap tapped')));
      },
    );
  }
}

class MyButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text('Flat Button')
      ),
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Tap')));
      },
    );
  }
}
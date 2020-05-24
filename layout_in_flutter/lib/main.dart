import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Layout Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue, Icons.call, 'Call'),
          _buildButtonColumn(Colors.blue, Icons.near_me, 'Route'),
          _buildButtonColumn(Colors.blue, Icons.share, 'Share')
        ]
      )
    );

    Widget layout1 = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Hello World',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 32,
              color: Colors.black87
            )
          ),
          Image.asset(
            'images/lake.jpg'
          ),
          Icon(
            Icons.star,
            color: Colors.red[500]
          )
        ]
      )
    );

    Widget layout2 = Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        border: Border.all(width: 10, color: Colors.black38),
        borderRadius: const BorderRadius.all(const Radius.circular(8))
      ),
      margin: const EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded( child: Image.asset('images/lake.jpg') ),
          Expanded( child: Image.asset('images/lake.jpg'), flex: 2 ),
          Expanded( child: Image.asset('images/lake.jpg') )
        ]
      )
    );
   
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: 
        //ListView(
        //  children: [
        //    Image.asset(
        //      'images/lake.jpg',
        //      width: 600,
        //      height: 240,
        //      fit: BoxFit.cover
        //    ),
        //    titleSection,
        //    buttonSection,
        //    textSection,
        //    Divider(height: 1),
        //    layout1,
        //    Divider(),
        //    layout2,
        //    Divider(),
        //  ]
        //)
        //_buildStack(),
        //_buildList(),
        //_buildCard(),
        _buildCardStack()
    );
  }

  Widget _buildCardStack() => SizedBox(
    height: 350,
    width: 300,
    child: Card(
      child: Column(
        children: [
          Stack(
            alignment: const Alignment(0.1, 0.6),
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/lake.jpg'),
                radius: 100
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black45
                ),
                child: Text(
                  'Foysal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )
                )
              )
            ]
          ),
          ListTile(
            title: Text('Number 10'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Whitehaven Beach'),
                Text('Whitesunday Island, Whitesunday Beach'),
                Text('Whitesunday Island, Whitesunday Beach')
              ]
            ),
            isThreeLine: true
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector( 
                    child: Text(
                      'Share', 
                      style: TextStyle( 
                        decoration: TextDecoration.underline, 
                        color: Colors.blue[500]
                      )
                    ) 
                  )
                ),
                Expanded(
                  child: GestureDetector( 
                    child: Text(
                      'Explore', 
                      style: TextStyle( 
                        decoration: TextDecoration.underline, 
                        color: Colors.blue[500]
                      )
                    ) 
                  )
                )
              ]
            )
          )
        ]
      )
    )
  );

  Widget _buildCard() => SizedBox(
    height: 210,
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              '1625 Main Street',
              style: TextStyle(
                fontWeight: FontWeight.w500
              )
            ),
            subtitle: Text('My City, CA 99984'),
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500]
            )
          ),
          Divider(),
          ListTile(
            title: Text(
              '(408) 555-1212',
              style: TextStyle(
                fontWeight: FontWeight.w500
              )
            ),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.blue[500]
            )
          ),
          ListTile(
            title: Text(
              'costa@example.com'
            ),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.blue[500]
            )
          )
        ]
      )
    )
  );

  Widget _buildList() => ListView(
    children: [
      _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
      _tile('The Castro Theater', '429 Castro St', Icons.theaters),
      _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
      _tile('Roxie Theater', '3117 16th St', Icons.theaters),
      _tile('United Artists Stonestown Twin', '501 Buckingham Way',
          Icons.theaters),
      _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
      Divider(),
      _tile('Kescaped_code#39;s Kitchen', '757 Monterey Blvd', Icons.restaurant),
      _tile('Emmyescaped_code#39;s Restaurant', '1923 Ocean Ave', Icons.restaurant),
      _tile(
          'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
      _tile('La Ciccia', '291 30th St', Icons.restaurant),
    ]
  );

  ListTile _tile( String title, String subtitle, IconData icon ) => ListTile(
    title: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20
      )
    ),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500]
    )
  );


  Widget _buildStack() => Container(
    padding: const EdgeInsets.all(32),
    child: Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('images/lake.jpg'),
          radius: 100
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black45
          ),
          child: Text(
            'Foysal Mamun',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            )
          )
        )
      ]
    )
  );

  

  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true
    )
  );


  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                )
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500]
                )
              )
            ]
          )
        ),
        Icon(
          Icons.star,
          color: Colors.red[500]
        ),
        Text('41')
      ]
    )
  );

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }


  

  
  

}

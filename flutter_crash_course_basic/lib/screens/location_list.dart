import 'package:flutter/material.dart';
import 'package:flutter_crash_course_basic/models/location.dart';
import 'package:flutter_crash_course_basic/screens/location_details.dart';
import 'package:flutter_crash_course_basic/styles/style.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;

  LocationList(this.locations);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location", style: Styles.navBarTitle),
      ),
      body: ListView.builder(
        itemCount: this.locations.length,
        itemBuilder: _listViewItemBuilder,
      ),
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var location = this.locations[index];
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      leading: _itemThumbnail(this.locations[index]),
      title: _itemTitle(this.locations[index]),
      onTap: () => _navigateToLocationDetail(context, location),
    );
  }

  void _navigateToLocationDetail(BuildContext context, Location location) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => LocationDetail(location) 
    ));
  }

  Widget _itemThumbnail(Location location) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: Image.network(location.url, fit: BoxFit.fitWidth),
    );
  }


  Widget _itemTitle(Location location) {
    return Container( child: Text('>>> ${location.name}', style: Styles.textDefault,));
  }

}
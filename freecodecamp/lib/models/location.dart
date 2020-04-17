import 'dart:html';

import 'location_fact.dart';

class Location {
  final int id;
  final String name;
  final String imagePath;
  final List<LocationFact> facts;

  Location(this.id, this.name, this.imagePath, this.facts);

  static List<Location> fetchAll() {
    return [
      Location( 1, 'Arashiyms Bamboo Grove', 'images/kiyomizu-dera.jpg', [
        LocationFact('Summary 1', 'blah blah'),
        LocationFact('How to get there', 'blah blah blah')
      ]),
      Location( 2, 'Brashiyms Bamboo Grove', 'images/kiyomizu-dera.jpg', [
        LocationFact('Summary 2', 'blah blah'),
        LocationFact('How to get there', 'blah blah blah')
      ]),
      Location( 3, 'Crashiyms Bamboo Grove', 'images/kiyomizu-dera.jpg', [
        LocationFact('Summary 3', 'blah blah'),
        LocationFact('How to get there', 'blah blah blah')
      ]),
    ];
  }

  static Location fetchByID(int locationID) {

    List<Location> locations = Location.fetchAll();
    for (var i = 0; i < locations.length; i++) {
      if(locations[i].id == locationID) {
        return locations[i];
      }
    }

    return null;
  }

}
import 'package:flutter/material.dart';
import 'models/location.dart';
import 'mocks/mock_location.dart';
import 'package:flutter_crash_course_basic/screens/location_list.dart';

void main() {
  final List<Location> mockLocations = MockLocation.fetchAll();
  return runApp(MaterialApp(
    home: LocationList(mockLocations),
  ));
}
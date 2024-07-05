import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

import '../../helpers/helpers.dart';

Future<List<DocumentSnapshot>> fetchNearbyPosts() async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  double userLat = position.latitude;
  double userLon = position.longitude;

  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('posts').get();
  List<DocumentSnapshot> nearbyPosts = [];

  for (var doc in querySnapshot.docs) {
    GeoPoint postLocation = doc['location'];
    double distance = THelperFunctions.calculateDistance(userLat, userLon, postLocation.latitude, postLocation.longitude);

    if (distance <= 8046.72) { // 5 miles in meters
      nearbyPosts.add(doc);
    }
  }

  return nearbyPosts;
}

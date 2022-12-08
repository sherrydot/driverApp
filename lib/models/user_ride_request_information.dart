import 'package:google_maps_flutter/google_maps_flutter.dart';

// to access data globally
class UserRideRequestInformation {
  LatLng? originLatLng;
  LatLng? destinationLatLng;
  String? originAddress;
  String? destinationAddress;
  String? userName;
  String? userPhone;

  UserRideRequestInformation(
      {this.originLatLng,
      this.destinationLatLng,
      this.originAddress,
      this.destinationAddress,
      this.userName,
      this.userPhone});
}

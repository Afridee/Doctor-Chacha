import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';


part 'mapStateManagement.g.dart';

class mapStateClass = mapState with _$mapStateClass;

abstract class mapState with Store {
  @observable
  StreamSubscription _locationSubscription;

  @observable
  Location _locationTracker = Location();

  @observable
  Marker marker;

  @observable
  Marker doctorLocation;

  @observable
  GoogleMapController _controller;

  @observable
  CameraPosition initialLocation;

  @action
  Future<void> createDoctorMarker(BuildContext context, double Lat, double Lng) async{

    Uint8List imageData = await getMarker(context, "assets/images/doctor_location_2.png");

    doctorLocation = Marker(
        markerId: MarkerId("doctor"),
        position: LatLng(Lat, Lng),
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 1),
        icon: BitmapDescriptor.fromBytes(imageData));
  }

  @action
  void setController(GoogleMapController controller){
    _controller = controller;
  }

  void moveCameraToDoctor(){
    if (_controller != null) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          new CameraPosition(
            //bearing: 192.8334901395799,
            target: LatLng(doctorLocation.position.latitude, doctorLocation.position.longitude),
            tilt: 0,
          ),
        ),
      );
    }
  }

  @action
  void cancelUserLocationSubscription(){
    _locationSubscription.cancel();
  }

  @action
  void setInitialPosition(double Lat, double Lng){
   initialLocation = CameraPosition(
      target: LatLng(Lat, Lng),
      zoom: 14.4746,
    );
  }

  @action
  Future<Uint8List> getMarker(BuildContext context, String icon) async {
    ByteData byteData = await DefaultAssetBundle.of(context)
        .load(icon);
    return byteData.buffer.asUint8List();
  }

  @action
  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);

    marker = Marker(
        markerId: MarkerId("you"),
        position: latlng,
        //rotation: newLocalData.heading,
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 1),
        icon: BitmapDescriptor.fromBytes(imageData));

  }

  @action
  Future<void> getCurrentLocation(BuildContext context) async {
    try {
      Uint8List imageData = await getMarker(context, "assets/images/you_are_here.png");
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      LocationData currentLocation = await _locationTracker.getLocation();

      if (_controller != null) {
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            new CameraPosition(
              //bearing: 192.8334901395799,
              target: LatLng(currentLocation.latitude, currentLocation.longitude),
              tilt: 0,
            ),
          ),
        );
      }


      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription = _locationTracker.onLocationChanged.listen(
            (newLocalData) {
              updateMarkerAndCircle(newLocalData, imageData);
           },
      );
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }
}
















import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../Screens/homeScreens/doctorAppointment/Map/mapStateManagement.dart';

class directionToDoctor extends StatefulWidget {

  final GeoPoint doctorLocation;

  const directionToDoctor({Key key,@required this.doctorLocation}) : super(key: key);

  @override
  _directionToDoctorState createState() => _directionToDoctorState();
}

class _directionToDoctorState extends State<directionToDoctor> {

  mapStateClass MS;

  @override
  void initState() {
    MS = new  mapStateClass();
    MS.setInitialPosition(widget.doctorLocation.latitude, widget.doctorLocation.longitude);
    MS.createDoctorMarker(context, widget.doctorLocation.latitude, widget.doctorLocation.longitude);
    super.initState();
  }

  @override
  void dispose() {
    MS.cancelUserLocationSubscription();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Observer(builder: (context){
          return GoogleMap(
            minMaxZoomPreference: MinMaxZoomPreference(10, 18),
            mapType: MapType.normal,
            initialCameraPosition: MS.initialLocation,
            markers: Set.of((MS.marker != null) ? [MS.marker,MS.doctorLocation] : (MS.doctorLocation!=null ? [MS.doctorLocation] : []),),
            onMapCreated: (GoogleMapController controller) {
              MS.setController(controller);
            },
          );
        }),
      ),
      floatingActionButton: Observer(builder: (context){
        return SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          visible: true,
          curve: Curves.bounceIn,
          children: [
            SpeedDialChild(
              child: Icon(Icons.accessibility, color: Colors.white),
              backgroundColor: primaryDark,
              onTap: () {
                MS.getCurrentLocation(context);
              },
              label: 'Your location',
              labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: primaryLight,
            ),
            SpeedDialChild(
              child: Icon(Icons.local_hospital, color: Colors.white),
              backgroundColor: primaryDark,
              label: 'Doctor\'s Location',
              onTap: (){
                MS.cancelUserLocationSubscription();
                MS.moveCameraToDoctor();
              },
              labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: primaryLight,
            ),
          ],
        );
      }),
    );
  }
}

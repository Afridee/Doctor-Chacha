// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapStateManagement.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$mapStateClass on mapState, Store {
  final _$_locationSubscriptionAtom =
      Atom(name: 'mapState._locationSubscription');

  @override
  StreamSubscription<dynamic> get _locationSubscription {
    _$_locationSubscriptionAtom.reportRead();
    return super._locationSubscription;
  }

  @override
  set _locationSubscription(StreamSubscription<dynamic> value) {
    _$_locationSubscriptionAtom.reportWrite(value, super._locationSubscription,
        () {
      super._locationSubscription = value;
    });
  }

  final _$_locationTrackerAtom = Atom(name: 'mapState._locationTracker');

  @override
  Location get _locationTracker {
    _$_locationTrackerAtom.reportRead();
    return super._locationTracker;
  }

  @override
  set _locationTracker(Location value) {
    _$_locationTrackerAtom.reportWrite(value, super._locationTracker, () {
      super._locationTracker = value;
    });
  }

  final _$markerAtom = Atom(name: 'mapState.marker');

  @override
  Marker get marker {
    _$markerAtom.reportRead();
    return super.marker;
  }

  @override
  set marker(Marker value) {
    _$markerAtom.reportWrite(value, super.marker, () {
      super.marker = value;
    });
  }

  final _$doctorLocationAtom = Atom(name: 'mapState.doctorLocation');

  @override
  Marker get doctorLocation {
    _$doctorLocationAtom.reportRead();
    return super.doctorLocation;
  }

  @override
  set doctorLocation(Marker value) {
    _$doctorLocationAtom.reportWrite(value, super.doctorLocation, () {
      super.doctorLocation = value;
    });
  }

  final _$_controllerAtom = Atom(name: 'mapState._controller');

  @override
  GoogleMapController get _controller {
    _$_controllerAtom.reportRead();
    return super._controller;
  }

  @override
  set _controller(GoogleMapController value) {
    _$_controllerAtom.reportWrite(value, super._controller, () {
      super._controller = value;
    });
  }

  final _$initialLocationAtom = Atom(name: 'mapState.initialLocation');

  @override
  CameraPosition get initialLocation {
    _$initialLocationAtom.reportRead();
    return super.initialLocation;
  }

  @override
  set initialLocation(CameraPosition value) {
    _$initialLocationAtom.reportWrite(value, super.initialLocation, () {
      super.initialLocation = value;
    });
  }

  final _$createDoctorMarkerAsyncAction =
      AsyncAction('mapState.createDoctorMarker');

  @override
  Future<void> createDoctorMarker(
      BuildContext context, double Lat, double Lng) {
    return _$createDoctorMarkerAsyncAction
        .run(() => super.createDoctorMarker(context, Lat, Lng));
  }

  final _$getMarkerAsyncAction = AsyncAction('mapState.getMarker');

  @override
  Future<Uint8List> getMarker(BuildContext context, String icon) {
    return _$getMarkerAsyncAction.run(() => super.getMarker(context, icon));
  }

  final _$getCurrentLocationAsyncAction =
      AsyncAction('mapState.getCurrentLocation');

  @override
  Future<void> getCurrentLocation(BuildContext context) {
    return _$getCurrentLocationAsyncAction
        .run(() => super.getCurrentLocation(context));
  }

  final _$mapStateActionController = ActionController(name: 'mapState');

  @override
  void setController(GoogleMapController controller) {
    final _$actionInfo =
        _$mapStateActionController.startAction(name: 'mapState.setController');
    try {
      return super.setController(controller);
    } finally {
      _$mapStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancelUserLocationSubscription() {
    final _$actionInfo = _$mapStateActionController.startAction(
        name: 'mapState.cancelUserLocationSubscription');
    try {
      return super.cancelUserLocationSubscription();
    } finally {
      _$mapStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInitialPosition(double Lat, double Lng) {
    final _$actionInfo = _$mapStateActionController.startAction(
        name: 'mapState.setInitialPosition');
    try {
      return super.setInitialPosition(Lat, Lng);
    } finally {
      _$mapStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    final _$actionInfo = _$mapStateActionController.startAction(
        name: 'mapState.updateMarkerAndCircle');
    try {
      return super.updateMarkerAndCircle(newLocalData, imageData);
    } finally {
      _$mapStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
marker: ${marker},
doctorLocation: ${doctorLocation},
initialLocation: ${initialLocation}
    ''';
  }
}

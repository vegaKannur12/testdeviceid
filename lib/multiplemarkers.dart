import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:math';

class MapGoogle extends StatefulWidget {
  @override
  _MapGoogleState createState() => _MapGoogleState();
}

class _MapGoogleState extends State<MapGoogle> {
  //late GoogleMapController mapController;
  //List<Marker> markers =[];
  GoogleMapController? _controller;
  Location currentLocation = Location();
  // Set<Marker> _markers = {};
  List<Marker> _markers = [];
  //////////////////////////////////////
  // addMarker(cordinate) {
  //   int id = Random().nextInt(100);
  //   setState(() {
  //     _markers
  //         .add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
  //   });
  // }

  /////////////////////////////////////////////////////////////////
  multipleMarkerInitialize() {
    
    Marker frstMarker = Marker(
      markerId: MarkerId('first'),
      position: LatLng(10.0889, 77.0595),
      infoWindow: InfoWindow(title: 'first marker'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    Marker scndMarker = Marker(
      markerId: MarkerId('second'),
      position: LatLng(11.90234567, 75.3655176),
      infoWindow: InfoWindow(title: 'second marker'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    Marker thrdMarker = Marker(
      markerId: MarkerId('third'),
      position: LatLng(11.50084193, 75.6654176),
      infoWindow: InfoWindow(title: 'third marker'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    
      _markers.add(frstMarker);
      _markers.add(scndMarker);
      _markers.add(thrdMarker);
      setState(() {
    });
  }

  ////////////////////////////////////////////////////////////////
  final LatLng _center = const LatLng(10.0889, 77.0595);
  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  //////////////////////////fetch current location//////////////////////////////
  void getLocation() async {
    var location = await currentLocation.getLocation();

    // print("location----${location.latitude},${location.longitude}");
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _controller
          ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
          ),
        );
      });
    });
  }

  ///////////////////////////////////////////////////
  ///
  @override
  void initState() {
    super.initState();
    multipleMarkerInitialize();

    setState(() {
      getLocation();
    });
  }
  ////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        mapToolbarEnabled: true,
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: _markers.map((e) => e).toSet(),
        // onTap: (cordinate) {
        //   _controller!.animateCamera(CameraUpdate.newLatLng(cordinate));
        //   // addMarker(cordinate);
        // },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller!.animateCamera(CameraUpdate.zoomOut());
        },
        child: Icon(Icons.zoom_out),
      ),
    );
  }
}
/////////////////////////////////////////////////
 
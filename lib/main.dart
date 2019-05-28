import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new MapPage(),
));

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Marker> allMarkers = [];

  GoogleMapController _controller;


  @override
  void initState() {
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId("myMarker"),
        draggable: true,
        onTap: (){
          print('marker tapped');
        },
        position: LatLng(-3.98436, -38.6161)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Maps jr"),

      ),
      body: Stack(
        children: [Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition:
            CameraPosition(target: LatLng(-3.98436, -38.6161), zoom:12.0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,

          ),
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: movetoBosto,
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(20.0),
                  color: Colors.green
                ),
                child: Icon(Icons.forward, color: Colors.white),
              ),
            ),
          ),
        Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: movetoMaracanau,
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(20.0),
                  color: Colors.red
              ),
              child: Icon(Icons.backspace, color: Colors.white),
            ),
          ),
        )
        ]
      ),
    );
  }

  void mapCreated(controller){
    setState(() {
      _controller = controller;
    });
  }

  movetoBosto(){
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(-3.71839, -38.5434), zoom:12.0, bearing: 45.0, tilt: 45.0),
    ));
  }

  movetoMaracanau(){
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(-3.98436, -38.6161), zoom:12.0),
    ));
  }
}

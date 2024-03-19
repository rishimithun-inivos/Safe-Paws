import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:safe_paws/viewmodel/vet_location_view_model.dart';

class VetLocationView extends StatefulWidget {
  VetLocationView({super.key});

  @override
  State<VetLocationView> createState() => VetLocationViewState();
}

class VetLocationViewState extends State<VetLocationView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return ViewModelBuilder<VetLocationViewModel>.reactive(
        viewModelBuilder: () => VetLocationViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(39, 130, 142, 1.0),
              elevation: 5,
              shadowColor: Colors.grey,
              //centerTitle: true,
              title: Center(
                child: Text(
                  "Doctors nearby you",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body: Stack(
              children: [
                viewModel.current_Location == null ?
                    Center(
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(
                                value: null,
                                strokeWidth: 4.0,
                                color: Color.fromRGBO(39, 130, 142, 1.0),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Loading...',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ):
                            GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                              viewModel.current_Location!.latitude!,
                              viewModel.current_Location!.longitude!
                            ),
                          zoom: 16.0,
                          ),
                          markers: {...viewModel.locationMarkers,
                        Marker(
                        markerId: MarkerId("Vet Locations"),
                        position: LatLng(
                          viewModel.current_Location!.latitude!,
                          viewModel.current_Location!.longitude!
                        ),
                        ),
                      },
                        polylines: {
                          Polyline(
                            polylineId: PolylineId('polyline'),
                            points: viewModel.polylinesPoints,
                            color: Colors.blue.shade600,
                            width: 6,
                          )
                        },
                        mapType: MapType.normal,
                      )
                  ],
          ),
          );
    }
    );
  }
}

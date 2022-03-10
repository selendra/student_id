import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_id/main.dart';

List<CameraDescription> cameras = [];

class CameraApp extends StatefulWidget {

  final int? index;

  CameraApp({this.index});

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int index = 0;

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  initCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      cameras[0],
      // Define the resolution to use.
      ResolutionPreset.max,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
    setState(() {
      
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        print("snapshot.connectionState ${snapshot.connectionState}");
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return Stack(
            children: [
              CameraPreview(_controller),
              Positioned(
                left: (MediaQuery.of(context).size.width/2) - 100 ,
                bottom: paddingSize,
                child: Container(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        // Provide an onPressed callback.
                        onPressed: () async {
                          // Take the Picture in a try / catch block. If anything goes wrong,
                          // catch the error.
                          try {
                            // Ensure that the camera is initialized.
                            await _initializeControllerFuture;

                            // Attempt to take a picture and get the file `image`
                            // where it was saved.
                            final image = await _controller.takePicture();

                            // If the picture was taken, display it on a new screen.
                            Navigator.pop(context, image.path);
                          } catch (e) {
                            // If an error occurs, log the error to the console.
                            print(e);
                          }
                        },
                        child: Icon(Icons.camera_alt),
                      ),

                      SizedBox(width: 20,),
                      ElevatedButton(
                        // Provide an onPressed callback.
                        onPressed: () async {
                          try {
                            index = index == 0 ? 1 : 0;
                            _controller = CameraController(
                              // Get a specific camera from the list of available cameras.
                              cameras[index],
                              // Define the resolution to use.
                              ResolutionPreset.max,
                            );

                            // If the picture was taken, display it on a new screen.
                            // Navigator.pop(context, image.path);
                            /// Reinit camera.
                            _initializeControllerFuture = _controller.initialize();
                            setState(() {
                              
                            });
                          } catch (e) {
                            // If an error occurs, log the error to the console.
                            print(e);
                          }
                        },
                        child: Icon(Icons.cameraswitch),
                      )
                    ],
                  )
                ),
              )
            ]
          );
        } else {
          // Otherwise, display a loading indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

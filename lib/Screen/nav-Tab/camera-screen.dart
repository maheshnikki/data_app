import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

late final List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameravalue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameravalue = _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          FutureBuilder(
              future: cameravalue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      print('flash pressed');
                    },
                    icon: Icon(
                      Icons.flash_off,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('pressed');
                    },
                    child: Icon(
                      Icons.panorama_fish_eye_rounded,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print('flip_camera pressed');
                    },
                    icon: Icon(
                      Icons.flip_camera_ios_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
            //  Center(
            //   child: Text(
            //     'Hold for video, tap for photo',
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
        ],
      ),
    );
  }
}

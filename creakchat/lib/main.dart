import 'package:camera/camera.dart';
import 'package:creakchat/Screens/CameraScreen.dart';
import 'package:creakchat/Screens/Homescreen.dart';
import 'package:creakchat/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "Quick",
            primaryColor: Colors.black,
            accentColor: Colors.deepOrange),
        home: LoginScreen());
  }
}

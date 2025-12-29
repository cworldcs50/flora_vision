import 'package:get/get.dart';
import 'package:camera/camera.dart';
import '../classes/classifier.dart';
import '../../firebase_options.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  late final List<String> labels;
  late final List<CameraDescription> cameras;
  late final SharedPreferences appSharedPrefs;

  Future<AppServices> init() async {
    appSharedPrefs = await SharedPreferences.getInstance();

    final String labelFile = await rootBundle.loadString(
      "assets/model/labels.txt",
    );

    labels = labelFile.split('\n').map((e) => e.trim()).toList();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    cameras = await availableCameras();
    await Classifier().loadModel("assets/model/flora_vision_model.tflite");

    return this;
  }
}

Future<void> initServices() async {
  await Get.putAsync(() => AppServices().init());
}

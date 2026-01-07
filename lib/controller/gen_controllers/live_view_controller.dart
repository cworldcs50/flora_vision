import 'dart:developer';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import '../../core/classes/classifier.dart';
import '../../core/services/app_service.dart';

class LiveViewController extends GetxController {
  RxString label = "".obs;
  bool _isDetecting = false;
  RxDouble confidence = 0.0.obs;
  final Rx<CameraController> cameraController =
      CameraController(
        Get.find<AppServices>().cameras[0],
        ResolutionPreset.ultraHigh,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      ).obs;

  final List<String> labels = Get.find<AppServices>().labels;

  @override
  Future<void> onInit() async {
    super.onInit();
    await initCamera();
  }

  Future<void> initCamera() async {
    await cameraController.value.initialize();
    await cameraController.value.startImageStream(
      (CameraImage frame) async => await runLiveModel(frame),
    );
  }

  Future<void> runLiveModel(CameraImage cameraImage) async {
    if (_isDetecting) return;
    _isDetecting = true;

    try {
      final rgbImage = Classifier().convertYUV420ToImage(cameraImage);

      final resized = Classifier().resizeImage(rgbImage);

      final input = Classifier().imageToByteList(resized);

      final output = List.generate(1, (_) => List.filled(labels.length, 0.0));

      await Classifier().modelIsolateInterpreter.run(input, output);

      final scores = output[0];
      final maxScore = scores.reduce((a, b) => a > b ? a : b);
      final maxIndex = scores.indexOf(maxScore);

      label.value = labels[maxIndex];
      confidence.value = maxScore;
    } catch (e) {
      log("Live error: $e");
    }

    await Future.delayed(
      const Duration(seconds: 1),
      () => _isDetecting = false,
    );
  }



}

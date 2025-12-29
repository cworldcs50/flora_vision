import 'dart:io';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import '../../core/classes/classifier.dart';
import '../../core/services/app_service.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/network/request_status.dart';
import '../../core/constants/app_routes_name.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import '../../core/functions/cache_if_user_auth.dart';
import '../../data/datasource/remote/auth/logout.dart';
import '../../core/classes/base_request_controller.dart';

class GenController extends BaseRequestController {
  File? selectedImage;
  RxString title = "".obs;
  RxString label = "".obs;
  RxDouble confidence = 0.0.obs;
  late final IsolateInterpreter interpreter;
  final ImagePicker _picker = ImagePicker();
  final List<String> labels = Get.find<AppServices>().labels;

  @override
  void onInit() async {
    await loadModel();
    super.onInit();
  }

  Future<void> loadModel() async {
    interpreter = Classifier().modelIsolateInterpreter;
    log("MODEL LOADED SUCCESSFULLY");
  }

  Future<void> pickFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
      );

      if (image != null) {
        selectedImage = File(image.path);
        await diagnoseImage();
      }
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: "Failed to open camera. Try again.",
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (image != null) {
      selectedImage = File(image.path);
      await diagnoseImage();
    }
  }

  Future<void> diagnoseImage() async {
    if (selectedImage == null) return;

    img.Image image = Classifier().processImage(selectedImage!);
    final input = Classifier().imageToByteList(image);

    final output = List.generate(1, (_) => List.filled(labels.length, 0.0));

    await Classifier().modelIsolateInterpreter.run(input, output);
    log("output after prediction: $output");
    final scores = output[0];
    final maxScore = scores.reduce((a, b) => a > b ? a : b);
    final maxIndex = scores.indexOf(maxScore);

    if (maxScore == 0) {
      label.value = "unknown disease";
    } else {
      label.value = labels[maxIndex];
      confidence.value = maxScore;
    }
    title.value = "Disease";

    log("Prediction: ${label.value}  | Confidence: $maxScore");

    Get.back();
  }

  Future<void> liveVideo() async => await Get.toNamed(AppRoutesName.rLiveView);

  Future<void> logout() async {
    if (!await checkOnline()) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: "You are offline!",
          backgroundColor: Colors.red,
        ),
      );
    }

    setStatus(RequestStatus.loading);

    final result = await Logout()();

    result.fold(
      (error) {
        setStatus(RequestStatus.failure);

        Get.showSnackbar(
          GetSnackBar(
            title: error.title,
            message: error.message,
            backgroundColor: Colors.red,
          ),
        );
      },
      (_) async {
        setStatus(RequestStatus.success);
        await cacheIfUserAuth(false);
        await Get.offAllNamed(AppRoutesName.rSignUp);
      },
    );
  }
}

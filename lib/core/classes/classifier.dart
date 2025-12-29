import 'dart:io';
import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  Classifier._();
  factory Classifier() => _instance;
  static final Classifier _instance = Classifier._();

  late Interpreter modelInterpreter;
  late IsolateInterpreter modelIsolateInterpreter;

  Future<void> loadModel(String modelPath) async {
    try {
      modelInterpreter = await Interpreter.fromAsset(modelPath);

      modelIsolateInterpreter = await IsolateInterpreter.create(
        address: modelInterpreter.address,
      );

      log("Model loaded in Isolate!");
    } catch (e) {
      log(e.toString());
    }
  }

  img.Image convertYUV420ToImage(CameraImage cameraImage) {
    final width = cameraImage.width;
    final height = cameraImage.height;

    final imgImage = img.Image(width: width, height: height);

    final planeY = cameraImage.planes[0];
    final planeU = cameraImage.planes[1];
    final planeV = cameraImage.planes[2];

    final int strideY = planeY.bytesPerRow;
    final int strideU = planeU.bytesPerRow;
    final int strideV = planeV.bytesPerRow;

    final int pixelStrideU = planeU.bytesPerPixel!;
    final int pixelStrideV = planeV.bytesPerPixel!;

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        // Y plane
        final int yp = planeY.bytes[y * strideY + x] & 0xFF;

        // U & V planes
        final int uvIndexU = (y ~/ 2) * strideU + (x ~/ 2) * pixelStrideU;
        final int uvIndexV = (y ~/ 2) * strideV + (x ~/ 2) * pixelStrideV;

        final int up = planeU.bytes[uvIndexU] & 0xFF;
        final int vp = planeV.bytes[uvIndexV] & 0xFF;

        final u = up - 128;
        final v = vp - 128;

        double r = (yp + 1.370705 * v);
        double g = (yp - 0.337633 * u - 0.698001 * v);
        double b = (yp + 1.732446 * u);

        imgImage.setPixelRgb(x, y, r, g, b);
      }
    }

    return imgImage;
  }

  img.Image resizeImage(img.Image image) {
    final resized = img.copyResize(image, width: 128, height: 128);
    return resized;
  }

  img.Image processImage(File imageFile) {
    final bytes = imageFile.readAsBytesSync();
    img.Image? image = img.decodeImage(bytes);
    image = resizeImage(image!);

    return image;
  }

  List<List<List<List<double>>>> imageToByteList(img.Image image) {
    const int inputSize = 128;
    List<List<List<List<double>>>> convertedBytes =
        List<List<List<List<double>>>>.generate(
          1,
          (i) => List<List<List<double>>>.generate(
            inputSize,
            (j) =>
                List<List<double>>.generate(inputSize, (k) => [0.0, 0.0, 0.0]),
          ),
        );

    for (int x = 0; x < inputSize; x++) {
      for (int y = 0; y < inputSize; y++) {
        var pixel = image.getPixelSafe(x, y);
        convertedBytes[0][x][y][0] = pixel.r.toDouble();
        convertedBytes[0][x][y][1] = pixel.g.toDouble();
        convertedBytes[0][x][y][2] = pixel.b.toDouble();
      }
    }

    return convertedBytes;
  }
}

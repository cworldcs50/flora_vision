import 'flora_vision.dart';
import 'package:flutter/material.dart';
import 'core/services/app_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const FloraVision());
}

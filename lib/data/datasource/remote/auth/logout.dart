import 'package:dartz/dartz.dart';
import '../../../../core/network/error_model.dart';
import '../../../../core/services/firebase_service.dart';

class Logout {
  Future<Either<ErrorModel, void>> call() async =>
      await FirebaseService().logout();
}

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/network/error_model.dart';
import '../../../../core/services/firebase_service.dart';

class SignUpWithEmailAndPassword {
  Future<Either<ErrorModel, UserCredential>> call({
    required String email,
    required String password,
  }) async {
    final result = await FirebaseService().signUpWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result;
  }
}

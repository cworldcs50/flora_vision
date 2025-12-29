import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/network/error_model.dart';
import '../../../../core/services/firebase_service.dart';

class SignInWithEmailAndPassword {
  Future<Either<ErrorModel, UserCredential>> call({
    required String email,
    required String password,
  }) async {
    final result = await FirebaseService().signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result;
  }
}

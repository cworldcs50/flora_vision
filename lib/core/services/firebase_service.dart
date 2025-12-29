import 'package:dartz/dartz.dart';
import '../network/error_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  const FirebaseService._();
  factory FirebaseService() => _instance;

  static const _instance = FirebaseService._();

  FirebaseAuth get instance => FirebaseAuth.instance;

  Future<Either<ErrorModel, UserCredential>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return Right(
        await instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Left(
          ErrorModel(
            title: 'weak-password',
            message: 'The password provided is too weak.',
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        return const Left(
          ErrorModel(
            title: 'email-already-in-use',
            message: 'The account already exists for that email.',
          ),
        );
      } else {
        return const Left(
          ErrorModel(title: 'Error!', message: "Error In Email or Password!"),
        );
      }
    } catch (_) {
      return const Left(
        ErrorModel(title: 'Error!', message: "Error In Email or Password!"),
      );
    }
  }

  Future<Either<ErrorModel, UserCredential>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return Right(
        await instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left(
          ErrorModel(
            title: 'user-not-found',
            message: 'No user found for that email.',
          ),
        );
      } else if (e.code == 'wrong-password') {
        return const Left(
          ErrorModel(
            title: 'wrong-password',
            message: 'Wrong password provided for that user.',
          ),
        );
      } else {
        return const Left(
          ErrorModel(title: 'Error!', message: "Error In Email or Password!"),
        );
      }
    } catch (_) {
      return const Left(
        ErrorModel(title: 'Error!', message: "Error In Email or Password!"),
      );
    }
  }

  Future<Either<ErrorModel, void>> logout() async {
    try {
      return Right(await instance.signOut());
    } on FirebaseAuthException catch (e) {
      return Left(ErrorModel(title: e.code, message: e.message ?? ""));
    } catch (e) {
      return const Left(
        ErrorModel(title: 'Error!', message: "Error in logout!"),
      );
    }
  }
}

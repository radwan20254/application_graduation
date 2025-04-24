import 'package:dartz/dartz.dart';
import 'package:diagnosify_app/core/errors/failuers.dart';

abstract class AuthRepo {
  Future<Either<Failures, Map<String, dynamic>>> signUp({
    required String fullname,
    required String email,
    required String password,
    required String dateofbirth,
  });
  Future<Either<Failures, Map<String, dynamic>>> logIn({
    required String email,
    required String password,
  });
}

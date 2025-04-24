import 'package:dartz/dartz.dart';
import 'package:diagnosify_app/core/API/api_service.dart';
import 'package:diagnosify_app/core/API/backend_endpoint.dart';
import 'package:diagnosify_app/core/errors/failuers.dart';
import 'package:diagnosify_app/features/auth/data/repo/auth_repo.dart';
import 'package:dio/dio.dart';

class AuthRepoImplementation implements AuthRepo {
  final ApiService apiService;

  AuthRepoImplementation({required this.apiService});
  @override
  @override
  Future<Either<Failures, Map<String, dynamic>>> signUp({
    required String fullname,
    required String email,
    required String password,
    required String dateofbirth,
  }) async {
    try {
      var response = await apiService.Post(
        endpoint: BackendEndpoint.endpointregiseter,
        data: {},
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(
            {"message": "Connection timeout with ApiServer", "errors": {}}));
      }
    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> logIn(
      {required String email, required String password}) async {
    try {
      return right({});
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(
            {"message": "Connection timeout with ApiServer", "errors": {}}));
      }
    }
  }
}

import 'package:dio/dio.dart';
import 'package:network/src/client/dio/remote_client.dart';
import 'package:network/src/exception/exceptions.dart';

class DioRemoteClient implements RemoteClient {
  DioRemoteClient(this._dio);

  final Dio _dio;

  @override
  Future<Response> getApiCall(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioError catch (e) {
      throw ServerFailureException(
        e.message,
        code: e.response?.statusCode,
      );
    } catch (_, s) {
      throw UnknownServerFailureException(s);
    }
  }

  @override
  Future<Response> postApiCall(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioError catch (e) {
      throw ServerFailureException(
        e.message,
        code: e.response?.statusCode,
      );
    } catch (_, s) {
      throw UnknownServerFailureException(s);
    }
  }
}

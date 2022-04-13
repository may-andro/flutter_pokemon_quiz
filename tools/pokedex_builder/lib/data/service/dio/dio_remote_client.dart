import 'package:dio/dio.dart';
import 'package:pokedex_builder/data/service/remote_client.dart';
import 'package:pokedex_builder/exceptions/exceptions.dart';

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
        responseStatusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw UnknownServerFailureException();
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
        responseStatusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw UnknownServerFailureException();
    }
  }
}

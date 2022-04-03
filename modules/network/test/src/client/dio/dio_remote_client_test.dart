import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/src/client/dio/dio_remote_client.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:network/src/client/dio/remote_client.dart';
import 'package:network/src/exception/exceptions.dart';

const _baseUrl = 'https://example.com';

void main() {
  group(DioRemoteClient, () {
    late Dio dio;
    late DioAdapter dioAdapter;

    late RemoteClient remoteClient;

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: _baseUrl));
      dioAdapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = dioAdapter;

      remoteClient = DioRemoteClient(dio);
    });

    group('getApiCall', () {
      test('should return response when the dio status code is 20x', () async {
        const path = '/pokemon';
        const response = {'message': 'Success'};
        dioAdapter.onGet(
          path,
          (request) => request.reply(200, response),
          queryParameters: {},
          headers: {},
        );

        final result = await remoteClient.getApiCall(path);

        expect(result.data, response);
      });

      test(
          'should return $ServerFailureException'
          ' when the dio status code is not 20x', () async {
        const path = '/pokemon';
        const response = {'message': 'error'};
        dioAdapter.onGet(
          path,
          (request) => request.reply(400, response),
          queryParameters: {},
          headers: {},
        );

        expect(remoteClient.getApiCall(path),
            throwsA(isA<ServerFailureException>()));
      });
    });

    group('postApiCall', () {
      test('should return response when the dio status code is 20x', () async {
        const path = '/pokemon';
        const response = {'message': 'Success Post'};
        const data = {'data': 'sample data'};
        dioAdapter.onPost(
          path,
          (request) => request.reply(201, response),
          data: json.encode(data),
        );

        final result = await remoteClient.postApiCall(
          path,
          data: json.encode(data),
        );

        expect(result.data, response);
      });

      test(
          'should return $ServerFailureException'
          ' when the dio status code is not 20x', () async {
        const path = '/pokemon';
        const response = {'message': 'Error Post'};
        const data = {'data': 'sample data'};
        dioAdapter.onPost(
          path,
          (request) => request.reply(400, response),
          data: json.encode(data),
        );

        expect(
          remoteClient.postApiCall(
            path,
            data: json.encode(data),
          ),
          throwsA(isA<ServerFailureException>()),
        );
      });
    });
  });
}

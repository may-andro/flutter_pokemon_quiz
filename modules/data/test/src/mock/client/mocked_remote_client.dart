import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';
import 'package:dio/dio.dart';

class MockedRequestOptions extends Mock implements RequestOptions {}

class MockedRemoteClient extends Mock implements RemoteClient {
  void mockGetApiCall<T>(Response<T> expected) {
    when(() => getApiCall(any())).thenAnswer((_) => Future.value(expected));
  }

  void mockGetApiCallThrowsException<T>() {
    when(() => getApiCall(any())).thenThrow(Exception());
  }
}

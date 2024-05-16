import 'package:flutter_test/flutter_test.dart';
import 'package:foodapp/src/Base/ApiService/api_service.dart';

import 'Mocks/test_api_mocks.dart';

abstract class _Constants {
  static Map<String, String> defaultHeaders = {
    'Content-type': 'application/json; charset=UTF-8'
  };

  static String postEndpoint = 'https://jsonplaceholder.typicode.com/posts';
  static String gedEndpoint = 'https://jsonplaceholder.typicode.com/posts/1';
  static String putEndpoint = 'https://jsonplaceholder.typicode.com/posts/1';
}

void main() {
  //ESTA ES LA QUE VAMOS A TESTEAR
  final ApiService testApiService = DefaultApiService();

  //'Test correct Conecction of Api Service'
  group('Test correct Conecction of Api Service', () {
    //'Test correct post connection to jsonplaceholder' WEB
    test('Test correct post connection to jsonplaceholder', () async {
      final bodyParams =
          CorrectPostExpectation(title: 'foo', body: 'bar', userId: 1);

      final result = await testApiService.getDataFromPostRequest(
          bodyparameters: bodyParams.toMap(),
          url: _Constants.postEndpoint,
          headers: _Constants.defaultHeaders);

      expect(result, Map.from(result));
    });

    test('Test correct post connection to json placeholder', () async {
      final result = await testApiService.getDataFromGetRequest(
          url: _Constants.gedEndpoint);

      expect(result, Map.from(result));
    });

    test('Test correct post connection to jsonplaceholder', () async {
      final body = CorrectPutBodyParams(
        id: 1,
        title: 'foo',
        body: 'bar',
        userId: 1,
      );

      final result = await testApiService.getDataFromPutRequest(
          bodyparameters: body.toMap(),
          url: _Constants.putEndpoint,
          headers: _Constants.defaultHeaders);

      expect(result, Map.from(result));
    });
  });
}

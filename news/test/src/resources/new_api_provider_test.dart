import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';



void main() {
  test('Fetch Top Ids returns a lost of IDs',() {
  //setup test case 
  final newsApi = NewsApiProvider();
  //expectation 
  newsAPi.client = MockClient((request) async {
    return Response(json.encode([1,2,3,4]),200);


  });


  final ids = await newsApi.fetchTopIds();

  expect(ids, [1,2,3,3]);
    });
}
import 'dart:convert';
import 'package:http/http.dart'show Client;


class NewsApiProvider{
Client client = Client(); 

  fetchTopIds() async {
  final response = await client.get('https://hacker-news.firebaseio.com/v0/maxitem.json?print=pretty');
  final ids = json.decode(response.body);
  return ids;
  }

  fetchItem() {

  }
}
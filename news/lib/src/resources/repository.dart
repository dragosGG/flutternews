import "../resources/news_api_provider.dart";
import "dart:async";
import "../resources/news_db_provider.dart";
import '../models/item_model.dart';

class Respository {
List<Source> sources = <Source> [
  NewsDbProvider(),
  NewsApiProvider(),
];

List<Cache> caches = <Cache>[NewsDbProvider(),];
Future<List<int>>fetchTopIds() {
  return apiProvider.fetchTopIds();
}
Future<ItemModel>fetchItem(int id) async {
  var item  = await dbProvider.fetchItem(id);
  if (item != null) {
    return item; 
  }
  item  = await apiProvider.fetchItem(id);
  await dbProvider.addItem(item);
  
  return item; 
}
}

abstract class Source {
Future<List<int>> fetchTopIds();
 Future<ItemModel>fetchItem(int id);

}

abstract class Cache {
  Future<int> addItem(ItemModel item){}

}
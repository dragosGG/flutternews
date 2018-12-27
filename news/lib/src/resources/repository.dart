import "../resources/news_api_provider.dart";
import "dart:async";
import "../resources/news_db_provider.dart";
import '../models/item_model.dart';

class Respository {
List<Source> sources = <Source> [
  newsDbProvider,
  NewsApiProvider(),
];
// to do integrate over sources when db provider gets FetchTopIds Implemented

List<Cache> caches = <Cache>[newsDbProvider,];
Future<List<int>>fetchTopIds() {
  return sources[1].fetchTopIds();
}
Future<ItemModel>fetchItem(int id) async {
  ItemModel item;
  Source source;

  for(source in sources) {
    item  = await source.fetchItem(id);
    if (item != null) {
      break;
    }
  }

  for (var cache in caches) {
    cache.addItem(item);
  }



}
}

abstract class Source {
Future<List<int>> fetchTopIds();
 Future<ItemModel>fetchItem(int id);

}

abstract class Cache {
  Future<int> addItem(ItemModel item){}

}
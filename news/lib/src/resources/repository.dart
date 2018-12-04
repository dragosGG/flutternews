import "../resources/news_api_provider.dart";
import "dart:async";
import "../resources/news_db_provider.dart";
import '../models/item_model.dart';

class Respository {
  NewsDbProvider dbProvider = NewsDbProvider();
  NewsApiProvider apiProvider = NewsApiProvider();


Future<List<int>>fetchTopIds() {
  return NewsApiProvider.fetchTopIds();
}
Future<ItemModel>fetchItem(int id) async {
  var item  = await dbProvider.fetchItem(id);
  if (item != null) {
    return item 
  }
  item  = await apiProvider.fetchItem(id);
  await dbProvider.addItem(item);
  
  return item; 
}
}
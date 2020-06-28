import 'package:flutter/material.dart';
import 'package:newsprovider/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '557e8fb35d1b474c97b5fd8ac68bb862';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    print('Cargando headlines...');
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

}
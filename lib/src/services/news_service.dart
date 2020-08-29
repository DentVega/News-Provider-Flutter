import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsprovider/src/models/category_model.dart';
import 'package:newsprovider/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '557e8fb35d1b474c97b5fd8ac68bb862';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];
  
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

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
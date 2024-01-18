import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_quotient/model/articles_model.dart';

class ApiService {
  String? country;
  final indiaURL =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=29d241151d0d4bb58d39a152ca1b4705";
  final usURL =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=29d241151d0d4bb58d39a152ca1b4705";
  final ukURL =
      "https://newsapi.org/v2/top-headlines?country=gb&apiKey=29d241151d0d4bb58d39a152ca1b4705";
  final canadaURL =
      "https://newsapi.org/v2/top-headlines?country=ca&apiKey=29d241151d0d4bb58d39a152ca1b4705";

  Future<List<Article>> getArticle(int selectedIndex) async {
    if (selectedIndex == 0) {
      country = indiaURL;
    } else if (selectedIndex == 1) {
      country = usURL;
    } else if (selectedIndex == 2) {
      country = ukURL;
    } else {
      country = canadaURL;
    }
    Response response = await get(Uri.parse(country!));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Cant get the Articles");
    }
  }
}

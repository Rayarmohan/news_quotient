import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_quotient/model/articles_model.dart';

class ApiService{

  final endpointURL = "https://newsapi.org/v2/top-headlines?country=in&apiKey=29d241151d0d4bb58d39a152ca1b4705";

  Future<List<Article>> getArticle() async{
    Response response = await get(Uri.parse(endpointURL));

    if(response.statusCode == 200){

      Map<String,dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;

    }else{
      throw ("Cant get the Articles");
    }

  }

}
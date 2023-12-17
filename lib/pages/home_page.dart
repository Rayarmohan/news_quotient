import 'package:flutter/material.dart';
import 'package:news_quotient/pages/details_page.dart';

import '../model/articles_model.dart';
import '../services/api_service.dart';
import '../widgets/custom_tile.dart';

class HomePage extends StatelessWidget {

   HomePage({super.key});

  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) =>
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DetailsPage(article: articles[index])));
                  },
                  child: CustomTile(article: articles[index],
                  ),
                ),
            itemCount: articles!.length,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

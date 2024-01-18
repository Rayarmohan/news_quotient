import 'package:flutter/material.dart';
import 'package:news_quotient/pages/details_page.dart';
import 'package:news_quotient/widgets/category_list_item.dart';

import '../model/articles_model.dart';
import '../services/api_service.dart';
import '../widgets/custom_tile.dart';

class HomePage extends StatefulWidget {

  const  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List category = ['India', 'USA', 'UK','Canada'];

  int selectedIndex = 0;

  final ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.getArticle(selectedIndex),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return Column(
            children: [
              SizedBox(
            height: 60,
            //categorylist
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: CategoryItemContainer(
                  itemname: category[index],
                  currentindex: index,
                  selectedIndex: selectedIndex,
                ),
              ),
              itemCount: category.length,
            ),
          ),
          //newslist
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DetailsPage(article: articles[index])));
                        },
                        child: CustomTile(article: articles[index],
                        ),
                      ),
                  itemCount: articles!.length,
                ),
              ),
            ],
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

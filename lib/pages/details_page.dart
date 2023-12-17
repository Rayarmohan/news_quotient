import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_quotient/widgets/source_name_container.dart';

import '../model/articles_model.dart';

class DetailsPage extends StatelessWidget {

  final Article article;
  const DetailsPage({super.key,required this.article});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              image: DecorationImage(image: NetworkImage(article.urlToImage ?? ""),
              fit: BoxFit.cover),

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SourceNameContainer(article: article),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title ?? "",
                      style: GoogleFonts.domine(
                        color: Colors.red[700],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      article.description ?? "",
                      style: GoogleFonts.domine(
                          fontSize: 30
                      ),
                    ),
                    Text("Author : ${article.author}",
                      style: GoogleFonts.domine(
                          fontSize: 18,
                        color: Colors.red[700]
                      ),
                    ),
                    Text("Published at : ${article.publishedAt}",
                      style: GoogleFonts.domine(
                          fontSize: 18,
                          color: Colors.red[700]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],

      ),
    );
  }
}

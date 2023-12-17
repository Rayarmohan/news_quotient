import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_quotient/model/articles_model.dart';

class SourceNameContainer extends StatelessWidget {
  final Article article;
   const SourceNameContainer({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[700],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          article.source?.name ?? "",
          style: GoogleFonts.domine(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_quotient/widgets/source_name_container.dart';

import '../model/articles_model.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: 400,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: _isValidUrl(article.urlToImage)
                    ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: AspectRatio(
                    aspectRatio: 16/9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(article.urlToImage!),
                      ),
                    ),
                  ),
                )
                    :  const SizedBox(
                  height: 100,
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage("lib/assets/noimage.jpg"),
                    ),),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SourceNameContainer(article: article),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article.title ?? "",
                    style: GoogleFonts.domine(
                      fontSize: 18
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isValidUrl(String? url) {
    if (url == null || url.isEmpty) {
      return false;
    }

    Uri uri = Uri.parse(url);
    return uri.isScheme("http") || uri.isScheme("https");
  }
}

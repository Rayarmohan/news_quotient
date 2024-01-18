import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Text(
              "NewsQuotient",
              style: GoogleFonts.domine(color: Colors.red[700],
             fontSize: 35,
              fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  """Welcome NewsQuotient, I'm Rayar Mohan, the developer behind this application.
       My goal is to create an engaging and user-friendly experience that keeps you well-informed about the latest news.
       The app relies on the NewsAPI to deliver up-to-date news content from various sources and categories.
       It features real-time updates, allowing you to stay informed about current events as they unfold.
        You can personalize your news feed by selecting your favorite sources, topics, and categories.
        Feel free to reach my GitHub profile at github.com/Rayarmohan.
        Thank you for using NewsQuotient Enjoy exploring the latest news from around the world.""",
                  style: GoogleFonts.domine(color: Colors.black,
                  fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

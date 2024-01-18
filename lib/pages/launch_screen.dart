import 'dart:async';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_quotient/pages/bottom_navigation.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> const BottomNavPage()));
    });
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 300,),
            Center(
              child: Text(
                "NewsQuotient",
                style: GoogleFonts.domine(color: Colors.red[700],
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 300,),
            Text(
              "PoweredBy",
              style: GoogleFonts.domine(color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
              width: 125,
              child: Image.asset("lib/assets/newsapi.png",
                         ),
            )
          ],
        ),
      ),
    );
  }
}

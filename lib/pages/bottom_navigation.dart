import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_quotient/pages/home_page.dart';
import 'package:news_quotient/pages/info_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {

   int _selectedIndex = 0;
   List pages = const [HomePage(), InfoPage()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.red[700] ?? Colors.white,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const  [
           Icon(Icons.home,color: Colors.white,),
           Icon(Icons.info,color: Colors.white,)
        ],
      ),
      appBar: AppBar(
        title: Text(
          "NewsQuotient",
          style: GoogleFonts.domine(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.red[700],
      ),
      body: pages[_selectedIndex],
    );
  }
}

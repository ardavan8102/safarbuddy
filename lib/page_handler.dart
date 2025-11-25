import 'package:flutter/material.dart';
import 'package:safar_buddy/components/bottom_nav.dart';
import 'package:safar_buddy/ui/home.dart';
import 'package:safar_buddy/ui/travel_page.dart';

class PageHandler extends StatefulWidget {
  const PageHandler({super.key});

  @override
  State<PageHandler> createState() => _PageHandlerState();
}

class _PageHandlerState extends State<PageHandler> {
  int _selectedIndex = 0;

  // لیست صفحات
  final List<Widget> _pages = [
    HomePage(),
    TravelPage(),
    Center(child: Text("Library", style: TextStyle(color: Colors.black))),
    Center(child: Text("Profile", style: TextStyle(color: Colors.black))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}

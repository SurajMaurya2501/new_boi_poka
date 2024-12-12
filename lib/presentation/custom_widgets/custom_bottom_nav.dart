import "package:flutter/material.dart";
import "package:google_nav_bar/google_nav_bar.dart";

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav(
      {super.key,
      required this.screens,
      required this.activeColor,
      required this.tabBackgroundColor,
      required this.color,
      required this.length,
      required this.items});
  final List<Widget> screens;
  final Color activeColor;
  final Color tabBackgroundColor;
  final Color color;
  final List<Map<String, dynamic>> items;

  final int length;

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 15,
              activeColor: widget.activeColor,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: widget.tabBackgroundColor,
              color: widget.color,
              tabs: List.generate(
                widget.length,
                (index) => GButton(
                  onPressed: () => selectedIndex = index,
                  icon: widget.items[index]['icon'],
                  text: widget.items[index]['item'],
                ),
              ),
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                selectedIndex = index;
                setState(() {});
              },
            ),
          ),
        ),
        body: widget.screens[selectedIndex],
      );
}

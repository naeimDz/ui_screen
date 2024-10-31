import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _activeIndex = 0; // Tracks the selected item

  // Define items with icons and labels
  final List<Map<String, dynamic>> _navigationItems = [
    {"icon": Icons.home, "label": "Home"},
    {"icon": Icons.search, "label": "Search"},
    {"icon": Icons.person, "label": "Profile"},
    {"icon": Icons.explore, "label": "Explore"},
  ];

  // Define colors for active/inactive states
  final Color activeColor = Colors.cyan;
  final Color inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 8,
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buildNavigationItems(),
      ),
    );
  }

  // Build Navigation Items
  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (int i = 0; i < _navigationItems.length; i++) {
      list.add(buildNavigationItem(i));
    }
    return list;
  }

  // Build Each Navigation Item with Active State and Ripple Effect
  Widget buildNavigationItem(int index) {
    bool isActive = index == _activeIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 60,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? activeColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _navigationItems[index]["icon"],
              color: isActive ? activeColor : inactiveColor,
              size: 28,
            ),
            const SizedBox(height: 4),
            Text(
              _navigationItems[index]["label"],
              style: TextStyle(
                color: isActive ? activeColor : inactiveColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

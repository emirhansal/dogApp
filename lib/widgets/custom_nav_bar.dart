import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98.0,
      margin: EdgeInsets.lerp(
        const EdgeInsets.only(left: 0.0, right: 0.0),
        const EdgeInsets.only(left: 10.0, right: 10.0),
        0.5,
      ),
      decoration: BoxDecoration(
        color: HexColor("#E5E5EA"),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(Icons.home, "Home", 0),
          const VerticalDivider(
            width: 0.5,
            thickness: 1,
            indent: 24,
            endIndent: 20,
            color: Colors.grey,
          ),
          _buildNavItem(Icons.settings, "Settings", 1),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = index == currentIndex;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: isSelected ? Colors.blue : Colors.black,
              size: 32.0,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

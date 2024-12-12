import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  final IconData icon;

  const TabButton(
      {super.key,
      required this.label,
      required this.isActive,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.indigo : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isActive ? Colors.indigo : Colors.grey,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

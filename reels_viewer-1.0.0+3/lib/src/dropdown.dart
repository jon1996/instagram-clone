import 'package:flutter/material.dart';

class DropdownItem {
  final String text;
  final IconData icon;
  final Color? color;

  DropdownItem({
    required this.text,
    required this.icon,
    this.color,
  });
}

class DropdownItemWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  const DropdownItemWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " $text",
                  style: TextStyle(color: color, fontSize: 13),
                ),
                Icon(icon, color: color),
              ],
            ),
            SizedBox(height: 8),
            Divider(color: color, height: 0.3),
          ],
        ),
      ),
    );
  }
}

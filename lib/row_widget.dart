import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  const ReusableRow(this.icon, this.data,{super.key});
final IconData icon;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,
        size: 20,
        ),
        Text(data),
      ],
    );
  }
}

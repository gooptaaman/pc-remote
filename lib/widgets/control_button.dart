import 'package:flutter/material.dart';

class CustomRemoteButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function onTap;

  const CustomRemoteButton({this.icon, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(25),
      color: Colors.white,
      elevation: 10,
      shape: CircleBorder(),
      child: Icon(
        icon,
        size: 30,
        color: color,
      ),
      onPressed: onTap,
    );
  }
}

import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  
  final String coffeeType;
  final bool isSelected;
  final VoidCallBack onTap;
  CoffeeType({
    required this.coffeeType,
    required this.isSelected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return     GestureDetector(
      onTap: onTap,
      child: Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Text(coffeeType, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isSelected? Colors.orange: Colors.white),),
    ),
    );
  }
}

class VoidCallBack {
}
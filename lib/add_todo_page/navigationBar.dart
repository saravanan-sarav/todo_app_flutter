import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  const   NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey), // Grey border color
      ),
      child: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context); // Close the page on button press
        },
      ),
    );
  }
}

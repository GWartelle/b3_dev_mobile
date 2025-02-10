import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Profile page",
        style: TextStyle(
          color: Colors.white, // Change text color to white
          fontWeight: FontWeight.bold, // Make text bold
          fontSize: 20, // Optional: Adjust font size
        ),
      ),
      centerTitle: true,
      elevation: 3,
      backgroundColor: Colors.blue,
      shadowColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

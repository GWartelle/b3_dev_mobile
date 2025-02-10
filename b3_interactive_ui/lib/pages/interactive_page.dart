import 'package:flutter/material.dart';
import '../models/profile.dart';

class InteractivePage extends StatefulWidget {
  const InteractivePage({super.key});

  @override
  InteractivePageState createState() => InteractivePageState();
}

class InteractivePageState extends State<InteractivePage> {
  Profile profile =
      Profile(firstName: "YourFirstName", lastName: "YourLastName");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic UI"),
        elevation: 3,
        shadowColor: Colors.blue,
      ),
      body: Center(child: (Text(profile.firstName))),
    );
  }
}

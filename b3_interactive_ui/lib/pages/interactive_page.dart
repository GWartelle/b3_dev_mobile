import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/custom_app_bar.dart';

class InteractivePage extends StatefulWidget {
  const InteractivePage({super.key});

  @override
  InteractivePageState createState() => InteractivePageState();
}

class InteractivePageState extends State<InteractivePage> {
  late Profile profile;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController secretController;

  @override
  void initState() {
    super.initState();
    profile = Profile();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    secretController = TextEditingController();

    firstNameController.text = profile.firstName;
    lastNameController.text = profile.lastName;
    secretController.text = profile.secret;
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    secretController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(children: [
                          Text(
                            profile.firstName.isNotEmpty
                                ? "${profile.firstName} "
                                : "Firstname ",
                          ),
                          Text(profile.lastName.isNotEmpty
                              ? profile.lastName
                              : "Lastname"),
                          Spacer(),
                          Text("${profile.age.toString()} y/o")
                        ])
                      ],
                    ),
                  )),
                  TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your firstname",
                      ),
                      controller: firstNameController,
                      onChanged: (value) => setState(() {
                            profile.firstName = value;
                          })),
                  TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your lastname",
                      ),
                      controller: lastNameController,
                      onChanged: (value) => setState(() {
                            profile.lastName = value;
                          })),
                  Row(
                    children: [
                      Text("Select your age:"),
                      Spacer(),
                      DropdownButton(
                          value: profile.age,
                          items: List.generate(100, (index) {
                            int value = index + 1;
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }),
                          onChanged: (value) => {
                                setState(() {
                                  profile.age = value;
                                })
                              })
                    ],
                  ),
                  TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter your secret",
                      ),
                      controller: lastNameController,
                      onChanged: (value) => setState(() {
                            profile.secret = value;
                          })),
                ],
              ),
            )));
  }
}

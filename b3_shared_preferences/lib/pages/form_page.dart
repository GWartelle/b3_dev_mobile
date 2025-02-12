import 'package:b3_shared_preferences/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  FormPageState createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
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
    _loadProfile(); // Load stored values
  }

  _loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      profile.firstName = prefs.getString('firstName') ?? "";
      profile.lastName = prefs.getString('lastName') ?? "";
      profile.age = prefs.getInt('age');
      profile.gender =
          prefs.getString('gender') == "male" ? Gender.male : Gender.female;
      profile.secret = prefs.getString('secret') ?? "";
      profile.height = prefs.getDouble('height') ?? 170.0;

      firstNameController.text = profile.firstName;
      lastNameController.text = profile.lastName;
      secretController.text = profile.secret;
    });
  }

  _saveProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', profile.firstName);
    await prefs.setString('lastName', profile.lastName);
    await prefs.setInt('age', profile.age ?? 0);
    await prefs.setString(
        'gender', profile.gender == Gender.male ? "male" : "female");
    await prefs.setString('secret', profile.secret);
    await prefs.setDouble('height', profile.height);
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
      appBar: AppBar(
        title: const Text(
          "Edit profile",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        elevation: 4,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Align(
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
                        profile.firstName.isNotEmpty
                            ? Text("${profile.firstName} ")
                            : Text(
                                "Firstname ",
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                        profile.lastName.isNotEmpty
                            ? Text(profile.lastName)
                            : Text(
                                "Lastname",
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                        Spacer(),
                        profile.age != null
                            ? Text("${profile.age.toString()} y/o")
                            : Text(
                                "Age",
                                style: TextStyle(fontStyle: FontStyle.italic),
                              )
                      ]),
                      Row(
                        children: [
                          Icon(profile.gender == Gender.male
                              ? Icons.male
                              : Icons.female),
                          Text(
                              profile.gender == Gender.male ? "Male" : "Female")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.fingerprint),
                          profile.secret.isNotEmpty
                              ? Text(
                                  profile.secret.replaceAll(RegExp(r'.'), '*'))
                              : Text(
                                  "Secret",
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.height),
                          Text("${profile.height}")
                        ],
                      )
                    ],
                  ),
                )),
                TextField(
                  decoration:
                      const InputDecoration(hintText: "Enter your first name"),
                  controller: firstNameController,
                  onChanged: (value) {
                    setState(() {
                      profile.firstName = value;
                    });
                    _saveProfile();
                  },
                ),
                TextField(
                  decoration:
                      const InputDecoration(hintText: "Enter your last name"),
                  controller: lastNameController,
                  onChanged: (value) {
                    setState(() {
                      profile.lastName = value;
                    });
                    _saveProfile();
                  },
                ),
                Row(
                  children: [
                    const Text("Select your age:"),
                    const Spacer(),
                    DropdownButton<int>(
                      value: profile.age,
                      items: List.generate(100, (index) {
                        return DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text((index + 1).toString()),
                        );
                      }),
                      onChanged: (value) {
                        setState(() {
                          profile.age = value!;
                        });
                        _saveProfile();
                      },
                    ),
                  ],
                ),
                TextField(
                  obscureText: true,
                  decoration:
                      const InputDecoration(hintText: "Enter your secret"),
                  controller: secretController,
                  onChanged: (value) {
                    setState(() {
                      profile.secret = value;
                    });
                    _saveProfile();
                  },
                ),
                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("I'm ...",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio<Gender>(
                          value: Gender.male,
                          groupValue: profile.gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              profile.gender = value!;
                            });
                            _saveProfile();
                          },
                        ),
                        const Text('Male'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<Gender>(
                          value: Gender.female,
                          groupValue: profile.gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              profile.gender = value!;
                            });
                            _saveProfile();
                          },
                        ),
                        const Text('Female'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("I measure ...",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Slider(
                  value: profile.height,
                  onChanged: (value) {
                    setState(() {
                      profile.height = value.floorToDouble();
                    });
                    _saveProfile();
                  },
                  min: 0,
                  max: 250,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 4,
                      shadowColor: Colors.blue,
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ));
                  },
                  child: Text(
                    "View your profile page",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

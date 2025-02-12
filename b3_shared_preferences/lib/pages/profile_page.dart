import 'package:b3_shared_preferences/models/profile.dart';
import 'package:b3_shared_preferences/pages/form_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String firstName = "";
  String lastName = "";
  int? age;
  String gender = "";
  String secret = "";
  double height = 0.0;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  _loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString('firstName') ?? "";
      lastName = prefs.getString('lastName') ?? "";
      age = prefs.getInt('age');
      gender = prefs.getString('gender') ?? "";
      secret = prefs.getString('secret') ?? "";
      height = prefs.getDouble('height') ?? 170.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile page",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          elevation: 4,
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Image.network(
                'https://images.unsplash.com/photo-1523720131524-71ae6dbed986?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text(
                    "$firstName $lastName",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 4,
                        shadowColor: Colors.blue,
                        backgroundColor: Colors.blue),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormPage(),
                          ));
                    },
                    child: Text(
                      "Change your profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Divider(),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About me ...",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(children: [
                          Icon(Icons.cake),
                          age != null
                              ? Text("${age.toString()} y/o")
                              : Text(
                                  "Age",
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                )
                        ]),
                        Row(
                          children: [
                            Icon(gender == "male" ? Icons.male : Icons.female),
                            Text(gender)
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.height),
                            Text("${height.toString()} cm")
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

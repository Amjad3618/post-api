// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:post_api/pages/logIn_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final semaicontroller = TextEditingController();
  final spasswordcontroller = TextEditingController();
  final age = TextEditingController();

  void SignUp1(String name, String age, String gender) async {
    try {
      Response response = await post(
        Uri.parse("https://hayatpr.000webhostapp.com/smiApis/amjadPost.php"),
        body: {
          "name": name,
          "age": age,
          "gender": gender,
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        print(response.statusCode);
      } else {
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }

    // Navigator.push(context as BuildContext,
    //     MaterialPageRoute(builder: (context) => const LogInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register screen")),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Register User",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: semaicontroller,
                  decoration: InputDecoration(
                      hintText: "name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: spasswordcontroller,
                  decoration: InputDecoration(
                      hintText: "age",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: age,
                  decoration: InputDecoration(
                      hintText: "gender",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      SignUp1(
                          semaicontroller.text.toString(),
                          spasswordcontroller.text.toString(),
                          age.text.toString());
                    },
                    child: const Text("SignUp")),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogInPage()));
                    },
                    child: const Text("login"))
              ],
            ),
          ),
        ),
      )),
    );
  }
}

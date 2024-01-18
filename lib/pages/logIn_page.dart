// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final lemaicontroller = TextEditingController();
  final lpasswordcontroller = TextEditingController();
  final lage = TextEditingController();

  void login1(
      String lemaicontroller, String lpasswordcontroller, String lage) async {
    try {
      Response response = await post(
        Uri.parse("https://hayatpr.000webhostapp.com/smiApis/login.php"),
        body: {
          "name": lemaicontroller,
          "age": lpasswordcontroller,
          "gender": lage
        },
      );

      // Handle the response here (e.g., check for successful login)
      print("Login Response: ${response.statusCode}");
      print("Response Body: ${response.body}");

      // Add your logic to handle the login response
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("login screen")),
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
                  "login User",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: lemaicontroller,
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
                  controller: lpasswordcontroller,
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
                  controller: lage,
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
                      login1(
                          lemaicontroller.text.toString(),
                          lpasswordcontroller.text.toString(),
                          lage.text.toString());
                    },
                    child: const Text("login")),
                const SizedBox(
                  height: 20,
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const SignUpPage()));
                //     },
                //     child: const Text("SignUp"))
              ],
            ),
          ),
        ),
      )),
    );
  }
}

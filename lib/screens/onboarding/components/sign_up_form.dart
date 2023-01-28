// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});
  final fa.FirebaseAuth fba = fa.FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final myName = TextEditingController();
    final myEmail = TextEditingController();
    final myPass = TextEditingController();
    final myUrl = TextEditingController();

    return Flexible(
        child: SingleChildScrollView(
            child: Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Name",
            style: TextStyle(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              controller: myName,
              decoration: (const InputDecoration(
                  prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
              ))),
            ),
          ),
          const Text(
            "Email",
            style: TextStyle(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              controller: myEmail,
              decoration: (const InputDecoration(
                  prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
              ))),
            ),
          ),
          const Text(
            "Password",
            style: TextStyle(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              obscureText: true,
              controller: myPass,
              decoration: (const InputDecoration(
                  prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
              ))),
            ),
          ),
          const Text(
            "Leetcode Profile URL",
            style: TextStyle(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              controller: myUrl,
              decoration: (const InputDecoration(
                  prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
              ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 40),
            child: Column(children: [
              ElevatedButton.icon(
                onPressed: () {},
                // onPressed: () async {
                //   try {
                //     await fba.createUserWithEmailAndPassword(
                //         email: myEmail.text, password: myPass.text);
                //   } catch (e) {
                //     final snackBar = SnackBar(content: Text(e.toString()));
                //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //   }
                // },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 47, 214, 83),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(25),
                    ))),
                icon: const Icon(
                  CupertinoIcons.arrow_right,
                  color: Color.fromARGB(255, 53, 250, 3),
                ),
                label: const Text("Submit"),
              ),
            ]),
          )
        ],
      ),
    )));
  }
}

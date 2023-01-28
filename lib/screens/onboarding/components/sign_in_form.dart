import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'sign_up_form.dart';
import '../../entryPoint/entry_point.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;

class SignInForm extends StatelessWidget {
  SignInForm({
    Key? key,
  }) : super(key: key);
  final fa.FirebaseAuth fba = fa.FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final myEmail = TextEditingController();
    final myPass = TextEditingController();
    return Flexible(
        child: SingleChildScrollView(
            child: Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email",
            style: TextStyle(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              controller: myEmail,
              decoration: (InputDecoration(
                  prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset("assets/icons/email.svg"),
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
              controller: myPass,
              obscureText: true,
              decoration: (InputDecoration(
                  prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset("assets/icons/password.svg"),
              ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 24),
            child: ElevatedButton.icon(
              onPressed: () async {
                try {
                  await fba.signInWithEmailAndPassword(
                      email: myEmail.text, password: myPass.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EntryPoint()));
                } catch (e) {
                  final snackBar = SnackBar(content: Text(e.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF77D8E),
                minimumSize: const Size(double.infinity, 56),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
              ),
              icon: const Icon(
                CupertinoIcons.arrow_right,
                color: Color(0xffFE0037),
              ),
              label: const Text("Sign In"),
            ),
          ),
          Row(
            children: const [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Text(
                  "OR",
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              Expanded(child: Divider()),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
            child: Text(
              "                  Sign up using your Email ID",
              style: TextStyle(color: Colors.white60),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 70),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    showGeneralDialog(
                      barrierDismissible: true,
                      barrierLabel: "Sign Up",
                      context: context,
                      pageBuilder: (context, _, __) => Center(
                        child: Container(
                          height: 720,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.symmetric(
                              vertical: 32, horizontal: 24),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 27, 25, 25)
                                .withOpacity(0.98),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Column(
                              children: [
                                Text("Sign Up",
                                    style: TextStyle(
                                        fontSize: 34,
                                        fontFamily: "Poppins",
                                        color: Colors.white)),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Text(
                                    "Sign Up by entering the required details. Also make sure you have account on 'LeetCode' Platform.",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SignUpForm(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 124, 110, 232),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Color.fromARGB(255, 16, 42, 211),
                  ),
                  label: const Text("Sign Up"),
                ),
              ],
            ),
          )
        ],
      ),
    )));
  }
}

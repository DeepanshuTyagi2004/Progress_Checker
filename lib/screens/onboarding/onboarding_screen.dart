import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/constants.dart';

import './components/animation_btn.dart';
import 'components/sign_in_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

// Lets run the app
class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationColtroller;

  @override
  void initState() {
    _btnAnimationColtroller = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // For backgroud animation
          // for blur
          Positioned(
            // height: 100,
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          //Adding text
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                SizedBox(
                  width: 260,
                  child: Column(
                    children: const [
                      Text(
                        "Learn design & code",
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: "Poppins",
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Welcome to the Icosmic Application. Through this app you will get better at coding by solving our daily problems. Trust us this journey would be fun and full of knowledge.",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                // animated start button
                const Spacer(flex: 2),
                AnimatedBtn(
                  btnAnimationColtroller: _btnAnimationColtroller,
                  press: () {
                    _btnAnimationColtroller.isActive = true;
                    showGeneralDialog(
                      // This is for the sign in page
                      // We have to close this page when tapped outside
                      barrierDismissible: true,
                      barrierLabel: "Sign In",
                      context: context,
                      pageBuilder: (context, _, __) => Center(
                        child: Container(
                          height: 720,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.symmetric(
                              vertical: 32, horizontal: 24),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 27, 25, 25)
                                .withOpacity(0.94),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Column(
                              children: [
                                Text("Sign In",
                                    style: TextStyle(
                                        fontSize: 34,
                                        fontFamily: "Poppins",
                                        color: Colors.white)),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Text(
                                    "Sign In to get access to the content of the application and to explore the app. Sign In through one of the methods given below.",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SignInForm(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    "This app is brought to you by The Alan Turing Club, Bennett University Greater Noida",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

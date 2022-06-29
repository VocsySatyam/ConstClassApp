import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../Constant/authentication_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// Use For Rounded Loading Button Controller (Key Word : Use_of_Rounded_Loading_Button)
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    /// Splash Hold Using Timer
    // Timer(
    //     Duration(seconds: 3),
    //         () =>
    //         Navigator.of(context).pushReplacement(MaterialPageRoute(
    //             builder: (BuildContext context) => true ? HomePage() : LogIn())));

    /// Splash Hold Using Future Delay
    // Future.delayed(
    //     const Duration(seconds: 3),
    //         () => Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => true ? HomePage() : LogIn()),
    //     ));

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset(
              "Assets/ImagesPng/SplashFoxLogo.png",

              /// .h & .w Is Use For Responsive ( Use_Of_ScreenUtils )
              height: 350.h,
              width: 350.w,
              fit: BoxFit.cover,
            ),
            const Text("Hello Splash"),
            const Spacer(),

            /// Use For Rounded Loading Button (Key Word : Use_of_Rounded_Loading_Button)
            RoundedLoadingButton(
              controller: _btnController,
              onPressed: () async {
                /// There Is Constant Method Of **googleSignIn()** You Get Data Here Example Print_Data_beloved
                await googleSignIn().then((value) {
                  print("User Name = ${value!.user!.displayName}");
                  print("User Name = ${value.user!.displayName}");
                  print("User Name = ${value.user!.displayName}");

                  /// This is Use For Stop Loading
                  _btnController.success();
                });
              },
              child: const Text('Google Login',
                  style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

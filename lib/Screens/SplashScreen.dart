import 'package:firebase/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../Constant/authentication_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// Use For Rounded Loading Button Controller (Key Word : Use_of_Rounded_Loading_Button)
  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _btnController3 =
      RoundedLoadingButtonController();

  /// This Widget use For Name And Logo In Button
  Widget buttonChild({required IconData icon, required String name}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SizedBox(
          width: 10.w,
        ),
        Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Splash Hold Using Timer
    // Timer(
    //     Duration(seconds: 3),
    //         () =>
    //         Navigator.of(context).pushReplacement(MaterialPageRoute(
    //             builder: (BuildContext context) => true ? HomePage() : LogIn())));

    /// Splash Hold Using Future Delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    });

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Here I setUp SVG picture From Assets (Key Word : Use_of_Flutter_SVG)
            Image.asset(
              "Assets/ImagesPng/Untitled-1.png",
              height: 150,
              width: 250,
            ),
          ],
        ),
      ),
    );
  }
}

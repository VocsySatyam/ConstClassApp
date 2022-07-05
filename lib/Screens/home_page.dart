import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../Constant/authentication_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   elevation: 0.0,
      //   centerTitle: true,
      //   backgroundColor: Colors.amber,
      //   title: Text(
      //     "Flutter Functionality",
      //     style: TextStyle(fontSize: 20.sp, color: Colors.deepPurple),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.amber,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Here I setUp SVG picture From Assets (Key Word : Use_of_Flutter_SVG)
              Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 15).r,
                  child: Image.asset(
                    "Assets/ImagesPng/Untitled-1.png",
                    height: 150,
                    width: 250,
                  )),

              /// This is For Google Login
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0).r,

                /// Use For Rounded Loading Button (Key Word : Use_of_Rounded_Loading_Button)
                child: RoundedLoadingButton(
                  controller: _btnController1,
                  onPressed: () async {
                    /// There Is Constant Method Of **googleSignIn()** You Get Data Here Example Print_Data_beloved
                    /// (Key Word : Use_of_Google_Login)
                    await googleSignIn().then((value) {
                      print("Google User Name = ${value!.user!.displayName}");
                      print("Google User Email = ${value.user!.email}");
                      print("Google User PhotoURL = ${value.user!.photoURL}");
                      print(
                          "Google User PhoneNumber = ${value.user!.phoneNumber}");

                      /// This is Use For Stop Loading
                      setState(() {
                        _btnController1.reset();
                      });
                    });
                  },
                  child: buttonChild(
                      icon: Icons.email_rounded, name: "Google Login"),
                ),
              ),

              /// This is For FaceBook Login
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0).r,

                /// Use For Rounded Loading Button (Key Word : Use_of_Rounded_Loading_Button)
                child: RoundedLoadingButton(
                  controller: _btnController2,
                  onPressed: () async {
                    /// There Is Constant Method Of **FaceBookLogin()** You Get Data Here Example Print_Data_beloved
                    /// (Key Word : Use_of_FaceBook_Login)
                    /// See Android And Ios SetUp At(https://facebook.meedu.app)
                    await facebookSignIn().then((value) {
                      print("FaceBook User Name = ${value!.user!.displayName}");
                      print("FaceBook User Name = ${value.user!.displayName}");
                      print("FaceBook User Name = ${value.user!.displayName}");

                      /// This is Use For Stop Loading
                      setState(() {
                        _btnController2.success();
                      });
                    });
                  },
                  child: buttonChild(
                      icon: Icons.facebook_rounded, name: "FaceBook Login"),
                ),
              ),

              /// This is For Apple Login
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0).r,

                /// Use For Rounded Loading Button (Key Word : Use_of_Rounded_Loading_Button)
                child: RoundedLoadingButton(
                  controller: _btnController3,
                  onPressed: () async {
                    /// There Is Constant Method Of **FaceBookLogin()** You Get Data Here Example Print_Data_beloved
                    /// (Key Word : Use_of_FaceBook_Login)
                    /// See Android And Ios SetUp At(https://facebook.meedu.app)
                    await appleLogin().then((value) {
                      print(
                          "FaceBook User Name = ${value!.email ?? "No Email Access"}");
                      print(
                          "FaceBook User Name = ${value.familyName ?? "No Family Name Access"}");
                      print(
                          "FaceBook User Name = ${value.givenName ?? "No Given Name Access"}");

                      /// This is Use For Stop Loading
                      setState(() {
                        _btnController3.success();
                      });
                    });
                  },
                  child: buttonChild(
                      icon: Icons.apple_rounded, name: "Apple Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

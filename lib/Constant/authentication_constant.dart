import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// (Key Word : Use_of_Google_Login)
Future<UserCredential?> googleSignIn() async {
  /// Step : 1 -- Use Fore Google Login
  final GoogleSignIn googleSignIn = GoogleSignIn();

  /// Step : 2 --
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  /// Step : 3 -- Check That There Is Any Google Account In Your Phone Or Not
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    /// Step : 4 -- Auth Credential Use FirBaseAuth Which Provide IdToken & AccessToken (Key Word : Use_of_FireBase_Auth)
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    /// Step : 5 -- Get User Data
    UserCredential result =
        await FirebaseAuth.instance.signInWithCredential(authCredential);
    return result;
  } else {
    print("Google SignIn Error There Is No Google Account Or No InterNet");
    return null;
  }
}

/// Before Code YOu should SetUp Facebook Developer Account Documentation In Pub Dev (flutter_facebook_auth)
/// See Android And Ios SetUp At(https://facebook.meedu.app)
/// (Key Word : Use_of_FaceBook_Login)
Future<UserCredential?> facebookSignIn() async {
  try {
    /// Step : 1 -- Simply Get FaceBook Request & Get Auth Details
    final LoginResult result = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile']);

    /// Step : 2 -- If Result Not Null
    switch (result.status) {
      case LoginStatus.success:

        /// Step : 3 -- Auth Credential Use FirBaseAuth Which Provide IdToken & AccessToken (Key Word : Use_of_FireBase_Auth)
        final AuthCredential facebookCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);

        /// Step : 4 -- Get user Data
        final userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookCredential);
        return userCredential;
      case LoginStatus.cancelled:
        return null;
      case LoginStatus.failed:
        return null;
      default:
        return null;
    }
  } on FirebaseAuthException catch (e, stacktrace) {
    print("Error $e");
    print("StackTrace $stacktrace");
  }
}

Future<AuthorizationCredentialAppleID?> appleLogin() async {
  try {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    return credential;
  } on Exception catch (e) {
    print(e.toString());
    return null;
  }
}

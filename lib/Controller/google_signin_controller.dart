import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  var user = ''.obs;
  var email = ''.obs;
  void googleSignin() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    var authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    user.value = authResult.user.displayName.toString();
    email.value = authResult.user.email.toString();
  }
}
